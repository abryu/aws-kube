FROM argoproj/argocd:v1.5.7

USER root
RUN apt-get update && \
    apt-get install -y \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER argocd

ARG AWS_PLUGIN_VERSION="0.10.0"
ARG AWS_PLUGIN_REPO="https://github.com/hypnoglow/helm-s3.git"

RUN helm plugin install ${AWS_PLUGIN_REPO} --version ${AWS_PLUGIN_VERSION}

ENV HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/"
