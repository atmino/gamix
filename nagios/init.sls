#install nagioscore and plugins

# extract-nagios:
  # archive.extracted:
    # - name: /tmp
    # - source: salt://nagios/nagios.tar.gz
    # - source_hash: b345bf474bf4f9b9c63fd38e0576abc37b9debe655c0071017c95d59d22eb31e
    # - source_hash_update: True
    # - options: z

install-nagios:
  pkg.installed:
    - sources: nagios: salt://nagios/nagios.tar.gz