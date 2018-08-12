{% from "packages/packages.jinja" import mas_apps with context %}
{% from "packages/packages.jinja" import mac_packages with context %}
{% from "packages/packages.jinja" import mac_pip_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}


{% for app in mas_apps %}
mas-{{ app }}:
  cmd.run:
    - name: mas install  {{ mas_apps[app] }}
    - unless: mas list | grep -q {{ mas_apps[app] }}
    - require:
        - pkg: mas
{% endfor %}


{% for package in mac_packages %}
brew-{{ package }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %}

gnupg:
  pkg.installed:
    - pkgs:
      - gnupg
      - pinentry-mac
  file.append:
    - name: {{ absolute_home_path }}/.gnupg/gpg-agent.conf
    - text: 'pinentry-program /usr/local/bin/pinentry-mac'

install-swift-trash:
  cmd.run:
    - name: brew install --HEAD macmade/tap/trash
    - unless: type trash

install-cloudflare-cli:
  cmd.run:
    - name: npm install -g cloudflare-cli
    - unless: type cfcli

{% for pip_package in mac_pip_packages %}
pip-{{ pip_package }}:
  pip.installed:
    - name: {{ pip_package }}
{% endfor %}
