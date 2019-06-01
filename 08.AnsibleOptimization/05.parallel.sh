echo --------------------------------------------------------------------------------
echo [ Clear and Setting ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo [ Setting ]
echo ansible n2 -m file -a "path=/tmp/xxbb state=directory"
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------

cat <<EOF> playbook.yml
- hosts: n1
  tasks:
  - name: reboot server
    command: 'shutdown -r +1 "Ansible updates triggered"'
    async: 1
    poll: 2
    ignore_errors: true
  - name: wait for webserver to restart
    wait_for:
      host: n1
      port: 22
      state: started
      delay: 80
      timeout: 200
    become: False
    delegate_to: 127.0.0.1  
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------


# read -p "<< press enter, or cancel to ctl+c >>" ok

# echo --------------------------------------------------------------------------------
# echo [ Clear and Setting ]
# echo --------------------------------------------------------------------------------
# [[ -f ansible.cfg ]]&& rm ansible.cfg
# echo --------------------------------------------------------------------------------
