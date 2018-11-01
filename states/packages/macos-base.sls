{% from "packages/packages.jinja" import mas_apps with context %}
{% from "packages/packages.jinja" import mac_packages with context %}
{% from "packages/packages.jinja" import mac_pip_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% for package in mac_packages | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew upgrade {{ package }} || brew install {{ package }}
{% endfor %}


install or upgrade gnupg:
  cmd.run:
    - name: brew upgrade gnupg || brew install gnupg

install or upgrade pinentry-mac:
  cmd.run:
    - name: brew upgrade pinentry-mac || brew install pinentry-mac
  file.append:
    - name: {{ absolute_home_path }}/.gnupg/gpg-agent.conf
    - text: 'pinentry-program /usr/local/bin/pinentry-mac'

install-swift-trash:
  cmd.run:
    - name: brew install --HEAD macmade/tap/trash
    - unless: type trash

install-github-search-cli:
  cmd.run:
    - name: npm install -g gh-search-cli
    - unless: type ghs

install-cloudflare-cli:
  cmd.run:
    - name: npm install -g cloudflare-cli
    - unless: type cfcli

{% for pip_package in mac_pip_packages %}
pip-{{ pip_package }}:
  pip.installed:
    - name: {{ pip_package }}
{% endfor %}
