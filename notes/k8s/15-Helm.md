- It's a client-side tool
- Uses `kubectl` to connect to your cluster
- Add repos with a URL `helm repo add https://...`
- Update repos with `helm repo update`
- It's basically parametrized YAML
	- Helm templates are not valid YAML, so you can't use kubectl

Jeremy Lewi:  Use Kustomize, not Helm, if you can.


# Terminology
- `chart`: an application packge 
- `release`: when you install a chart.  Every release has a name.


# Usage

A helm chart parameterizes YAML and exposes the parameters and their defaults on the command line for you to edit. 

![](20221213105720.png)


## Add a repo

```
 helm repo add kiamol https://kiamol.net
```

## Inspect default values in chart

See what versions are available

```
% helm search repo vweb --versions  
NAME       	CHART VERSION	APP VERSION	DESCRIPTION
kiamol/vweb	2.0.0        	2.0.0      	Simple versioned web app
kiamol/vweb	1.0.0        	1.0.0      	Simple versioned web app
```

See the default values:

```
% helm show values kiamol/vweb --version 1.0.0                                                                            
servicePort: 8090
replicaCount: 2
```

## Install the chart

Override default values, and name the release `ch10-vweb`:

```
 helm install --set servicePort=8010 --set replicaCount=1 ch10-vweb kiamol/vweb --version 1.0.0
```


See the deployment (labels omitted in below output for brevity)

```
% kl get deploy --show-labels                                                                                                              
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
ch10-vweb   1/1     1            1           39s
```

### Dry runs

There is also a `--dry-run` flag that will generate the YAML for you.  

## Update the release

Use `helm upgrade` :

In this case we are going to increase the replica count:

```
% helm upgrade --set servicePort=8010 --set replicaCount=3 ch10-vweb kiamol/vweb --version 1.0.0
Release "ch10-vweb" has been upgraded. Happy Helming!
NAME: ch10-vweb
LAST DEPLOYED: Tue Dec 13 11:10:04 2022
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
```


