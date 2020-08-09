## Once again, go over to the `Dashboard` tab in this environment 

You should notice that it says:

`A new deployment will start automatically when an image is pushed to not-a-ruby-example/ruby-ex:latest.`

Notice that it thinks the build will be from the `not-a-ruby-example` namespace!

Because the `params_from_vars` variable overwrote the `params` file variable, and the `NAMESPACE_BUILD: not-a-ruby-example` is not the correct namespace!

The easy way to fix this would be to change this:

`NAMESPACE_BUILD: not-a-ruby-example` 

to this:

`NAMESPACE_BUILD: ruby-example`

in our `inventory/group_vars/all.yml`

But let's fix our inventory using dynamic variables in a different way...