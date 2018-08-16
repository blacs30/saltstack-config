{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

gpg-config:
  file.managed:
    - name: {{ absolute_home_path }}/.gnupg/gpg.conf
    - source: salt://gpg/gpg.conf
    - user: {{ grains['username'] }}
    - makedirs: True

gpg-agent-config:
  file.managed:
    - name: {{ absolute_home_path }}/.gnupg/gpg-agent.conf
    - source: salt://gpg/gpg-agent.conf
    - user: {{ grains['username'] }}
