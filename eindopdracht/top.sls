apache2:
  pkg.installed: []
  service.running:
    - require:
      - pkg: apache2

munin:
  pkg.installed:
    - pkg: munin