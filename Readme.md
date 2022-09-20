# Hyperledger Fabric Development Starter Pack

This repo prepares the development for Hyperledger Fabric in both amd64 and arm64 environment. The existing Fabric docker image only support amd64, therefore we should build our own image for arm64.

## Preparation
Run ``setup.sh`` script

```
chmod a+x setup.sh
./setup.sh
```
The script will build or pull following images : ``fabric``, ``fabric-ca`` and ``minifabric``.

## Chaincode Development
This project utilizes ``minifabric`` tool to setup small-Docker-based Hyperledger Fabric network. Kindly visit the [documentation page](https://github.com/hyperledger-labs/minifabric/blob/main/docs/README.md).