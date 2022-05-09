#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
ARG GO_VER
ARG ALPINE_VER

FROM golang:${GO_VER}-bullseye as builder
ARG GO_LDFLAGS
ARG GO_TAGS

RUN apt update && \
	apt install -y \
	build-essential \
	git &&\
	apt clean

ADD . /build/fabric-ca
WORKDIR /build/fabric-ca
RUN go install -tags "${GO_TAGS}" -ldflags "${GO_LDFLAGS}" \
	github.com/hyperledger/fabric-ca/cmd/fabric-ca-server \
	&& go install -tags "${GO_TAGS}" -ldflags "${GO_LDFLAGS}" \
	github.com/hyperledger/fabric-ca/cmd/fabric-ca-client


FROM golang:${GO_VER}-bullseye
RUN apt update && apt install -y tzdata && apt clean
ENV FABRIC_CA_HOME /etc/hyperledger/fabric-ca-server
COPY --from=builder /go/bin /usr/local/bin
EXPOSE 7054
CMD fabric-ca-server start -b admin:adminpw
