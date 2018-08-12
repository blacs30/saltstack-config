{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}

vim-ultimate-install:
  git.latest:
    - name: https://github.com/amix/vimrc.git
    - target: {{ absolute_home_path }}/.vim_runtime
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains['username'] }}
    - unless: test -d {{ absolute_home_path }}/.vim_runtime

vim-configuration:
  file.managed:
    - name: {{ absolute_home_path }}/.vimrc
    - source: salt://{{ slspath }}/vimrc
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

vim-myconfig:
  file.managed:
    - name: {{ absolute_home_path }}/.vim_runtime/my_configs.vim
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}
    - contents: |
        " Use the OS clipboard
        set clipboard=unnamedplus,unnamed,autoselect
