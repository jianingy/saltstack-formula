{% from "formula/sudoers/package-map.jinja" import pkgs with context %}

pkg_sudo:
  pkg.installed:
    - name: {{ pkgs.sudo }}

/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://formula/sudoers/files/sudoers
    - context:
        included: False
    - require:
      - pkg: pkg_sudo
