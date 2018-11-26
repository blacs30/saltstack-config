{%- if grains['os'] == 'MacOS' and grains.get('osrelease_info')[:2] < [10, 14] %}
install xcode-select:
  cmd.run:
    - name: |
        # create the placeholder file that's checked by CLI updates' .dist code
        # in Apple's SUS catalog
        touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        # find the CLI Tools update
        PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
        # install it
        softwareupdate -i "$PROD" -v
    - unless: xcode-select --install 2>&1 | grep installed

{% elif grains['os'] == 'MacOS' %}

make sure file does not exist:
  file.absent:
    - name: /tmp/clt.dmg

create tmp dmg  file:
  file.managed:
    - name: /tmp/clt.dmg
    - source: salt://{{ slspath }}/files/Command_Line_Tools_macOS_10.14_for_Xcode_10.dmg
    # - source_hash: sha256=3e52c644faa958f1af0be5afd6b520aaa66673e9c3c4a87e17d0dea70693f6c8
    - skip_verify: True
    - require:
      - file: make sure file does not exist

install developer headers:
  cmd.script:
    - name: salt://{{ slspath }}/files/install-clt.sh
    - require:
      - file: create tmp dmg  file

remove tmp dmg after setup:
  file.absent:
    - name: /tmp/clt.dmg
    - require:
      - cmd: install developer headers
{% endif %}
