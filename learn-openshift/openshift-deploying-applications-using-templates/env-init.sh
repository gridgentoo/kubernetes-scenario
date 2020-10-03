ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 'oc adm policy add-cluster-role-to-group sudoer system:authenticated'
ssh root@host01 'for i in {1..200}; do oc get project/openshift && break || sleep 1; done'
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mariadb-ephemeral-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mariadb-persistent-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mongodb-ephemeral-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mongodb-persistent-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mysql-ephemeral-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/mysql-persistent-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/postgresql-ephemeral-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/postgresql-persistent-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/redis-ephemeral-template.json -n openshift"
ssh root@host01 "oc create -f https://github.com/openshift/origin/raw/release-3.11/examples/db-templates/redis-persistent-template.json -n openshift"
