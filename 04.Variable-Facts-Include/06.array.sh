[[ -f ansible.cfg ]]&& rm ansible.cfg

cat <<EOF> playbook.yml
---
- hosts: db
  vars:
    package: curl
    byWho: 
      name:
        first_name: JungGu
        last_name: Nam
  tasks:
    - name: installs the curl package by {{ byWho['name']['first_name'] }}
      yum:
        name: "{{ package }}"
        state: latest
EOF


echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

