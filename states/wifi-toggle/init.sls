# https://gist.github.com/albertbori/1798d88a93175b9da00b
/Library/Scripts/toggleAirport.sh:
  file.managed:
    - source: salt://{{ slspath }}/toggleAirport.sh
    - user: root
    - mode: 755


/Library/LaunchAgents/com.mine.toggleairport.plist:
  file.managed:
    - source: salt://{{ slspath }}/com.mine.toggleairport.plist
    - user: root
    - mode: 644

enable launch agent:
  cmd.run:
  - name: sudo launchctl load /Library/LaunchAgents/com.mine.toggleairport.plist
  - require:
    - file: /Library/Scripts/toggleAirport.sh
    - file: /Library/LaunchAgents/com.mine.toggleairport.plist
