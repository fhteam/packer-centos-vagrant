{% set nodejs_pkgs=['nodejs', 'npm'] %}

nodejs_pkg:
    pkg.installed:
        - pkgs: 
            {% for i in nodejs_pkgs %}
            - {{ i }}
            {% endfor %}

npm_bower:
  cmd.run:
    - name: npm install -g bower
    - unless: test -n "`npm list -g 2>/dev/null| grep bower`"
npm_gulp:
  cmd.run:
    - name: npm install -g gulp
    - unless: test -n "`npm list -g 2>/dev/null| grep gulp`"
