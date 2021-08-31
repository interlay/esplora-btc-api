.PHONY: rust-client
rust-client:
	npx @openapitools/openapi-generator-cli generate \
		--generator-name rust \
		--config rust-openapi-config.json \
		--input-spec api.yaml \
		--output rust-client

.PHONY: ts-client
ts-client:
	npx @openapitools/openapi-generator-cli generate \
		--generator-name typescript-axios \
		--config ts-openapi-config.json \
		--input-spec api.yaml \
		--output ts-client
