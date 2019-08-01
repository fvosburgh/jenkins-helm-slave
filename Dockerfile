FROM jenkins/jnlp-slave:3.27-1
USER root
# Install kubectl
RUN version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`echo $version`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install helm
RUN curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.14.3-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

USER jenkins
