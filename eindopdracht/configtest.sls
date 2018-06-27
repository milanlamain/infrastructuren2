configtest:
  file.replace:
   - name: /srv/top.sls
   - pattern: "[localhost.localdomain]"
   - repl: "[muninmaster]"