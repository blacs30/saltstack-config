{% from "packages/packages.jinja" import mac_pip_packages with context %}
{% from "packages/packages.jinja" import mac_pip3_packages with context %}

{% for pip_package in mac_pip_packages %}
pip-{{ pip_package }}:
  cmd.run:
    - name: python2 -m pip install -U {{ pip_package }} --user
    - unless: python2 -m pip list --format=legacy | grep -q {{ pip_package }}
{% endfor %}

{% for pip3_package in mac_pip3_packages %}
pip3-{{ pip3_package }}:
  cmd.run:
    - name: python3 -m pip install -U {{ pip3_package }} --user
    - unless: python3 -m pip list --format=legacy | grep -q {{ pip3_package }}
{% endfor %}
