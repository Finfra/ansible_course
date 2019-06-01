cat <<EOF> ansible.cfg
[defaults]
inventory=inventory
remote_user=vagrant

[privilege_escalation]
become=False
become_method=sudo
become_user=root
become_ask_pass=False
EOF

cat <<EOF> inventory
n1
n2
EOF

cat <<EOF> intranet.yml
- name: Enable intranet services
  hosts: n1
  become: yes

  tasks:
    - name: latest version of httpd and firewalld installed
      yum:
        name:
          - httpd
          - firewalld
        state: latest

    - name: firewalld enabled and running
      service:
        name: firewalld
        enabled: true
        state: started

    - name: firewalld permits http service
      firewalld:
        service: http
        permanent: true
        state: enabled
        immediate: yes

    - name: httpd enabled and running
      service:
        name: httpd
        enabled: true
        state: started

    - name: test html page is installed
      copy:
        content: "welcome to the example.com intranet!\n"
        dest: /var/www/html/index.html

- name : test intranet web server
  hosts: n2
  become: no

  tasks:
    - name: connect to intranet web server
      uri:
         url: http://n1
         status_code: 200
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook --syntax-check intranet.yml'
echo --------------------------------------------------------------------------------
ansible-playbook --syntax-check intranet.yml
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo 'ansible-playbook intranet.yml'
echo --------------------------------------------------------------------------------
ansible-playbook intranet.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'curl n1'
echo --------------------------------------------------------------------------------
curl n1
echo --------------------------------------------------------------------------------
