CI/CD comprises the two main acronyms people use when talking about modern application deployment. While CI stands for Continuous Integration, CD has two meanings; one of them is Continuous Deployment, and another one is Continuous Delivery. All three terms are easy to understand, and are described as follows:

**Continuous Integration:** Emphasizes creating and building automation tests against application builds, as well as merging updates into a single branch as often as possible. It helps to catch bugs early on and to avoid the integration difficulties that developers usually encounter when developing new code and merging changes into different branches.

**Continuous Delivery:** Helps to extend Continuous Integration processes, to push new code from the development to the production stage in a reproducible fashion. If, with Continuous Integration, you automate builds and tests, then Continuous Delivery automates application release processes, usually using approval procedures. 

**Continuous Deployment:** Extends Continuous Delivery even further, by providing a seamless and uninterrupted application delivery process, without any human intervention. This application deployment method requires quite a lot of effort to make sure that, when you run the code, it won't break anything and will work as expected.  

The CI and CD processes are put into a series of steps and procedures to form a pipeline, often referred to as the CI/CD pipeline. 


There are many CI/CD tools that can help you to automate the application delivery process, but one of the most popular ones in the industry is called Jenkins. It just so happens that OpenShift has built in integration with Jenkins, which we will discuss in the following sections.