# pyroscope

![Version: 0.2.92](https://img.shields.io/badge/Version-0.2.92-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.37.2](https://img.shields.io/badge/AppVersion-0.37.2-informational?style=flat-square)

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

## Persistence

The official Pyroscope container image runs pyroscope server process with user ID `101`. The chart uses this value as
default pod security context `fsGroup`. This includes all processes of the container to the supplemental group and makes
kubelet to change the ownership of mounted volumes to this group (recursively; setgid bit is set).

If you restrict pod security (for example, using `SecurityContextConstraints` or `PodSecurityPolicy`), you may need to
override `fsGroup` with a value from the valid range.

## Pyroscope configuration

`pyroscopeConfigs` parameter may include any supported pyroscope server configuration option.
Please refer to [the documentation](https://pyroscope.io/docs/server-configuration) for details.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity settings for pod assignment |
| deploymentStrategy | object | `{"type":"Recreate"}` | Deployment strategy |
| env | object | `{}` | Extra environment variables |
| extraLabels | object | `{}` | Extra common labels for all resources |
| extraVolumeMounts | list | `[]` | Additional volume mounts for pyroscope server container |
| extraVolumes | list | `[]` | Additional volumes |
| fullnameOverride | string | `""` | Defaults to .Release.Name-.Chart.Name unless .Release.Name contains "pyroscope" |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"pyroscope/pyroscope"` | image to use for deploying |
| image.tag | string | `"0.37.2"` | Tag for pyroscope image to use |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | `{}` | Ingress annotations (values are templated) |
| ingress.className | string | `""` | Ingress class name |
| ingress.enabled | bool | `false` | Enables Ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"Prefix"}]}]` | Ingress accepted hostnames |
| ingress.rules | list | `[]` | Ingress custom rules. Take precedence over chart built-ins. |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| initContainers | list | `[]` |  |
| livenessProbe.enabled | bool | `true` | Enable Pyroscope server liveness |
| livenessProbe.failureThreshold | int | `3` | Pyroscope server liveness check failure threshold |
| livenessProbe.httpGet.path | string | `"/healthz"` | Pyroscope server liveness check path |
| livenessProbe.httpGet.port | int | `4040` | Pyroscope server liveness check port |
| livenessProbe.initialDelaySeconds | int | `30` | Pyroscope server liveness check intial delay in seconds |
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
| podSecurityContext | object | `{"fsGroup":101}` | Pod securityContext |
| pyroscopeConfigs | object | `{}` | Pyroscope server configuration. Please refer to https://pyroscope.io/docs/server-configuration |
| rbac.clusterRole.annotations | object | `{}` | Cluster role annotations |
| rbac.clusterRole.extraRules | list | `[]` | Extra rules for created cluster role |
| rbac.clusterRole.name | string | `""` | Cluster role name. If not set, the fully qualified app name is used |
| rbac.clusterRoleBinding.annotations | object | `{}` | Cluster role binding annotations |
| rbac.clusterRoleBinding.name | string | `""` | Cluster role binding name. If not set, the fully qualified app name is used |
| rbac.create | bool | `false` | Creates Pyroscope cluster role and binds service account to it; requires service account to be created |
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