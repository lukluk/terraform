FROM alpine:latest
RUN apk update
RUN apk add curl
RUN apk add wget
RUN apk add unzip
RUN apk add --no-cache gomplate
RUN export release="1.5.0"
RUN wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip
RUN unzip terraform_1.5.0_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
RUN curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh
COPY view/* /view/
COPY tuan-crab tuan-crab
RUN chmod +X tuan-crab
COPY tuan-crab /usr/local/bin/tuan-crab