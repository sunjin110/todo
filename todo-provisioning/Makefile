
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
	