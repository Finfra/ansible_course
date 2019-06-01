echo --------------------------------------------------------------------------------
echo '[ Show all facts name and values ]'
echo 'ansible localhost -m setup'
echo --------------------------------------------------------------------------------
ansible localhost -m setup
echo --------------------------------------------------------------------------------
read -p "<< press enter, or cancel to ctl+c >>" ok


echo --------------------------------------------------------------------------------
echo '[ All facts name ]'
echo 'ansible localhost -m setup|grep ansible_|awk 'BEGIN{FS="\""}{print $2 }''
echo --------------------------------------------------------------------------------
ansible localhost -m setup|grep ansible_|awk 'BEGIN{FS="\""}{print $2 }'
echo --------------------------------------------------------------------------------
read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Facts name search ]'
echo 'ansible localhost -m setup|grep ansible_|awk 'BEGIN{FS="\""}{print $2 }'|grep ip'
echo --------------------------------------------------------------------------------
ansible localhost -m setup|grep ansible_|awk 'BEGIN{FS="\""}{print $2 }'|grep ip
echo --------------------------------------------------------------------------------
read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo '[ Show facts values ]'
echo 'ansible localhost -m setup -a "filter=*ipv4"'
echo --------------------------------------------------------------------------------
ansible localhost -m setup -a "filter=*ipv4"
echo --------------------------------------------------------------------------------

