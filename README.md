# k3d-demo-cluster


## Requirements

- [`docker`](https://docs.docker.com/get-docker/)
- [`k3d >= v5.5.0`](https://k3d.io/stable/#installation)
- [`kubens`](https://github.com/ahmetb/kubectx) callable via the `kubens` binary
- [`Helm 3`](https://helm.sh/docs/intro/install/)

## Resources

- <https://k3d.io/>
- <https://github.com/rancher/k3d>

## Run

- Preparation (attention: clears all docker settings!): `make prep`

### Create cluster
```
make create
```

### Delete Cluster
```
make delete
```
