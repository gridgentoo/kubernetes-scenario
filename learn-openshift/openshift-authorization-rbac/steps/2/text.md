Authorization in OpenShift is built around the following concepts:

- **Rules:** Sets of actions allowed to be performed on specific resources.

- **Roles:** Collections of rules that allow them to be applied to a user according to a specific usage profile. Roles can be applied either at the cluster or project level.

- **Role bindings:** Associations between users/groups and roles. A given user or group can be associated with multiple roles.