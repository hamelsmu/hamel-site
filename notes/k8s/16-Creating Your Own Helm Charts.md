
:::warning
This is going to be really light, as we don't want to get too deep into this.  You can really just skip this if you like. 
:::

You can reference a directory, vs a zip archive when developing locally. 

# Setup Directory w/ `helm create`

You can use `helm create` to generate boilerplate directory structure:

![](20221213105720.png)

YAML is templated like this: 

Note the handy `quote` function for applying quotes!

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}
  labels:
    kiamol: {{ .Values.kiamolChapter }}
spec:
  selector:
    matchLabels:
      app: web-ping
      instance: {{ .Release.Name }}
  template:
    metadata:
      labels:
        app: web-ping
        instance: {{ .Release.Name }}
    spec:
      containers:
        - name: app
          image: kiamol/ch10-web-ping
          env:
            - name: TARGET
              value: {{ .Values.targetUrl }}
            - name: METHOD
              value: {{ .Values.httpMethod }}
            - name: INTERVAL
              value: {{ .Values.pingIntervalMilliseconds | quote }}
```

`values.yaml` looks like this:

```yaml
# port for the Service to listen on
servicePort: 8090
# number of replicas for the web Pod
replicaCount: 2
```

`Chart.yaml`:

```yaml
apiVersion: v2
name: vweb
description: Simple versioned web app
type: application
version: 1.0.0
appVersion: 1.0.0

```


# Running charts

## Validate with `helm lint`

`helm lint directory/`

## Install

```
helm install directory/
```

# Distributing Charts

See https://kiamol.net/index.yaml

```
apiVersion: v1
entries:
  vweb:
  - apiVersion: v2
    appVersion: 2.0.0
    created: "2020-06-10T10:42:32.3790003+01:00"
    description: Simple versioned web app
    digest: 16b2d1059639208d64fa0c6d9d7aeb825021f7fe25034760a70d33afda51a8cb
    name: vweb
    type: application
    urls:
    - https://github.com/sixeyed/kiamol/releases/download/v2.0.0/vweb-2.0.0.tgz
    version: 2.0.0
  - apiVersion: v2
    appVersion: 1.0.0
    created: "2020-06-10T10:42:32.3790003+01:00"
    description: Simple versioned web app
    digest: 182061847198468c8ee55e56104d8eaa2b1662e10846aed7134930ef6e03f95b
    name: vweb
    type: application
    urls:
    - https://github.com/sixeyed/kiamol/files/4757269/vweb-1.0.0.tar.gz
    version: 1.0.0
generated: "2020-06-10T10:01:44.600496+01:00"
```

Charts need to be packaged before they can be published to a repository, and publishing is usually a three-stage process: package the chart into a zip archive, upload the archive to a server, and update the repository index to add the new chart.

There is software called ChartMueseum that will help you package things.  

Lookup how to host helm charts on GitHub if interested.