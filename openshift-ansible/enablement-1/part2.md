> _Now that we have our Projects setup; we can start to populate them with Apps to be used in our dev lifecycle_

4. In the `enablement-ci-cd` repo, checkout the templates for Nexus by running
```
git checkout exercise1/git-nexus templates/nexus.yml
```
The template contains all the things needed to setup a persistent nexus server, exposing a service and route while also creating the persistent volume needed. Have a read through the template; at the bottom you'll see a collection of parameters we will pass to the template.

4. Add some parameters for running the template by creating a new file in the `params` directory.
```
touch params/nexus
```{{execute}}

4. The essential params to include in this file are:
```
VOLUME_CAPACITY=5Gi
MEMORY_LIMIT=1Gi
```

4. Create a new object in the inventory variables `inventory/host_vars/ci-cd-tooling.yml` called `ci-cd-tooling` and populate its `content` is as follows

```yaml
---
ansible_connection: local
openshift_cluster_content:
- object: ci-cd-tooling
    content:
    - name: "nexus"
      namespace: "{{ ci_cd_namespace }}"
      template: "{{ playbook_dir }}/templates/nexus.yml"
      params: "{{ playbook_dir }}/params/nexus"
      tags:
      - nexus
```
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/ci-cd-deployments-yml.png" alt="ci-cd-deployments-yml" width="600px"/>


4. Run the OpenShift applier, specifying the tag `nexus` to speed up its execution (`-e target=tools` is to run the other inventory).
```
ansible-playbook apply.yml -e target=tools \
     -i inventory/ \
     -e "filter_tags=nexus"
```{{execute}}

4. Once successful; login to the cluster through the browser (using cluster URL) and navigate to the `<YOUR_NAME>-ci-cd`. You should see Nexus up and running. You can login with default credentials (admin / admin123) 
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/nexus-up-and-running.png" alt="nexus-up-and-running" width="600px"/>
