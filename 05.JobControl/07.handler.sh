echo --------------------------------------------------------------------------------
echo 'Clear '
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible web -m yum -a "name=httpd state=absent"
echo --------------------------------------------------------------------------------


cat <<EOF> httpd.conf
ServerRoot "/etc/httpd"
Listen 80
Include conf.modules.d/*.conf
User apache
Group apache
DocumentRoot "/var/www/html"
<Directory "/var/www">
    AllowOverride None
    Require all granted
</Directory>
<Directory "/var/www/html">
    Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>
<IfModule dir_module>
    DirectoryIndex i.html
</IfModule>
<IfModule mime_module>
    TypesConfig /etc/mime.types
        AddType application/x-compress .Z
    AddType application/x-gzip .gz .tgz

    AddType text/html .shtml
    AddOutputFilter INCLUDES .shtml
</IfModule>
EOF

echo hi"> index.html
echo hello"> i.html


cat <<EOF> playbook.yml
- hosts: web
  vars:
    files:
      - index.html
      - i.html
  tasks:
    - yum :
        name: httpd
        state: latest
    - service:
        name: httpd
        state: started
        enabled: true
    - name: copy html 
      copy:
        src: "{{ item }}"
        dest: /var/www/html/
      with_items: "{{ files }}"
    - name: copy httpd.conf
      copy:
        src: httpd.conf
        dest: /etc/httpd/conf 
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'curl n2'
echo --------------------------------------------------------------------------------
curl n2
echo --------------------------------------------------------------------------------


read -p "<< press enter, or cancel to ctl+c >>" ok


echo --------------------------------------------------------------------------------
echo 'Clear '
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible web -m yum -a "name=httpd state=absent"
echo --------------------------------------------------------------------------------



cat <<EOF> playbook.yml
- hosts: web
  vars:
    files:
      - index.html
      - i.html
  tasks:
    - yum :
        name: httpd
        state: latest
    - service:
        name: httpd
        state: started
        enabled: true
    - name: copy html 
      copy:
        src: "{{ item }}"
        dest: /var/www/html/
      with_items: "{{ files }}"
    - name: copy httpd.conf
      copy:
        src: httpd.conf
        dest: /etc/httpd/conf 
      notify:
        - restart_apache
  handlers:
    - name: restart_apache
      service:
        name: httpd
        state: restarted            
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 'curl n2'
echo --------------------------------------------------------------------------------
curl n2
echo --------------------------------------------------------------------------------
