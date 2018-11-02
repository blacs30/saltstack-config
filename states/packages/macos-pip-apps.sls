{% from "packages/packages.jinja" import mac_pip_packages with context %}
{% from "packages/packages.jinja" import mac_pip3_packages with context %}

{% for pip_package in mac_pip_packages %}
pip-{{ pip_package }}:
  cmd.run:
    - name: pip2 install {{ pip_package }}
    - unless: pip2 list | grep -q {{ pip_package }}
{% endfor %}

{% for pip3_package in mac_pip3_packages %}
pip3-{{ pip3_package }}:
  cmd.run:
    - name: pip3 install {{ pip3_package }}
    - unless: pip3 list | grep -q {{ pip3_package }}
{% endfor %}
