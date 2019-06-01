if [ ! -f ~/.ssh/id_rsa ] ; then
    ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
fi

for node in $(cat /etc/ansible/hosts |grep ^n); do
    # setting each node
    sshpass -p vagrant scp ~/.ssh/id_rsa.pub $node:/tmp/id_rsa.pub
    sshpass -p vagrant ssh $node "cat /tmp/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys"
    # test
    ssh $node hostname
done

