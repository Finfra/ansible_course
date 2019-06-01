cat <<EOF> playbook.yml
- hosts: db
  vars:
    byWho: nowage
  tasks:
    - name: installs the curl package by {{ byWho }}
      yum:
        name: curl
        state: latest
    - name: installs the tree package by "{{ byWho }}"
      yum:
        name: tree
        state: latest
EOF


echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

