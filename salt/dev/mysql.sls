{% set mysql_pkgs=['mariadb', 'mariadb-server'] %}

mysql_pkg:
    pkg.installed:
        - pkgs: 
            {% for i in mysql_pkgs %}
            - {{ i }}
            {% endfor %}
