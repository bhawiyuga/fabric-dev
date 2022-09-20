# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0

ARG GO_VER
ARG ALPINE_VER

FROM debian:bullseye as base
RUN apt update && apt install -y tzdata && apt clean
RUN addgroup --gid 500 chaincode && adduser --uid 500 --home /home/chaincode --ingroup chaincode chaincode
USER chaincode
