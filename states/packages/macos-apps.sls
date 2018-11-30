{% from "packages/packages.jinja" import mac_cask_packages with context %}

update brew and packages:
  cmd.run:
    - name: brew upgrade; brew cask upgrade

{% for package in mac_cask_packages | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew install {{ package }}
    - onlyif: if brew cask ls --versions | grep -q $(basename {{ package }}); then brew cask outdated | grep -q $(basename {{ package }}); else return 0; fi
{% endfor %}
