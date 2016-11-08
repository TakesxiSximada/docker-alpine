FROM appliedis/alpine-gosu:3.4
MAINTAINER TakesxiSximada <@TakesxiSximada>

# hashicorp vault
ARG VAULT=./build/vault
COPY ${VAULT} /usr/sbin/
