# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

ARG GO_VER
ARG ALPINE_VER
FROM golang:${GO_VER}-bullseye
RUN apt update && \
	apt install -y \
	build-essential \
	git &&\
	apt clean

RUN mkdir -p /chaincode/output /chaincode/input
RUN addgroup --gid 500 chaincode && adduser --uid 500 --home /home/chaincode --ingroup chaincode chaincode
RUN chown -R chaincode:chaincode /chaincode
USER chaincode
