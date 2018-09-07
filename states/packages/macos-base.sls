{% from "packages/packages.jinja" import mas_apps with context %}
{% from "packages/packages.jinja" import mac_packages with context %}
{% from "packages/packages.jinja" import mac_pip_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

install xcode-select:
  cmd.run:
    - name: |
        # create the placeholder file that's checked by CLI updates' .dist code
        # in Apple's SUS catalog
        touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
        # find the CLI Tools update
        PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
        # install it
        softwareupdate -i "$PROD" -v
    - unless: xcode-select --install 2>&1 | grep installed

{% for package in mac_packages %}
brew-{{ package }}:
  pkg.installed:
    - name: {{ package }}
    - unless: if [[ {{ package }} == *"cask"* ]]; then brew cask list | grep $(basename {{ package }}); else brew list | grewp $(basename package);fi
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
