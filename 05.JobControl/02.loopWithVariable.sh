

cat <<EOF> playbook.yml
- hosts: db
  vars:
    packages:
      - name: curl 
        state: present  
      - name: tree
        state: latest
      
  tasks:
    - name: install the packages 
      yum:
        name: "{{ item['name'] }}"
        state: "{{ item['state'] }}"
      with_items:
        - "{{ packages }}"
        
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

