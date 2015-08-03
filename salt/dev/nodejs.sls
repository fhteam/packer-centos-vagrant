{% set nodejs_pkgs=['nodejs', 'npm'] %}

nodejs_pkg:
    pkg.installed:
        - pkgs: 
            {% for i in nodejs_pkgs %}
            - {{ i }}
            {% endfor %}
