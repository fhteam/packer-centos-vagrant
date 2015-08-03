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
    service.enabled:
        - name: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://templates/etc/nginx/nginx.conf
