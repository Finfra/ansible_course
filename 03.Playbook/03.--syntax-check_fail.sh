cat <<EOF> p03.yml
---
- name: syntax-check
  host: 
    - "*"
  tasks:
    - shell: whoami
      register: p
    - debug: var=p.stdout_lines      
EOF

ansible-playbook --syntax-check p03.yml 
