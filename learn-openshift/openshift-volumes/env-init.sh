ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 "mkdir -p /data/volume1"
ssh root@host01 "chmod 0777 /data/volume1"
