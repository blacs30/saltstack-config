{% from "packages/packages.jinja" import mac_graphic_apps with context %}

{% for package in mac_graphic_apps | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew cask upgrade {{ package }} || brew cask install {{ package }}
    - onlyif: if brew cask ls --versions | grep -q $(basename {{ package }}); then brew cask outdated | grep -q $(basename {{ package }}); else return 1; fi
{% endfor %}

{%- if grains['os'] == 'MacOS' %}
download adobe cc installer:
  cmd.run:
    - name: brew cask upgrade adobe-creative-cloud || brew cask install adobe-creative-cloud
    - onlyif: if brew cask ls --versions | grep -q adobe-creative-cloud; then brew cask outdated | grep -q adobe-creative-cloud; else return 1; fi

install adobe cc:
  cmd.run:
    - name: /usr/local/Caskroom/adobe-creative-cloud/latest/Creative\ Cloud\ Installer.app/Contents/MacOS/Install
    - require:
      - cmd: download adobe cc installer

make sure file does not exist ps6.dmg:
  file.absent:
    - name: /tmp/ps6.dmg

install ps6:
  cmd.script:
    - name: salt://{{ slspath }}/files/install-ps6.sh
    - require:
      - file: make sure file does not exist ps6.dmg

remove tmp dmg after setup:
  file.absent:
    - name: /tmp/ps6.dmg
    - require:
      - cmd: install ps6
{% endif %}
