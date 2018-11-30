{% from "packages/packages.jinja" import mac_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% for package in mac_packages | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew upgrade {{ package }} || brew install {{ package }}
    - onlyif: if brew ls --versions | grep -q {{ package }}; then brew outdated | grep -q {{ package }}; else return true; fi
{% endfor %}


install or upgrade gnupg:
  cmd.run:
    - name: brew upgrade gnupg || brew install gnupg
    - onlyif: if brew cask ls --versions | grep -q gnupg; then brew cask outdated | grep -q gnupg; else return 1; fi

install or upgrade pinentry-mac:
  cmd.run:
    - name: brew upgrade pinentry-mac || brew install pinentry-mac
    - onlyif: if brew cask ls --versions | grep -q pinentry-mac; then brew cask outdated | grep -q pinentry-mac; else return 1; fi
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
