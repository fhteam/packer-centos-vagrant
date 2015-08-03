localtime_link:
    file.symlink:
        - name: /etc/localtime
        - target: /usr/share/zoneinfo/Europe/Moscow
ntp:
    pkg.installed
ntpd:
    service.running:
        - enable: True
        - watch:
            - file: /etc/ntp.conf
/etc/ntp.conf:
    file.managed:
        - source: salt://templates/etc/ntp.conf
