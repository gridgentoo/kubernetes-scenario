
Let's see how we can use the edit pre-defined role to grant a user access to another user's project. First, login at MiniShift as alice:
`oc login -u alice -p 1234`{{execute}}


**Note:**
The default identity provider is AllowAll, which allows you to use any credentials.

Next, create a new project called alice-project:
`oc new-project alice-project`{{execute}}

Login as bob and observe that they weren't added as a member to any project by default:
`oc login -u bob -p 1234`{{execute}}


`oc project alice-project`{{execute}}

```
error: You are not a member of project "alice-project".
You are not a member of any projects. You can request a project to be created with the 'new-project' command.
```

Let's correct this by granting bob the privilege to edit most of the resources in the alice-project project:
`oc login -u alice`{{execute}}


`oc adm policy add-role-to-user edit bob`{{execute}}

You can use the following command to see the existing rolebinding in the current alice-project project:
`oc get rolebinding`{{execute}}

Notice that there are always two local bindings for the `deployer` and `builder` service accounts, as well as one binding granting all service accounts in the alice-project project the ability to pull images from the internal registry. Another two bindings make alice the admin of her project and grant bob the privilege of editing most of the resources in the project.

Let's see the details of the edit role binding:


`oc describe rolebinding edit`{{execute}}

```
Name:                          edit
Namespace:                     alice-project
Created:                       17 hours ago
Labels:                        <none>
Annotations:                   <none>
Role:                          /edit
Users:                         bob
...
<output omitted>
...
```

The preceding output tells us that the user bob is bound to the edit role in the project alice-project. The omitted output is the same as in the details of the edit role.

Log back in as bob and see that now you have access to Alice's project:
`oc login -u bob`{{execute}}

```
You have one project on this server: "alice-project"`
Using project "alice-project".
```
