# pyroscope-ebpf

![Version: 0.1.31](https://img.shields.io/badge/Version-0.1.31-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.37.2](https://img.shields.io/badge/AppVersion-0.37.2-informational?style=flat-square)

A Helm chart for Pyroscope eBPF

## Get the Repo of Pyrscope

```console

helm repo add pyroscope-io https://pyroscope-io.github.io/helm-chart

```

## Installing the Chart

To install the chart with the release name `my-release`:

```console

helm install my-release pyroscope-io/pyroscope-ebpf

```

## Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console

helm delete my-release

```

## Configuration

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `["ebpf","--application-name","k8s.ebpf","--server-address","http://pyroscope-server:4040"]` | Arguments to be passed to the pyroscope binary |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"pyroscope/pyroscope"` | image to use for deploying |
| image.tag | string | `"0.37.2"` | Tag for pyroscope image to use |
| serviceAccount.annotations | object | `{}` | ServiceAccount annotations |
| serviceAccount.create | bool | `true` | Create service account |
| serviceAccount.name | string | `""` | Service account name to use, when empty will be set to created account if serviceAccount.create is set else to default |

## Authentication

If you are pushing data to a pyroscope server with authentication enabled,
we recommend using the property `envFromSecret` to load `PYROSCOPE_AUTH_TOKEN` as an environment variable.

For example:
```yaml
envFromSecret: "my-secret"
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  PYROSCOPE_AUTH_TOKEN: MY_SECRET_IN_BASE_64_FORM
```
