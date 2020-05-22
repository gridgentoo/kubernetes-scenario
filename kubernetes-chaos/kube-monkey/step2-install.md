Create a namespace for the Kube Monkey service.

`kubectl create namespace kube-monkey`{{execute}}

Grab the source code that contains the Helm chart.

`git clone https://github.com/asobti/kube-monkey && pushd kube-monkey/helm`{{execute}}

Install Kube Monkey using the Helm chart.

```helm install my-monkey kubemonkey \
  --set config.dryRun=false \
  --set config.blacklistedNamespaces="\"kube-system\"" \
  --set config.whitelistedNamespaces="\"default\"\, \"more-apps\"" \
  --set config.debug.enabled=true \
  --set config.debug.schedule_immediate_kill=true
```{{execute}}

Return to the default directory.

`popd`{{execute}}

Check the deployment and ensure it starts.

`kubectl -n default rollout status deployment my-monkey-kube-monkey`{{execute}}

Normally, the debug setting would not be set to true and the period of when Kube Monkey creates the schedule is defined in the configuration. The [Kube Monkey documentation](https://github.com/asobti/kube-monkey#configuring) describes the details of setting up a schedule using the variety of configurations values. Normally these schedules would be planned to occur daily or over several days. For this Katacoda scenario in demo mode the schedule is created every 30 seconds and the planned events run immediately.

You can periodically check the Kube Monkey log to see its scheduling events and Pod killing activity.

`kubectl logs deployment.apps/my-monkey-kube-monkey -n default`{{execute}}
