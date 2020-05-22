Aside from SonarQube there are other ways to analyze a project. Use Gradle to run a series of tasks related to performing static code analysis.

**Note: This step is a draft. The Analysis Plugins are currently being upgraded and may not function.**

`./gradlew check`{{execute}}

These will invoke a series of Gradle plugins associated with static code analysis. They will take a few moments to generate reports in the build/reports directory.
