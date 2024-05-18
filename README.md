My Flux GitOps Config
===

This repo houses the [Flux](https://fluxcd.io/) configuration for my Kubernetes
cluster. The manifests in this repo will set up a process to scan images for
updates based on semver tags, and rollout new deployments based on those image
tags.

To learn more about the projects that are continuously deployed in this repo,
see https://github.com/alkrauss48/kubernetes, which includes all of the setup
manifest files.

## Getting Started
The following process will install Flux into your active Kubernetes cluster, and
set up the deployments and image scanning process outlined in this repo.

First, you'll need to create a Personal Access Token on your GitHub account that
has full repo permissions.

Then, run the following:
```sh
git clone https://github.com/alkrauss48/fleet-infra.git
cd fleet-infra

cp .env .env.example
# Set your Github user

./bootstrap.sh
# Provide your Github token when asked
```

Flux should now be properly set up on your Kubernetes cluster.

## Helpful Flux Commands

```sh
# Print the statuses of all Flux resources
flux get all

# Trigger a reconciliation of sources and resources
flux reconcile kustomization flux-system --with-source

# Watch for kustomization changes
flux get kustomizations --watch

# Suspend and resume flux
flux suspend kustomization flux-system
flux resume kustomization flux-system

# Watch for kustomization changes
flux get kustomizations --watch

# Uninstall flux entirely. Be careful here.
flux uninstall
```
