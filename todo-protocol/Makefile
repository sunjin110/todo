# プロトコルバッファファイルのパスを取得
PROTOS := $(shell find proto -name '*.proto')
# 出力ディレクトリ
GO_OUT_DIR := proto_go_gen

# TypeScriptのための出力ディレクトリ
TS_OUT_DIR := proto_ts_gen

.PHONY: gen-all
gen-all:
	@make go-protogen
	@make ts-protogen

# コード生成のターゲット
.PHONY: protogen
go-protogen: $(PROTOS)
	@mkdir -p $(GO_OUT_DIR)
	@for proto in $^ ; do \
		protoc -I proto \
		--go_out=$(GO_OUT_DIR) --go_opt=paths=source_relative \
		--go-grpc_out=$(GO_OUT_DIR) --go-grpc_opt=paths=source_relative \
		$$proto; \
	done \

# TypeScriptのコード生成のターゲット
.PHONY: ts-protogen
ts-protogen: $(PROTOS)
	@mkdir -p $(TS_OUT_DIR)
	@for proto in $^ ; do \
		protoc -I proto \
		--grpc-web_out=import_style=typescript,mode=grpcweb:$(TS_OUT_DIR) \
		$$proto; \
	done


.PHONY: format
format:
	find ./ -name "*.proto" | xargs clang-format -i

# クリーンアップ
.PHONY: clean
clean:
	rm -rf $(GO_OUT_DIR)
	rm -rf $(TS_OUT_DIR)
