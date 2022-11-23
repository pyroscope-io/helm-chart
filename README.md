# Pyroscope Helm Chart

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

The code is provided as-is with no warranties.

## Usage

[Helm](https://helm.sh) must be installed to use the chart.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

### Get the Repo of Pyrscope

```console

helm repo add pyroscope-io https://pyroscope-io.github.io/helm-chart

```

### Installing the Chart

To install the chart with the release name `my-release`:

```console

helm install my-release pyroscope-io/pyroscope -n pyroscope --create-namespace

```

### Uninstalling the Chart

To uninstall/delete the my-release deployment:

```console

helm delete my-release

```

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->

Chart documentation is available in [chart directory](https://github.com/pyroscope-io/helm-chart/blob/main/chart/pyroscope/README.md).

## Contributing

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->

We'd love to have you contribute! Please refer to our [contribution guidelines](https://github.com/pyroscope-io/helm-chart/blob/main/CONTRIBUTING.md) for details.

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->

[Apache 2.0 License](https://github.com/pyroscope-io/helm-chart/blob/main/LICENSE).
