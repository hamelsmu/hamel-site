---
title: Probes
description: Understand readiness and liveness probes, and how that iteracts with Helm to protect you against deploying bugs.
---

This is [Chapter 12](https://livebook.manning.com/book/learn-kubernetes-in-a-month-of-lunches/chapter-12).

## Testing Liveness Probe

This is a clever way of testing the livenessProbe:

```yaml
spec:
  containers:
  - name: liveness
    image: repo/name
    args:
    - /bin/sh
    - -c
    - touch /tmp/healthy; sleep 30; rm -f /tmp/healthy; sleep 600
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5
```
[Source](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command)

Failed liveness checks will cause a pod to restart, not to be replaced.

## Forcing a container to exit

You can force a container to exit with the following command.  This might be useful for testing:

```bash
kl exec -it {pod name} -- killall5
```

This will cause the pod to restart the container, not replace it.