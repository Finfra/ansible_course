# cf )    Code :  04*/03*.sh   
# cf )    Code :  03*/05*.sh   

cat <<EOF> service.yml
- name: httpd is started
  service:
    name: "{{ service_name }}"
    state: "{{ state }}"
    enabled: true

EOF

echo "hi">index.html
cat <<EOF> playbook.yml
---
- name : install and start apache httpd
  hosts : web
  tasks:
    - name: httpd package is present
      yum :
        name: httpd
        state: present
    - name: Service up
      include: service.yml
      vars:
         service_name : httpd
         state: started
    - name: correct index.html is present
      copy:
        src: index.html
        dest: /var/www/html/index.html

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
