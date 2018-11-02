{% from "packages/packages.jinja" import mas_apps with context %}

{% for app in mas_apps | sort %}
mas-{{ app }}:
  cmd.run:
    - name: mas install  {{ mas_apps[app] }}
    - unless: mas list | grep -q {{ mas_apps[app] }}
    - onlyif: type mas
{% endfor %}
