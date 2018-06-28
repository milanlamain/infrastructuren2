/etc/munin/munin.conf:
  file.append:
    - text: |
         [muninnode]
             address ^10\.0\.0\.5$
             use_node_name yes