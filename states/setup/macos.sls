{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

install-pyobjc-for-salt:
  cmd.run:
    - name: /usr/local/Cellar/salt/2018.3.2/libexec/bin/pip install PyObjC
    - unless: /usr/local/Cellar/salt/2018.3.2/libexec/bin/python -c 'import Foundation' > /dev/null 2&>1


apply-macos-defaults:
  cmd.script:
    - name: salt://{{ slspath }}/files/macos-defaults.sh

apply-macos-init:
  cmd.script:
    - name: salt://{{ slspath }}/files/macos-init.sh

install-fonts:
  archive.extracted:
    - source: https://github.com/powerline/fonts/archive/master.zip
    - source_hash: sha1=7df7f31ec9270647746eae18c48f4ec2dafaaa2e
    - name: {{ absolute_home_path }}/.powerline-fonts
  cmd.run:
    - name: {{ absolute_home_path }}/.powerline-fonts/fonts-master/install.sh
