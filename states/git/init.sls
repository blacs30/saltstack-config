{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}
git-config:
  file.managed:
    - name: {{ absolute_home_path }}/.gitconfig
    - source: salt://{{ slspath }}/config
    - user: grains['username'] }}
    - group: grains['groupname'] }}
    - force: True

git-ignore:
  file.managed:
    - name: {{ absolute_home_path }}/.gitignore
    - source: salt:///{{ slspath }}/ignore
    - user: grains['username'] }}
    - group: grains['groupname'] }}
    - force: True

git-templates-commit:
  file.recurse:
    - name: {{ absolute_home_path }}/git-templates/
    - source: salt:///{{ slspath }}/templates
    - user: grains['username'] }}
    - group: grains['groupname'] }}
    - clean: True
    - makedirs: True
