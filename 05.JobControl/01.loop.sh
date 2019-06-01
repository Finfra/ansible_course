cat <<EOF> playbook_org.yml
- hosts: db
  tasks:
    - name: installs the packages
      yum:
        name: curl
        state: latest
- hosts: db
  tasks:
    - name: installs the packages
      yum:
        name: tree
        state: latest
EOF

cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name: installs the packages
      yum:
        name: "{{ item }}"
        state: latest
      with_items:
        - curl
        - tree  
EOF

echo --------------------------------------------------------------------------------
echo 'cat playbook_org.yml'
echo --------------------------------------------------------------------------------
cat playbook_org.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'cat playbook.yml'
echo --------------------------------------------------------------------------------
cat playbook.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

