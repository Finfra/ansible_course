cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name: installs the "{{ package }}" package
      yum:
        name: "{{ package }}"
        state: latest
EOF

# ansible db -a 'yum list installed curl'

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml ← error! '
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 'ansible-playbook -e package=mutt playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook -e package=curl playbook.yml
echo --------------------------------------------------------------------------------
