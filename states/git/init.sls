{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}
git-config:
  file.managed:
    - name: {{ absolute_home_path }}/.gitconfig
    - source: salt://{{ slspath }}/gitconfig
    - user: {{ grains['username'] }}
    - force: True

git-ignore:
  file.managed:
    - name: {{ absolute_home_path }}/.gitignore
    - source: salt://{{ slspath }}/gitignore
    - user: {{ grains['username'] }}
    - force: True

git-templates-commit:
  file.recurse:
    - name: {{ absolute_home_path }}/git-templates/
    - source: salt://{{ slspath }}/templates
    - user: {{ grains['username'] }}
    - clean: True
    - makedirs: True
