Hierachy is `Deployments ->  ReplicaSets -> Pods -> Containers`

You probably never need to fiddle with ReplicSets directly and will mostly operate at the `Deployment` abstraction level that's mentioned in [[2a. Basics]].  

The reason the `ReplicaSet` abstraction is used is that the `Deployment` turns the `replicas` count to 0 when you update the metadata of podspec in a Deployment, as a way of gracefully winding down old pods in favor of new pods.  

This is why sometimes you might see a ReplicaSet with a desired pod count of zero.

The way replicas are controled via deployments are through the `spec.replicas`  field:

```yaml
%cat  pi/proxy/nginx.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pi-proxy
  labels:
    kiamol: ch06
spec:
  replicas: 2  # Two replicas for nginx
  selector:
    matchLabels:
      app: pi-proxy
  template:
    metadata:
      labels:
        app: pi-proxy
    spec:
      containers:
        - image: nginx:1.17-alpine
          name: nginx
          ports:
            - containerPort: 80
              name: http
          volumeMounts:
            - name: config
              mountPath: "/etc/nginx/"
              readOnly: true
            - name: cache-volume
              mountPath: /data/nginx/cache
      volumes:
        - name: config
          configMap:
            name: pi-proxy-configmap
        - name: cache-volume
          emptyDir: {}
```

