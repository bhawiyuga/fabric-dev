# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

ARG GO_VER
ARG ALPINE_VER
FROM golang:${GO_VER}-bullseye as golang

RUN apt update && \
	apt install -y \
	build-essential \
	git &&\
	apt clean

ADD . $GOPATH/src/github.com/hyperledger/fabric
WORKDIR $GOPATH/src/github.com/hyperledger/fabric

FROM golang as tools
RUN make configtxgen configtxlator cryptogen peer discover idemixgen

FROM golang:${GO_VER}-bullseye
# git is required to support `go list -m`
RUN apt update && \
	apt install -y \
	jq \
	tzdata \
	git &&\
	apt clean
ENV FABRIC_CFG_PATH /etc/hyperledger/fabric
VOLUME /etc/hyperledger/fabric
COPY --from=tools /go/src/github.com/hyperledger/fabric/build/bin /usr/local/bin
COPY --from=tools /go/src/github.com/hyperledger/fabric/sampleconfig ${FABRIC_CFG_PATH}
