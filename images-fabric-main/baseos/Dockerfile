# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

ARG GO_VER
ARG ALPINE_VER

FROM debian:bullseye as base
RUN apt update && apt install -y tzdata && apt clean
RUN addgroup --gid 500 chaincode && adduser -u 500 -D -h /home/chaincode -G chaincode chaincode
USER chaincode
