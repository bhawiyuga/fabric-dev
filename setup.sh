
ARCH=$(arch)

if [ "$ARCH" = "arm64" ]; then

echo "Setup for arm64 device."

rm -rf fabric
rm -rf fabric-samples
rm -rf fabric-ca

git clone -b release-2.2 https://github.com/hyperledger/fabric.git
git clone https://github.com/hyperledger/fabric-ca.git
git clone -b release-2.2 https://github.com/hyperledger/fabric-samples.git

rm -rf fabric/images/*
cp -R images-fabric-main/* fabric/images

rm -rf fabric-ca/images/*
cp -R images-fabric-ca/* fabric-ca/images

cd fabric/
make docker-clean
make docker
make native
# sudo cp build/bin/* /usr/local/bin/
export PATH=$(pwd)/bin:$PATH
cd ..

cd fabric-ca/
make docker-clean
make docker
cd ..

elif [ "$ARCH" = "amd64" ]; then

echo "Setup for amd64 device."

curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.5 1.5.2

else

echo "Unsupported architecture."

fi
