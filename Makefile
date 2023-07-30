
.PHONY: gen-all
gen-all:
	cd todo-protocol && make gen-all
	rsync -ar todo-protocol/proto_go_gen/ todo-back/infrastructure/handler/grpc/proto_go_gen