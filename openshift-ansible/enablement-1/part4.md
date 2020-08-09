> In order to run our API tests in CI in later labs; we need there to be a MongoDB available for executing our tests. As this is part of our CI/CD Lifecycle; we will add it now.

4. In our `enablement-ci-cd` repo; checkout the mongo templates as shown below to bring in the template and params. The mongodb template we're using is the same as the one for our `todolist-fe` created in previous exercise.
```
git checkout exercise1/mongodb params/mongodb templates/mongodb.yml
```

4. Open `enablement-ci-cd` in your favourite editor. Edit the `inventory/host_vars/ci-cd-tooling.yml` to include a new object for our mongodb as shown below. This item can be added below the Jenkins slave in the `ci-cd-tooling` section.
```yaml
  - name: "jenkins-mongodb"
      namespace: "{{ ci_cd_namespace }}"
      template: "{{ playbook_dir }}/templates/mongodb.yml"
      params: "{{ playbook_dir }}/params/mongodb"
      tags:
      - mongodb
```
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-mongo.png" alt="jenkins-mongo" width="600px"/>


4. Git commit your updates to the inventory to git for traceability.
```
git add .
```{{execute}}
```
git commit -m "ADD - mongodb for use in the pipeline"
```{{execute}}
```
git push
```{{execute}}

4. Apply this change as done previously using Ansible. The deployment can be validated by going to your `<YOUR_NAME>-ci-cd` namespace and checking if it is there!
```
ansible-playbook apply.yml -e target=tools \
  -i inventory/ \
  -e "filter_tags=mongodb"
```{{execute}}
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise3/ocp-mongo.png" alt="ocp-mongo" width="600px"/>


**Note - When making changes to enablement-ci-cd you should frequently commit the changes to git.**
