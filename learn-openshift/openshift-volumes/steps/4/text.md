To complete this step, verify that the PVC is bound to a volum. We will use it in the next step.

Run following command to verify whether a claim is bound using the CLI: `oc get pvc`{{execute}}

```NAME        LABELS    STATUS    VOLUME
claim1      map[]     Bound     volume1```

**Note:** It might take few seconds for volume claim to be bound with persistent volume.

# Protip
Execute `oc get pv`{{execute HOST1}} to verify persistent volume `volume1` exist. 