cat <<EOF> playbook.yml
- hosts: db
  vars:
    pkg: tree
  tasks:
    - name: install the packages 
      yum:
        name: tree
      when: pkg is defined
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok


cat <<EOF> playbook.yml
- hosts: db
  vars:
    aaa: tree
  tasks:
    - name: install the packages 
      yum:
        name: tree
      when: pkg is defined
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

