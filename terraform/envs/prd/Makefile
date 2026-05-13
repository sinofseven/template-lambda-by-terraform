SHELL = /usr/bin/env bash -xeuo pipefail

init:
	@terraform init \
		-backend-config="bucket=$$BACKEND_S3_BUCKET" \
		-backend-config="key=$$BACKEND_S3_KEY" \
		-backend-config="region=$$BACKEND_REGION"

plan:
	@terraform plan

apply:
	@terraform apply -auto-approve


.PHONY: \
	init \
	plan \
	apply
