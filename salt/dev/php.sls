{% set php_pkgs=['fpm', 'cli', 'gd', 'devel', 'mbstring', 'mcrypt', 'opcache', 'pdo', 'pgsql', 'pecl-xdebug', 'intl', 'pecl-gmagick'] %}

php_pkg:
    pkg.installed:
        - pkgs: 
            {% for i in php_pkgs %}
            - php-{{ i }}
            {% endfor %}

composer_install:
  cmd.run:
    - name: curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
    - unless: test -f /bin/composer

/var/log/xdebug:
    file.directory:
        - user: vagrant
        - group: vagrant

#/etc/php-fpm.d/www.conf:
#    file.absent

/etc/php.d/15-xdebug.ini:
    file.managed:
        - source: salt://templates/etc/php.d/15-xdebug.ini
/etc/php.ini:
    file.managed:
        - source: salt://templates/etc/php.ini

/var/lib/php:
    file.directory:
        - user: vagrant
        - group: vagrant

php-fpm:
    service.running:
        - enable: True
        - watch:
            - file: /etc/php.ini
            - file: /etc/php.d/15-xdebug.ini
