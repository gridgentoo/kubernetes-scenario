#### 3a - GitLab install
<p class="tip">
NOTE - This section may already have been completed for you, please check with your tutor. If this is the case, skip to section 3b "Commit CI/CD" below to add your code to GitLab.
</p>

4. Now let's do the same thing for GitLab to get it up and running. Checkout the template and params provided by running
```
git checkout exercise1/git-nexus templates/gitlab.yml params/gitlab
```
Explore the template; it contains the PVC, buildConfig and services. The DeploymentConfig is made up of these apps
 - Redis (3.2.3)
 - PostgreSQL (9.4)
 - GitLab CE (v10.2.3)

4. Open the `params/gitlab` file and complete the following params
<p class="tip">
Note - The values here for the LDAP and BIND credentials will be provided by your tutor.
</p>
```
LDAP_BIND_DN=uid=<BIND_USER>,ou=People,dc=<YOUR_DOMAIN>,dc=com
LDAP_USER_FILTER=(memberof=CN=YourGroup,OU=Users,DC=<YOUR_DOMAIN>,DC=com)
LDAP_PASSWORD=<BIND_USER_PASSWORD>
LDAP_HOST=<LDAP_HOST>
LDAP_BASE=ou=People,dc=<YOUR_DOMAIN>,dc=com
LDAP_LABEL="<LDAP_DESCRIPTION>"
GITLAB_ROOT_PASSWORD=<GITLAB_ROOT_USER_PASSWORD>
GITLAB_DATA_VOL_SIZE=2Gi
POSTGRESQL_VOL_SIZE=1Gi
APPLICATION_HOSTNAME=<GITLAB_URL>
NAMESPACE=<YOUR_NAME>-ci-cd
```
where the following need to be replaced by actual values:
    * `<BIND_USER>` is the user used to query the LDAP
    * `<BIND_USER_PASSWORD>` is the password used when querying the LDAP
    * `<YOUR_DOMAIN>` is the domain the LDAP is hosted on
    * `<LDAP_HOST>` is fqdn of the LDAP server
    * `<LDAP_DESCRIPTION>` is the description to be used on the sign-in header for GitLab e.g. "Name LDAP Login"
    * `<GITLAB_ROOT_USER_PASSWORD>` is the root user for GOD access on the GitLab instance e.g. password123
    * `<GITLAB_URL>` is the endpoint for gitlab. It will take the form `gitlab-<YOUR_NAME>-ci-cd.apps.<ENV_ID>.<YOUR_DOMAIN>.com`

4. Create another object in the inventory `inventory/host_vars/ci-cd-tooling.yml` file to run the build & deploy of this template. Add the following and update the `namespace:` accordingly
```yaml
    - name: "gitlab"
        namespace: "{{ ci_cd_namespace }}"
        template: "{{ playbook_dir }}/templates/gitlab.yml"
        params: "{{ playbook_dir }}/params/gitlab"
        tags:
        - gitlab
```

4. Run the OpenShift applier, specifying the tag `gitlab` to speed up its execution.
```
ansible-playbook apply.yml -e target=tools \
     -i inventory/ \
     -e "filter_tags=gitlab"
```{{execute}}

4. Once successful; login to the cluster and navigate to the `<YOUR_NAME>-ci-cd`. You should see GitLab up and running.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/gitlab-up-and-running.png" alt="gitlab-up-and-running" width="600px"/>


#### 3b - Commit CI/CD

4. Navigate to GitLab (if you have just skipped straight to this step; ask your tutor for the URL). You can login using your cluster credentials using the LDAP tab
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/gitlab-ui.png" alt="gitlab-ui" width="600px"/>


4. Once logged in create a new project called `enablement-ci-cd` and mark it as internal. Once created; copy out the `git url` for use on the next step.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/gitlab-new-project.png" alt="gitlab-new-project" width="600px"/>

<p class="tip">
Note - we would not normally make the project under your name but create a group and add the project there on residency but for simplicity of the exercise we'll do that here
</p>

4. If you have not used Git before; you may need to tell Git who you are and what your email is before we commit. Run the following commands, substituting your email and "Your Name". If you've done this before move on to the next step.
```
git config --global user.email "yourname@mail.com"
```
```
git config --global user.name "Your Name"
```

4. Commit your local project to this new remote by first removing the existing origin (github) where the Ansible project was cloned from in the first steps. Remember to substitute `<GIT_URL>` accordingly with the one created for your `enablement-ci-cd` repository a moment ago.
```
git remote set-url origin <GIT_URL>
```
```
git add .
```{{execute}}
```
git commit -m "Adding git and nexus config"
```{{execute}}
```
git push -u origin --all
```{{execute}}