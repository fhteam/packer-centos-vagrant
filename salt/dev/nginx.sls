nginx_pkg:
  pkg.installed:
    - name: nginx
/var/lib/nginx:
    file.directory:
        - user: vagrant
        - group: vagrant
/etc/nginx/conf.d:
    file.directory:
        - clean: True
nginx_service:
  service.running:
    - name: nginx
    - enable: True
    - watch:
        - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://templates/etc/nginx/nginx.conf
