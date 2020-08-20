### Verify Jenkins Results

Since we have improved the source code, we expect the Jenkins Checkstyle warnings to decrease. We can verify this by doing the following:

-> save, commit and push the improved code -> log into Jenkins -> check out the build process that is triggered by the code push (or we can manually trigger the build process by clicking project -> Build now)

On the dashboard, we will see, that the Checkstyle statistics have (very) slightly improved:

![2017-01-18-04_37_06-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052822-52471652-32a0-11e8-8549-09ce7d8d180c.png)

On the upper right edge of the figure, the number of warnings is slightly lower. The code quality is far from being perfect, but we now have all tools and plugins needed to improve the situation.

After changing all tabs by 4 spaces each, the number of Checkstyle violations goes down by ~50%. That is a good start.


![2017-01-19-22_51_58-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/38052823-5257790c-32a0-11e8-9b31-66d6789fb136.png)

Perfect, we have learned how to use the Checkstyle plugin for Eclipse in order to produce better code. And the Jenkins Checkstyle plugin allows us to admire the progress we make.

