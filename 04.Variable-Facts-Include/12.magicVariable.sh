[[ -f ansible.cfg ]]&& rm ansible.cfg

echo --------------------------------------------------------------------------------
echo 'cf) Variable'
echo 'ansible localhost -m setup -a "filter=*ipv4"'
echo --------------------------------------------------------------------------------
ansible localhost -m setup -a "filter=*ipv4"
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Magic Variable : hostvars ]'
echo 'ansible localhost -m debug -a 'var=hostvars["localhost"]''
echo --------------------------------------------------------------------------------
ansible localhost -m debug -a 'var=hostvars["localhost"]'
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Magic Variable : group_names ]'
echo 'ansible localhost -m debug -a 'var=hostvars["n2"]["group_names"]''
echo --------------------------------------------------------------------------------
ansible localhost -m debug -a 'var=hostvars["n2"]["group_names"]'
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Magic Variable : inventory_hostname ]'
echo 'ansible localhost -m debug -a 'var=hostvars["n2"]["inventory_hostname"]''
echo --------------------------------------------------------------------------------
ansible localhost -m debug -a 'var=hostvars["n2"]["inventory_hostname"]'
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Magic Variable : groups ]'
echo ansible localhost -m debug -a 'var=groups'
echo --------------------------------------------------------------------------------
ansible localhost -m debug -a 'var=groups'
echo --------------------------------------------------------------------------------

