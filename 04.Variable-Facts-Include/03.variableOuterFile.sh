cat <<EOF> playbook.yml
- hosts: db
  vars_files:
    - var.yml
  tasks:
    - name: installs the curl package by {{ byWho }}
      yum:
        name: curl
        state: latest
EOF

cat <<EOF> var.yml
byWho: nowage
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

