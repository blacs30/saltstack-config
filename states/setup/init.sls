include:
    - setup.{{ grains['os_family'] | lower }}
    - setup.{{ grains['os_family'] | lower }}-sudo
