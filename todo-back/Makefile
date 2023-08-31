
.PHONY: run
run:
	source .env.sh && go run cmd/server/main.go

.PHONY: docker_build
docker_build:
	docker build -t asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production:v1 .

.PHONY: docker_push
docker_push:
	docker push asia-northeast1-docker.pkg.dev/alma-project-110/todo-backend-production:v1

.PHONEY: docker_auth
docker_auth:
	gcloud auth login
	gcloud auth configure-docker asia-northeast1-docker.pkg.dev