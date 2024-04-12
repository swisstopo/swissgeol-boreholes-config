# Kubernetes Deployment

The application gets deployed to a Kubernetes cluster using Helm. Deployments, services, configmaps, secrets and ingress routes are pre-defined in the Helm chart and can be customized using the `values.yaml` file.

## Validating the Chart

Validate with

```bash
helm lint .\swissgeol-boreholes
```

or pretend to install the chart to the cluster and if there is some issue it will show the error.

```bash
helm install --dry-run swissgeol-boreholes .\swissgeol-boreholes
```

## Installing the Chart

For detailed instructions on how to install and configure the Helm chart, refer to the corresponding [documentation](./swissgeol-boreholes/README.md).
