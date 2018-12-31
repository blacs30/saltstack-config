# Enable and start ssh server
ssh:
  service.running:
    - enable: True

/etc/wpa_supplicant/wpa_supplicant.conf:
  file.managed:
    - source: salt://{{ slspath }}/files/wpa_supplicant.conf

cups:
  pkg.installed:

pi:
  user.present:
  - groups:
    - lpadmin

cupsctl --remote-any:
  cmd.run

/etc/cups/cupsd.conf:
  file.line:
  - content: ServerAlias *
  - mode: ensure
  - before: LogLevel 

pi user permissions for cups:
  cmd.run:
  - name: sed -i 's/@SYSTEM/@SYSTEM pi/g /etc/cups/cupsd.conf'
  - unless:  grep '@SYSTEM pi' /etc/cups/cupsd.conf

cups:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - cmd: cupsctl --remote-any
      - file: /etc/cups/cupsd.conf
      - cmd: pi user permissions for cups
