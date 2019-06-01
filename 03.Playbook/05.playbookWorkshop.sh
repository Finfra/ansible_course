
cat <<EOF> ansible.cfg
[defaults]
inventory=inventory
remote_user=vagrant

[privilege_escalation]
become=True
become_method=sudo
become_user=root
become_ask_pass=False
EOF

cat <<EOF> inventory
[web]
n1
n2
EOF

echo "hi">index.html

cat <<EOF> site.yml
---
- name : install and start apache httpd
  hosts : web
  tasks:
    - name: httpd package is present
      yum :
        name: httpd
        state: present

    - name: correct index.html is present
      copy:
        src: index.html
        dest: /var/www/html/index.html

    - name: httpd is started
      service:
        name: httpd
        state: started
        enabled: true
EOF
echo --------------------------------------------------------------------------------
echo 'ansible-playbook --syntax-check site.yml'
echo --------------------------------------------------------------------------------
ansible-playbook --syntax-check site.yml
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo 'ansible-playbook site.yml'
echo --------------------------------------------------------------------------------
ansible-playbook site.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'curl n1'
echo --------------------------------------------------------------------------------
curl n1
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 'curl n2'
echo --------------------------------------------------------------------------------
curl n2
echo --------------------------------------------------------------------------------
