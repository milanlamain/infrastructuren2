/etc/munin/munin.conf:
  file.append:
    - text:
      - "dbdir /var/lib/munin"
      - "htmldir /var/cache/munin/www"
      - "logdir /var/log/munin"
      - "rundir /var/run/munin"

/etc/munin/munin.conf:
  file.replace:
   - name: /etc/munin/munin.conf
   - pattern: "localhost.localdomain"
   - repl: "muninmaster"
      