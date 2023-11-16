# Unified workflows - main.yml

To use unified worklow in your repository include:

 _Because we use free github the repositories must have **public** visibilites for the common actions to work._

```bash
on:
  push:
    branches:
      - main
jobs:
  build:
    uses: ZPP-QuantumAi/DevOps/.github/workflows/main.yml@main
```

Workflow main.yml combines all defined jobs in *.yml files.

You can use some specific jobs by including them instead of main workflow.

Example for docker-build.yml:

```bash
on:
  push:
    branches:
      - main
jobs:
  build:
    uses: ZPP-QuantumAi/DevOps/.github/workflows/docker-build.yml@main
```

# docker-build.yml

Docker build creates a docker image with a tag from `next-version.txt` file located
in your repository and pushes it to `ghcr.io`. One images with `latest` tag and one with the version from file.

If there is no `next-version.txt` file, version `v1.0.0` will be used and the file with the version will be pushed to repository.

Each build bumps the version in file from `vX.Y.Z` to `vX.Y.Z+1`. If you want to bump version other way do it 
manually in the `next-version.txt` file.