# pyroscope

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.32](https://img.shields.io/badge/AppVersion-0.0.32-informational?style=flat-square)

A Helm chart for Pyroscope

## Get the Repo of Pyrscope

```console

helm repo add pyroscope-io https://pyroscope-io.github.io/helm-chart

```

## Installing the Chart

To install the chart with the release name `my-release`:

```console

helm install my-release pyroscope-io/pyroscope

```

## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console

helm delete my-release

```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment |
| fullnameOverride | string | `""` | Defaults to .Release.Name-.Chart.Name unless .Release.Name contains "pyroscope" |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"pyroscope/pyroscope"` | image to use for deploying |
| image.tag | string | `"0.0.32"` | Tag for pyroscope image to use |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` | Ingress annotations (values are templated) |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress accepted hostnames |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| livenessProbe.enabled | bool | `true` | Enable Pyroscope server liveness |
| livenessProbe.failureThreshold | int | `3` | Pyroscope server liveness check failure threshold |
| livenessProbe.httpGet.path | string | `"/healthz"` | Pyroscope server liveness check path |
| livenessProbe.httpGet.port | int | `4040` | Pyroscope server liveness check port |
| livenessProbe.initialDelaySeconds | int | `30` | Pyroscope server liveness check intial delay in seconds  |
| livenessProbe.periodSeconds | int | `15` | Pyroscope server liveness check frequency in seconds |
| livenessProbe.successThreshold | int | `1` | Pyroscope server liveness check success threshold |
| livenessProbe.timeoutSeconds | int | `30` | Pyroscope server liveness check request timeout |
| nameOverride | string | `""` | Defaults to .Chart.Name |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Persistence access modes |
| persistence.enabled | bool | `false` | Use persistent volume to store data |
| persistence.finalizers | list | `["kubernetes.io/pvc-protection"]` | PersistentVolumeClaim finalizers |
| persistence.size | string | `"10Gi"` | Size of persistent volume claim |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Pod securityContext |
| pyroscopeConfigs | object | `{"analytics-opt-out":"false","api-bind-addr":":4040","badger-log-level":"error","base-url":"","cache-dictionary-size":"1000","cache-dimension-size":"1000","cache-segment-size":"1000","cache-tree-size":"10000","log-level":"info","max-nodes-render":"2048","max-nodes-serialization":"2048","storage-path":"/var/lib/pyroscope"}` | Map of pyroscope configs to be used for ref default: https://pyroscope.io/docs/configuration#self-documented-server-config |
| readinessProbe.enabled | bool | `true` | Enable Pyroscope server readiness |
| readinessProbe.failureThreshold | int | `3` | Pyroscope server readiness check failure threshold count |
| readinessProbe.httpGet.path | string | `"/healthz"` | Pyroscope server readiness check path |
| readinessProbe.httpGet.port | int | `4040` | Pyroscope server readiness check port |
| readinessProbe.initialDelaySeconds | int | `30` | Pyroscope server readiness initial delay in seconds |
| readinessProbe.periodSeconds | int | `5` | Pyroscope server readiness check frequency in seconds |
| readinessProbe.successThreshold | int | `1` | Pyroscope server readiness check success threshold count |
| readinessProbe.timeoutSeconds | int | `30` | Pyroscope server readiness check request timeout |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| securityContext | object | `{}` | Deployment securityContext |
| service.annotations | object | `{}` | Service annotations |
| service.port | int | `4040` | Kubernetes port where service is exposed |
| service.type | string | `"ClusterIP"` | Specify a service type |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations |
| serviceAccount.create | bool | `true` | Create service account |
| serviceAccount.name | string | `""` | Service account name to use, when empty will be set to created account if serviceAccount.create is set else to default |
| tolerations | list | `[]` | Toleration labels for pod assignment |