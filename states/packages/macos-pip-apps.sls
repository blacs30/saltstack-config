{% from "packages/packages.jinja" import mac_pip_packages with context %}

{% for pip_package in mac_pip_packages %}
pip-{{ pip_package }}:
  pip.installed:
    - name: {{ pip_package }}
{% endfor %}
