cat <<EOF> ansible.cfg
[defaults]
inventory = inventory
EOF
cat <<EOF> inventory
n1 package=tree
EOF

cat <<EOF> playbook.yml
- hosts: all
  tasks:
    - name: installs the {{ package }} package by nowage
      yum:
        name: "{{ package }}"
        state: latest    
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook  playbook.yml
echo --------------------------------------------------------------------------------

