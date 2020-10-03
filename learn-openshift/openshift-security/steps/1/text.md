A user is any human actor that can make requests to the OpenShift API to access resources and perform actions. Users are typically created in an external identity provider, usually a corporate identity management solution such as Lightweight Directory Access Protocol (LDAP) or Active Directory.

To support multiple identity providers, OpenShift relies on the concept of identities serving as a bridge between users and identity providers. By default, a new user and identity are created upon the first login.


Go to Openshift Web console by clicking `Dashboard` tab located next to terminal and you will see the login page:


Log in via browser using the following credentials and observe that the user was created using CLI:

* Username: **alice**
* Password: **1234**

`oc get user`{{execute}}

```
NAME    UID      FULL NAME     IDENTITIES
alice bf11471e-47a8-11e8-8dee-525400daa710  Alice Springs   LDAP:uid=alice,cn=users,cn=accounts,dc=idm,dc=example,dc=com
```

You can also see that an identity was created as well and mapped to the user:
`oc get identity`{{execute}}


#### Authentication
The term authentication refers to the process of validating one's identity. Usually, users aren't created in OpenShift itself, but provided by an external entity, such as the LDAP server or GitHub. The only part where OpenShift steps in is authorization—determining roles and, therefore, permissions for a user. OpenShift supports integration with various identity management solutions used in corporate environments, such as FreeIPA/Identity Management, Active Directory, GitHub, Gitlab, OpenStack Keystone, and OpenID.

There are four ways to map users to identities:

Method | Description
--- | ---
`claim` | *If a user with the same name already exists and is mapped to another identity, creation of another identity and login will fail. This is useful when you want to maintain a clear separation between identities provided by several providers in the case of identical usernames. A potential use case for this method would be transitioning from one authentication scheme to another.*
`add` | *If a user with the same name already exists and is mapped to another identity, another identity mapped to the same user is created. This is useful if you need to provide users from separate organizational entities that have their own identity management solutions with the ability to authenticate using mechanisms that are convenient for them.
*
`lookup` | *OpenShift looks up an existing user, identity, and mapping, but doesn't create any of them, so these entities must exist prior to the user being able to log in.*
`generate` | *If a user with the same name already exists and is mapped to another identity, a separate user mapped to this identity is generated.*


Log in via browser by Clicking *Dashboard** using the username **alice** and the password **supersecret**, and observe that the user was created using CLI:
`oc get user`{{execute}}

```
NAME    UID      FULL NAME     IDENTITIES
alice bf11471e-47a8-11e8-8dee-525400daa710  Alice Springs   LDAP:uid=alice,cn=users,cn=accounts,dc=idm,dc=example,dc=com
```

**Note:**
Notice that identity's name is composed of its type and user locator, delimited by colon. Locator is provider-specific and specifies how to request a particular user from a specific provider.

You can also see that an identity was created as well and mapped to the user:
`oc get identity`{{execute}}