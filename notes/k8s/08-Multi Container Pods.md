Pods can run more than one container.  Pods in a container share the same network and same IP address, so they must listen on different ports.   Containers in a pod can communicate over local host.  Each container has its own file system, but can mount from the Pod and can share info that way. 


```yaml
% cat sleep/sleep-with-file-reader.yaml                                                                                              
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sleep
  labels:
    kiamol: ch07
spec:
  selector:
    matchLabels:
      app: sleep
  template:
    metadata:
      labels:
        app: sleep
    spec:
      containers:
        - name: sleep
          image: kiamol/ch03-sleep
          volumeMounts:
            - name: data                 # This must match the Name of a Volume.

              mountPath: /data-rw
        - name: file-reader # you can run same image in pod but need different name.  You usually wouldnt do this.
          image: kiamol/ch03-sleep 
          volumeMounts:
            - name: data                    # the name corresponds to a volume
              mountPath: /data-ro
              readOnly: true
      volumes:
        - name: data                     # this is the name that is used to mount
          emptyDir: {}   # All pods can access this
```


## Accessing containers in multi-container Pods

You can use the `-c` flag, to narrow down the container

```
% kl logs deploy/sleep -c file-reader
```

Same thing is necessary for `kl exec deploy/sleep ...`, you would also add `-c file-reader` onto that. 


## Networking Sharing

To demonstrate network sharing:

```yaml
% cat sleep/sleep-with-server.yaml                                                                                                   
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sleep
  labels:
    kiamol: ch07
spec:
  selector:
    matchLabels:
      app: sleep
  template:
    metadata:
      labels:
        app: sleep
    spec:
      containers:
        - name: sleep
          image: kiamol/ch03-sleep
        - name: server
          image: kiamol/ch03-sleep
          command: ['sh', '-c', "while true; do echo -e 'HTTP/1.1 200 OK\nContent-Type: text/plain\nContent-Length: 7\n\nkiamol' | nc -l -p 8080; done"]
          ports:
            - containerPort: 8080    # this exposes a port to this container.
              name: http
```

We can access the `server` container on local host from the `sleep` container:

```
kl apply -f sleep/sleep-with-server.yaml
kl exec deploy/sleep -c sleep -- wget -q -O - localhost:8080
```

### Creating A Serivce to Multi Container Pod

You just have to make sure that the port is routing to the correct place. 

```yaml
apiVersion: v1
kind: Service
metadata:
  name: sleep
spec:
  ports:
	- port: 8020
	  targetPort: 8080
  selector:
    app: sleep
  type: LoadBalancer
```

Now from my lapto I can do this, which will allow me to access the container listening in the pod on port `8080`

```
wget -q -O - localhost:8020
```

## When to use multi cotainer pods

You don't want to usually shove different components of an application into a Pod together!  Doing so will limit you, as you want to be able to scale/upgrade etc these different components independently.  

There are two patterns:

1. [[Sidecar]]  runs alongside; pod isn't considered `ready` until all the containers are ready.  **This is what is shown above.**
2. [[Init containers]]  you can have multiple init containers, they run in sequence, in order they are specified.  Each must complete sucessfully before next one starts, and all must complete sucessfully before the Pod  containers start (if mulitple they are sidecars) 


Init containers are often used to generate data for container Pods (which is written to a shared mounted directory as previously shown).  An example is an `init` container w/ the git command line installed that clones a repo to a shared file system.   Another example is to write configuration files in a specific format that your app expects from env variables and config maps. 

The below YAML shows the `initContainer` craeating the index.html file so the next imge can serve it.   

```yaml
% cat sleep/sleep-with-html-server.yaml                                                                                              
apiVersion: apps/v1
kind: Deployment
metadata:
...
spec:
  selector:
    matchLabels:
      app: sleep
  template:
...
    spec:
      initContainers:
        - name: init-html
          image: kiamol/ch03-sleep
          command: ['sh', '-c', "echo '<!DOCTYPE html><html><body><h1>KIAMOL Ch07</h1></body></html>' > /data/index.html"]
          volumeMounts:
            - name: data
              mountPath: /data
      containers:
        - name: sleep
          image: kiamol/ch03-sleep
        - name: server
          image: kiamol/ch03-sleep
          command: ['sh', '-c', 'while true; do echo -e "HTTP/1.1 200 OK\nContent-Type: text/html\nContent-Length: 62\n\n$(cat /data-ro/index.html)" | nc -l -p 8080; done']
          ports:
            - containerPort: 8080
              name: http
          volumeMounts:
            - name: data
              mountPath: /data-ro
              readOnly: true
```


Here is an example that writes a config file callled `appsettings.json`:

```yaml
...
    spec:
      initContainers:
        - name: init-config
          image: kiamol/ch03-sleep
          command: ['sh', '-c', "cat /config-in/appsettings.json | jq --arg APP_ENV \"$APP_ENVIRONMENT\" '.Application.Environment=$APP_ENV' > /config-out/appsettings.json"]
          env:
          - name: APP_ENVIRONMENT
            value: TEST
          volumeMounts:
            - name: config-map
              mountPath: /config-in
            - name: config-dir
              mountPath: /config-out
...
      volumes:
        - name: config-map     # this is a volume that is mounted as input
          configMap:
            name: timecheck-config
        - name: config-dir     # files are written out here
          emptyDir: {}
```

# Init Containers

You can still inspect logs of init containers even after they have exited.  See example above

# Logging With Sidecars

This is a pedagogical example of why sidecars could be useful.   This is a sidecar that would emit the logs to stdout from your app:

```yaml
%cat timecheck/timecheck-with-logging.yaml
      containers:
        - name: timecheck
          image: kiamol/ch07-timecheck
          volumeMounts:
            - name: config-dir
              mountPath: /config
              readOnly: true
            - name: logs-dir
              mountPath: /logs
        - name: logger               # This is the sidecar
          image: kiamol/ch03-sleep
          command: ['sh', '-c', 'tail -f /logs-ro/timecheck.log']
          volumeMounts:
            - name: logs-dir
              mountPath: /logs-ro
              readOnly: true
```


You can use sidecars to monitor your app as well.  for example, you can build standard health and metrics container images. 

