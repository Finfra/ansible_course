cat <<EOF> p04.yml
---
- name: syntax-check
  hosts: 
    - "*"
  tasks:
    - shell: whoami
      register: p
    - debug: var=p.stdout_lines      
EOF

ansible-playbook --syntax-check p04.yml 

echo --------------------------------------------------------------------------------
echo 'diff p03.yml p04.yml '
echo --------------------------------------------------------------------------------
diff p03.yml p04.yml 
echo --------------------------------------------------------------------------------

ansible-playbook p04.yml 