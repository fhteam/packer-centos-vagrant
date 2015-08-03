sphinx_install:
  cmd.run:
    - name: yum localinstall -y http://sphinxsearch.com/files/sphinx-2.2.6-1.rhel7.x86_64.rpm
    - unless: rpm -q sphinx

searchd:
    service.running:
        - enable: True
