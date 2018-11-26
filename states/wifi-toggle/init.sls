# https://gist.github.com/albertbori/1798d88a93175b9da00b
/tmp/toggleAirport.sh:
  file.managed:
    - source: salt://{{ slspath }}/files/toggleAirport.sh
    - user: root
    - mode: 755

/tmp/com.mine.toggleairport.plist:
  file.managed:
    - source: salt://{{ slspath }}/files/com.mine.toggleairport.plist
    - user: root
    - mode: 644

enable launch agent:
  cmd.run:
  - name: |
      sudo mv -f /tmp/toggleAirport.sh /Library/Scripts/toggleAirport.sh;
      sudo mv -f /tmp/com.mine.toggleairport.plist /Library/LaunchAgents/com.mine.toggleairport.plist;
      sudo launchctl load /Library/LaunchAgents/com.mine.toggleairport.plist;
  - require:
    - file: /tmp/toggleAirport.sh
    - file: /tmp/com.mine.toggleairport.plist
