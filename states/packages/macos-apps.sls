{% from "packages/packages.jinja" import mac_cask_packages with context %}

{% for package in mac_cask_packages | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew upgrade {{ package }} || brew install {{ package }}
{% endfor %}
