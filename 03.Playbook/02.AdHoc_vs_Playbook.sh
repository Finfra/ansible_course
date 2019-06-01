# == ansible all -m shell -a "whoami"

cat <<EOF> p02.yml
---
- name: 02.AdHoc_vs_Playbook
  hosts: 
    - "*"
  tasks:
    - shell: whoami
      register: p
    - debug: var=p.stdout_lines      
EOF

ansible-playbook p02.yml 
