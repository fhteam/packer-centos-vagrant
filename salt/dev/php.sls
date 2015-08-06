{% set php_pkgs=['fpm', 'bcmath', 'cli', 'gd', 'devel', 'mbstring', 'mcrypt', 'opcache', 'pdo', 'pgsql', 'pecl-xdebug', 'intl', 'pecl-gmagick', 'pecl-zmq'] %}

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

/etc/php-fpm.conf:
    file.managed:
        - source: salt://templates/etc/php-fpm.conf

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
    service.enabled
