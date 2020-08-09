> _In this section you will prove the infra as code is working by deleting your Cluster Content and recreating it all_

7. Commit your code to the new repo in GitLab
```
git add .
```{{execute}}
```
git commit -m "ADD - all ci/cd contents"
```{{execute}}
```
git push
```{{execute}}

7. Burn your OCP content to the ground
```
oc delete project <YOUR_NAME>-ci-cd
```
```
oc delete project <YOUR_NAME>-dev
```
```
oc delete project <YOUR_NAME>-test
```

7. Check to see the projects that were marked for deletion are removed.
```
oc get projects | egrep '<YOUR_NAME>-ci-cd|<YOUR_NAME>-dev|<YOUR_NAME>-test'
```

7. Re-apply the inventory to re-create it all!
```
oc login <OCP URL PROVIDED DURING ENABLEMENT>
```
```
ansible-playbook apply.yml -i inventory/ -e target=bootstrap
```{{execute}}
```
ansible-playbook apply.yml -i inventory/ -e target=tools
```{{execute}}

_____

## Extension Tasks
> _Ideas for go-getters. Advanced topic for doers to get on with if they finish early. These will usually not have a solution and are provided for additional scope._

 - Install Cowsay for 100% more Ansible Fun!
 - Add more secure access for Nexus (ie not admin / admin123) using the automation to drive secret creation
 - Add a SonarQube persistent deployment to the `ci-cd-deployments` section.
 - Add `jenkins.plugins.slack.SlackNotifier.xml` to `jenkins-s2i/configuration` to include URL of Slack for team build notifications and rebuild Jenkins S2I

_____

## Additional Reading
> List of links or other reading that might be of use / reference for the exercise

## Slide links

- [Intro](https://docs.google.com/presentation/d/1LsfAkH8GfIhulEoy_yd-usWBfDHnZEyQdNvYeTmAg4A/)
- [Wrap-up](https://docs.google.com/presentation/d/1cfyJ6SHddZNbM61oz67r870rLYVKY335zGclXN2uLMY/)
- [All Material](https://drive.google.com/drive/folders/13Bt4BXf9P2OB8VI4YQNcNONF1786dqOx)