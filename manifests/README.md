# Adding new services
When adding new service, make sure that:

1. its k8s manifest is in `/manifests` and is named `<service-name>.yml`
2. its `deployment` is named the same as the service
3. its `service` is named the same as the service