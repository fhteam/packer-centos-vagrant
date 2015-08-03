rabbitmq_key:
  cmd.run:
    - name: rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
    - unless: test -n "`rpm -q gpg-pubkey --qf '%{summary}\n' | grep '^gpg(RabbitMQ Release Signing Key <info@rabbitmq.com>)$'`"
rabbitmq_rpm:
  cmd.run:
    - name: yum localinstall -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.4.1/rabbitmq-server-3.4.1-1.noarch.rpm
    - unless: rpm -q rabbitmq-server

/etc/rabbitmq/rabbitmq.config:
    file.managed:
        - source: salt://templates/etc/rabbitmq/rabbitmq.config

rabbitmq-server:
    service.running:
        - enable: True
        - watch:
            - file: /etc/rabbitmq/rabbitmq.config

rabbitmq_management_plugin:
  cmd.run:
    - name: rabbitmq-plugins enable rabbitmq_management
    - unless: test -n "`rabbitmq-plugins list -e | grep rabbitmq_management`"
