repo_epel:
  cmd.run:
    - name: yum localinstall -y http://mirror.logol.ru/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
    - unless: rpm -q epel-release
repo_remi:
  cmd.run:
    - name: yum localinstall -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && yum-config-manager --enable remi remi-php56
    - unless: rpm -q remi-release
repo_nginx:
  cmd.run:
    - name: yum localinstall -y http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
    - unless: rpm -q nginx-release-rhel
repo_postgres:
  cmd.run:
    - name: yum localinstall -y http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm
    - unless: rpm -q pgdg-centos94
