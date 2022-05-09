# fabric-image for ARM64

Dockerfile to build custom Fabric images. The original dockerfile has issue on ARM64.

## How to use?
1. Clone original hyperledger fabric project from https://github.com/hyperledger/fabric
2. Clone this repo and replace into ``images`` folder of original hyperledger fabric project
3. Inside original hyperledger fabric project directory run ``make docker`` 
