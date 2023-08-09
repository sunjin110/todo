
# install
https://github.com/grpc/grpc-web/releases/download/1.4.2/protoc-gen-grpc-web-1.4.2-darwin-aarch64

wget https://github.com/grpc/grpc-web/releases/download/1.4.2/protoc-gen-grpc-web-1.4.2-darwin-aarch64

grpcurl -plaintext -import-path /Users/yun_sunjin/develop/todo/todo-protocol/proto -proto /Users/yun_sunjin/develop/todo/todo-protocol/proto/alive/alive.proto -max-time 0.5 localhost:3010  alive.Alive/Ping

grpcurl -insecure -import-path /Users/yun_sunjin/develop/todo/todo-protocol/proto -proto /Users/yun_sunjin/develop/todo/todo-protocol/proto/alive/alive.proto -max-time 0.5 localhost:3010  alive.Alive/Ping


dart pub global activate protoc_plugin