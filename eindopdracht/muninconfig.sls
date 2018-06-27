/srv/top.sls:
  file.append:
    - text:
      - "dbdir /var/lib/munin"
      - "htmldir /var/cache/munin/www"
      - "logdir /var/log/munin"
      - "rundir /var/run/munin"

      