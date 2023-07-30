
.PHONY: gen-all
gen-all:
	cd todo-protocol && make gen-all
	rsync -ar todo-protocol/proto_go_gen/ todo-back/infrastructure/handler/grpc/proto_go_gen

.PHONY: dev-up
dev-up:
	docker compose --file docker-compose.dev.yml build
	docker compose --file docker-compose.dev.yml up 

cleanup-local:
	rm -rf local_data