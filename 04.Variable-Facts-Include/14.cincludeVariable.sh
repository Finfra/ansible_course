# cf) 04*/03*.sh

cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name : vars include
      include_vars: var.yml
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

