#!/bin/bash
set -e

mkdir -p pico_logs

export CHUNK_SIZE=4194304
export CHUNK_BATCH_SIZE=32
export SPLIT_THRESHOLD=1048576
export RUST_LOG=info
export RUSTFLAGS="-C target-cpu=native -C target-feature=+avx512f,+avx512ifma,+avx512vl"
export JEMALLOC_SYS_WITH_MALLOC_CONF="retain:true,background_thread:true,metadata_thp:always,dirty_decay_ms:-1,muzzy_decay_ms:-1,abort_conf:true"

PROGRAMS=("fibonacci-300kn" "tendermint" "reth-17106222" "reth-20528709")

pushd pico
for prog in "${PROGRAMS[@]}"; do
  echo "Benchmarking $prog"
  cargo run --profile perf --bin bench --features jemalloc --features nightly-features -- --programs $prog --field kb_vk >../pico_logs/$prog.log
done
popd

echo "pico benchmark complete!"
