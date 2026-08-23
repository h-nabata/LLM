# Local LLM Benchmark Suite

Qiita記事で使用したローカルLLMベンチマーク一式です。

## 内容

ZIPファイルには以下が含まれます。

- Core benchmark: 128問
- Challenge benchmark: 80問
- benchmark runner
- grader
- performance / long-context benchmark scripts
- configuration files
- unit tests
- report generation scripts

## 使用したデータセット

Core:
- `datasets/core_v2.1.0.jsonl`
- SHA256:
  `0ba952bfd03db1cda89d15fa31f0b6ecd07e0b2c3cc9a3ec12633b4e84369b1e`

Challenge:
- `datasets/challenge_v1.1.0.jsonl`
- SHA256:
  `0c18e8ae51d88a441ecdff33df4e071fee3bdb817481ec1694365239d3da9546`

合計208問です。

## 実行環境について

本パッケージは `llama.cpp` の `llama-server` を利用します。

実際のモデルパス、llama.cppのパス、GPU構成に応じて
`config/user.yaml` を変更してください。

Qiita記事で使用した主な評価条件は以下です。

- context size: 8192
- max completion tokens: 4096
- temperature: 0
- top_p: 1.0
- Flash Attention: ON
- KV cache: F16
- prompt cache reuse: OFF

## 実行

環境確認:

```bash
./run.sh validate
```

簡易テスト:

```bash
./run.sh quick
```

フルベンチマーク:

```bash
./run.sh full
```



# 注意

本問題セットおよびgraderには、機械判定上の既知の限界があります。
特にJSON taxonomyの境界、コードunit testの網羅性、
token上限によるtruncationなどにより、
意味的には妥当な回答がFAILとなる場合があります。

そのため、記事中ではstrict scoreと目視による参考評価を分けて扱っています。

また、本問題セットを公開することにより、
将来のモデルでは学習データへの混入
（benchmark contamination）が生じる可能性があります。

# License

スクリプト類: MIT License

Benchmark questions / metadata:
CC BY 4.0
