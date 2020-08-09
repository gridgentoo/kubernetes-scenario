> _To test things are working end-to-end; create a hello world job that doesn't do much but proves we can pull code from git and that our balls are green._

6. Log in to Jenkins and hit `New Item`.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/new-item.png" alt="new-item" width="600px"/>


6. Create a freestyle job called `hello-world`.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-new-hello-world.png" alt="jenkins-new-hello-world" width="600px"/>


6. On the Source Code Management tab; add your `enablement-ci-cd` git repo and hit the dropdown to add your credentials we baked into the s2i on previous steps.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-scm-git.png" alt="jenkins-scm-git" width="600px"/>


6. On the build tab add an Execute Shell step and fill it with `echo "Hello World"`.
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-hello-world.png" alt="jenkins-hello-world" width="600px"/>


6. Run the build and we should see if pass successfully and with Green Balls!
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-green-balls.png" alt="jenkins-green-balls" width="600px"/>

