ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/e4446692fb00a64da7177181cb122475a958a3d7/decisionserver/decisionserver64-image-stream.json -n openshift && break || sleep 2; done'
ssh root@host01 'for i in {1..200}; do oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/e4446692fb00a64da7177181cb122475a958a3d7/decisionserver/decisionserver64-basic-s2i.json -n openshift && break || sleep 2; done'
ssh root@host01 'docker pull duncandoyle/jboss-brms:6.4'
ssh root@host01 "touch /etc/rhsm/ca/redhat-uep.pem"
ssh root@host01 'docker run -d -p 8001:8001 -p 8080:8080 -p 9418:9418 --name=jboss-brms duncandoyle/jboss-brms:6.4 -c brms-standalone.xml -b 0.0.0.0 -bmanagement 0.0.0.0 -Derrai.bus.enable_sse_support=false'
