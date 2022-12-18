---
order: 14
---

# Rollouts

Rollouts happen when you create a deployment or update a podspec.

Only triggered by change to the podspec, not other changes to a Deployment
You can see rollout history like this 

```
kl rollout history deploy/vweb
```

You can get details of a revision with the revision flag:

```yaml
% kl rollout history deploy/vweb                                                                                             
deployment.apps/vweb
REVISION  CHANGE-CAUSE
1         <none>
2         kubectl apply --filename=vweb/update/vweb-v11.yaml --record=true

% kl rollout history deploy/vweb  --revision=1                                                                               
deployment.apps/vweb with revision #1
Pod Template:
  Labels:	app=vweb
	pod-template-hash=6ddb844d69
	version=v1
  Containers:
   web:
    Image:	kiamol/ch09-vweb:v1
    Port:	80/TCP
    Host Port:	0/TCP
    Environment:	<none>
    Mounts:	<none>
  Volumes:	<none>
```

It's helpful to include informational labels with version numbers.


# Undoing a rollout

### Dry Run
This shows you what the YAML will be  so you can inspect the changes

`kl rollout undo .... --dry-run=client`

```yaml
% kl rollout undo deploy/vweb --dry-run=client                                                                               
deployment.apps/vweb Pod Template:
  Labels:	app=vweb
	pod-template-hash=6ddb844d69
	version=v1   # its helpful to have version numbers for informational purposes
  Containers:
   web:
    Image:	kiamol/ch09-vweb:v1
    Port:	80/TCP
    Host Port:	0/TCP
    Environment:	<none>
    Mounts:	<none>
  Volumes:	<none>
```

## To a specific version

You can rollback to a specific revision 

```
kubectl rollout undo deploy/vweb --to-revision=2
```


# Configuring Rollouts

- `maxUnavailable` is the accelerator for scaling down the old ReplicaSet. It defines how many Pods can be unavailable during the update, relative to the desired Pod count. You can think of it as the batch size for terminating Pods in the old ReplicaSet. In a Deployment of 10 Pods, setting this to 30% means three Pods will be terminated immediately. Default is 25%
- `minReadySeconds` adds a delay where the Deployment waits to make sure new Pods are stable. It specifies the number of seconds the Pod should be up with no containers crashing before it’s considered to be successful. The default is zero, which is why new Pods are created quickly during rollouts.

There are specific options for [[DaemonSets]] and [[StatefulSet]] but we will skip those as we can just use the defaults for now (and not get stuck in advanced things).


# Blue Green Deployments

:::warning

You can probably ignore this section

:::

This is a paradigm that is different than rolling updates, where you have two versions of your app deployed, but only one is active.  You can flip the switch by updating the label selector in the Service to send the traffic to Pods in a different deployment. 

![](20221213102708.png)