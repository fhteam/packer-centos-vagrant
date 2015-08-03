{% set postgres_pkgs=['postgresql94', 'postgresql94-server', 'postgresql94-contrib'] %}

postgres_pkg:
    pkg.installed:
        - pkgs: 
            {% for i in postgres_pkgs %}
            - {{ i }}
            {% endfor %}

postgres_initdb:
  cmd.run:
    - name: /usr/pgsql-9.4/bin/postgresql94-setup initdb
    - unless: test -f /var/lib/pgsql/9.4/data/PG_VERSION

/var/lib/pgsql/9.4/data/pg_hba.conf:
    file.managed:
        - source: salt://templates/var/lib/pgsql/9.4/data/pg_hba.conf
/var/lib/pgsql/9.4/data/postgresql.conf:
    file.managed:
        - source: salt://templates/var/lib/pgsql/9.4/data/postgresql.conf

postgresql-9.4:
    service.running:
        - enable: True
        - watch:
            - file: /var/lib/pgsql/9.4/data/pg_hba.conf
            - file: /var/lib/pgsql/9.4/data/postgresql.conf
