
.PHONY: run
run:
	source .env.sh && go run cmd/server/main.go

.PHONEY: docker_apply
docker_apply:
	@make docker_build
	@make docker_push
	@make cloud_run_deploy

.PHONY: docker_build
docker_build:
	docker build --platform linux/amd64 -t asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production/todo-back:v1 .

.PHONY: docker_push
docker_push:
	docker push asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production/todo-back:v1

.PHONEY: docker_auth
docker_auth:
	gcloud auth login
	gcloud auth configure-docker us-central1-docker.pkg.dev,asia-northeast1-docker.pkg.dev

.PHONEY: cloud_run_deploy
cloud_run_deploy:
	gcloud run deploy todo-backend-production --region asia-northeast1 --image asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production/todo-back:v1