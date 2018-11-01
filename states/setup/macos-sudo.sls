include:
    - setup.command-line-tools

apply-macos-sudo-config:
  cmd.script:
    - name: salt://{{ slspath }}/files/macos-sudo-config.sh
