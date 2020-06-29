# ConfigMaps and Secrets #

The 3rd factor (Configuration) of the [Twelve-Factor App Methodology](https://en.wikipedia.org/wiki/Twelve-Factor_App_methodology) states:

> Configuration that varies between deployments should be stored in the environment.

The last place the source of truth for a configuration would be inside the application, container or Pod since these artifacts are deployed to a variety of places with a variety of changing contexts. Anything that is configurable, changeable or varies between contexts should be submitted separately for each deployment. By not putting the configuration in the codebase, this also protects the 1st factor (Codebase):

> There should be exactly one codebase for a deployed service with the codebase being used for many deployments.

Since your deployed containers have no context, that information needs to be supplied when the containers start. Context information can typically include names of other services, database locations, service URLs, running modes, feature enable/disable requests. Sensitive context information can include passwords, account IDs, security tokens, and the like.

This is where Kubernetes ConfigMaps and Secrets can help by supplying your deployment containers with the contextual and secretive information they require.

A core component of the Kubernetes management plane is etcd. Etcd is a high-available, distributed key/value store ideal for contextual environment settings and data. The ConfigMaps and Secrets are simply interfaces for managing this information in etcd.

Pods provide containerized applications access to ConfigMaps and Secrets with three techniques:

1. command-line arguments
1. Environment variables
1. Files in a volume

In the following steps you will learn:

- how to create configuration data in the form of ConfigMaps and Secrets,
- how Pods make configuration accessible for applications in containers,
- how secrets should remain secrets.
