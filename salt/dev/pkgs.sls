{% set pkgs = ['nano', 'net-tools', 'lsof', 'mlocate', 'yum-utils', 'mc', 'deltarpm'] %}

{% for i in pkgs %}
{{ i }}:
  pkg.installed
{% endfor %}
