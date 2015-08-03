redis_pkg:
  pkg.installed:
    - name: redis
/etc/redis.conf:
  file.managed:
    - source: salt://templates/etc/redis.conf
redis_service:
  service.running:
    - name: redis
    - enable: True
    - watch:
        - file: /etc/redis.conf

