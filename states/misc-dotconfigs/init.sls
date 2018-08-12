{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}

curl-config:
  file.managed:
    - name: {{ absolute_home_path }}/.curlrc
    - source: salt://{{ slspath }}/files/curlrc
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

hushlogin-config:
  file.managed:
    - name: {{ absolute_home_path }}/.hushlogin
    - source: salt://{{ slspath }}/files/hushlogin
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

screenrc-config:
  file.managed:
    - name: {{ absolute_home_path }}/.screenrc
    - source: salt://{{ slspath }}/files/screenrc
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

tmux-config:
  file.managed:
    - name: {{ absolute_home_path }}/.tmux.conf
    - source: salt://{{ slspath }}/files/tmux.conf
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

wget-config:
  file.managed:
    - name: {{ absolute_home_path }}/.wgetrc
    - source: salt://{{ slspath }}/files/wgetrc
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}
