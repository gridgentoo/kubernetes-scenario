ssh root@host01 "yum install epel-release -y"
ssh root@host01 "yum install ansible -y"
ssh root@host01 "oc login -u system:admin"
ssh root@host01 "oc create -f https://raw.githubusercontent.com/pcarney8/rh-applier-quickstart/master/templates/app/ruby.yml -n openshift"