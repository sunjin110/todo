
.PHONEY: tf_fmt
tf_fmt:
	terraform fmt -recursive

.PHONEY: tf_init_local
tf_init_local:
	@cd "$(PWD)/env/local" && terraform init

.PHONEY: tf_plan_local
tf_plan_local:
	@cd "$(PWD)/env/local" && terraform plan

.PHONEY: tf_apply_local
tf_apply_local:
	@cd "$(PWD)/env/local" && terraform apply

.PHONEY: tf_init_prod
tf_init_prod:
	@cd "$(PWD)/env/production" && terraform init

.PHONEY: tf_plan_prod
tf_plan_prod:
	@cd "$(PWD)/env/production" && terraform plan

.PHONEY: tf_apply_prod
tf_apply_prod:
	@cd "$(PWD)/env/production" && terraform apply