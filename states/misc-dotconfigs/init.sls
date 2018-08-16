{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

curl-config:
  file.managed:
    - name: {{ absolute_home_path }}/.curlrc
    - source: salt://{{ slspath }}/files/curlrc
    - user: {{ grains['username'] }}

hushlogin-config:
  file.managed:
    - name: {{ absolute_home_path }}/.hushlogin
    - source: salt://{{ slspath }}/files/hushlogin
    - user: {{ grains['username'] }}

screenrc-config:
  file.managed:
    - name: {{ absolute_home_path }}/.screenrc
    - source: salt://{{ slspath }}/files/screenrc
    - user: {{ grains['username'] }}

tmux-config:
  file.managed:
    - name: {{ absolute_home_path }}/.tmux.conf
    - source: salt://{{ slspath }}/files/tmux.conf
    - user: {{ grains['username'] }}

wget-config:
  file.managed:
    - name: {{ absolute_home_path }}/.wgetrc
    - source: salt://{{ slspath }}/files/wgetrc
    - user: {{ grains['username'] }}
