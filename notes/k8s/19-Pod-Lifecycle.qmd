---
title: Pod restart vs. replacement
description: What's the difference b/w a restart and a replacement?
image: https://user-images.githubusercontent.com/1483922/207999452-843eaa73-a36a-41e1-afea-58357620a4c3.png
order: 19
---

If you google Pod restart vs replacement, virutally every article conflates the two, but the distinction is very important!

- **restart**: all the containers in the pod are restarted, but the pod is guaranteed to stay on the same node.
- **replacement**: the pod is removed and rebuilt, and may appear on a different node.

A good way to test if some event causes a restart vs a replacment is to see if the UID for the pod remains the same or not before vs. after the event:

```bash
kubectl get pods -o custom-columns=PodName:.metadata.name,PodUID:.metadata.uid
```

:::tip

If the pod name is auto-generated, like how it is with a usual deployment, the pod name will change, too.  If the pod name changes, then you know for sure the pod was replaced. 

However, when in doubt, check the UID.

:::

A pod with the same UID is guaranteed to be running on the same node, since it has only been restarted.

This article on [Pod lifecycle](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/) is helpful.


## What causes a restart vs replacement

- **restart**: 
  - failed liveliness probe (I confirmed with the UID that this restarts the Pod).
  - When a container exits the pod will be restarted according to the `restartPolicy` in the podspec.
- **replacement**:
  - `kubectl rollout restart` Yes!  It **replaces** the pod, I checked and the UID changes!  Don't get foooled by the word "restart"
  - deleting the resource (ex: `kubectl delete deploy/...`)
  - scaling the resource to zero (ex: `kubectl scale deployment ...`)
  - If you change the podspec.
  

If unsure do some experiments!

## Forcing a container to exit

You can force a container to exit with the following command.  This might be useful for testing:

```bash
kl exec -it {pod name} -- killall5
```

This will cause the pod to restart the container, not replace it.

## Storage Implications

Storage that exists at the Pod-level, like `emptyDir` will survive a Pod restart, but NOT a pod replacement:

```yaml
...
spec:
 containers:
   - name: myimage
     image: repo/image
     volumeMounts:
      - name: data                 # Mounts a volume called data
         mountPath: /data          # into the /data directory
 volumes:
   - name: data                    # This is the data volume spec,
     emptyDir: {}                  # which is the EmptyDir type.
```

Any data stored in an `EmptyDir` volume remains in the Pod between restarts, so Pod's that are restarted can access data written by their predecessors. An `EmptyDir` volume can be a reasonable source for a local cache because if the app crashes, then the replacement container will still have the cached files. 
