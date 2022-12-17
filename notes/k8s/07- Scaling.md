replicas can be used for scaling.   You must also think about storage.  

## DaemonSets

[[DaemonSets]] allow you to run a service on each node.  You can do this for node specific things like collecting logs on each node.  `DaemonSets` are yet another kind of controller for Pods beyond [[Deployments]]

If you switch from a Deployment to a DaemonSet you should delete the Deployment first.  You can't automatically change from one kind of controller to another.

A DaemonSet runs a control loop that will watch for any new nodes and start a pod on that node.

### Use cases for DaemonSets:
1. Want to run a pod on every node
2. you have only a subset of nodes that can receive traffic from the internet -> use labels to achieve this.  

### Labeling A Node For DaemonSets

This allows you to select which nodes the Daemonset runs on:

```yaml
% cat pi/proxy/daemonset/nginx-ds-nodeSelector.yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: pi-proxy
  labels:
    kiamol: ch06
spec:
  selector:
    matchLabels:
      app: pi-proxy
  template:
    metadata:
      labels:
        app: pi-proxy
    spec:
...
      nodeSelector:
        kiamol: ch06
```

To use thie above yaml, you have to label your node like this:

```
kl label node $(kl get nodes...) kiamol=ch06 --overwrite
```

### Cascade Delete

TLDR; you probably don't need this

You can set `cascade=False` to delete a controller without deleting its managed objects.  This is how you can change a controller but still keep pods alive. 

```bash
kl delete ds pi-proxy --cascade=orphan  # deletes the daemonset pi-proxy
```

Controllers use a label selector to find objects they manage, so you just have to make sure the new controller you define has the right label.  Hamel: it's not clear how to switch from a Daemonset to a deployment.  