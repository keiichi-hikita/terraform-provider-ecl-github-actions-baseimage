FROM hashicorp/terraform:0.12.3

RUN apk --no-cache add jq curl unzip wget

ENV TF_ECL_PROVIDER_VERSION="v1.1.0"
ENV OS=linux
ENV PLUGINS_DIR="~/.terraform.d/plugins/${OS}_amd64"
ENV PROVIDER_ZIP="https://github.com/nttcom/terraform-provider-ecl/releases/download/${TF_ECL_PROVIDER_VERSION}/terraform-provider-ecl_${TF_ECL_PROVIDER_VERSION}_${OS}_amd64.zip"

RUN mkdir -p ${PLUGINS_DIR}; \
    cd ${PLUGINS_DIR}; \
    wget ${PROVIDER_ZIP}; \
    ls -l ; \
    unzip terraform-provider-ecl_${TF_ECL_PROVIDER_VERSION}_${OS}_amd64.zip

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

