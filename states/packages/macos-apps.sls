{% from "packages/packages.jinja" import mas_apps with context %}
{% from "packages/packages.jinja" import mac_cask_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% for app in mas_apps | sort %}
mas-{{ app }}:
  cmd.run:
    - name: mas install  {{ mas_apps[app] }}
    - unless: mas list | grep -q {{ mas_apps[app] }}
    - require:
        - pkg: mas
{% endfor %}


{% for package in mac_cask_packages | sort %}
install or upgrade gnupg via brew package {{ package }}:
  cmd.run:
    - name: brew upgrade {{ package }} || brew install {{ package }}
{% endfor %}
