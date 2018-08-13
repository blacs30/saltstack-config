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
