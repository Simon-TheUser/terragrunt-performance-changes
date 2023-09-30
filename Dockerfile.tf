# Base container that contains Terraform

FROM alpine:3.18.3
ARG TF_VER

RUN	wget https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip -O /terraform.zip && \
	cd /bin && \
	unzip /terraform.zip && \
	chmod +x /bin/terraform && \
	rm -f /terraform.zip

WORKDIR /iac