FROM hashicorp/terraform:0.12.3

RUN apk --no-cache add jq curl

# ENV TF_ECL_PROVIDER_VERSION="v1.1.0"
# ENV OS_TYPE=linux
ENV PLUGINS_DIR="~/.terraform.d/plugins/${OS_TYPE}_amd64"
ENV PROVIDER_ZIP="https://github.com/nttcom/terraform-provider-ecl/releases/download/${TF_ECL_PROVIDER_VERSION}/terraform-provider-ecl_${TF_ECL_PROVIDER_VERSION}_${OS_TYPE}_amd64.zip"

RUN cd /; \
    wget ${PROVIDER_ZIP}; \
    unzip terraform-provider-ecl_${TF_ECL_PROVIDER_VERSION}_${OS_TYPE}_amd64.zip; \
    rm terraform-provider-ecl_${TF_ECL_PROVIDER_VERSION}_${OS_TYPE}_amd64.zip;\
    mv terraform-provider-ecl* terraform-provider-ecl

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

