# -= ansible all -m ping

cat <<EOF> p01.yml
---
- name: 01.PlaybookBasic
  hosts: 
    - "*"
  tasks:
    - ping:
EOF

ansible-playbook p01.yml

