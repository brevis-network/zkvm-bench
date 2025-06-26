#!/bin/bash
set -e

mkdir -p ../logs

# configurations for aws 192 CPUs
# export CHUNK_SIZE=4194304
# export CHUNK_BATCH_SIZE=32
# export SPLIT_THRESHOLD=1048576

# configurations for normal machines
# TODO: need to fix BENCH_RECURSION_MAX_CHUNK_SIZE to `1 << 21` for program reth-20528709:
# <https://github.com/brevis-network/pico/blob/v1.1.4/vm/src/primitives/consts.rs#L63>
export CHUNK_SIZE=2097152
export CHUNK_BATCH_SIZE=4
export SPLIT_THRESHOLD=32768

export RUST_LOG=info
export RUSTFLAGS="-C target-cpu=native -C target-feature=+avx512f,+avx512ifma,+avx512vl"
export JEMALLOC_SYS_WITH_MALLOC_CONF="retain:true,background_thread:true,metadata_thp:always,dirty_decay_ms:-1,muzzy_decay_ms:-1,abort_conf:true"
export VK_VERIFICATION=true

PROGRAMS=("fibonacci-300kn" "tendermint" "reth-17106222" "reth-20528709")

pushd pico

# setup gnark for on-chain proving
cargo build --release --bin gnarkctl
cp target/release/gnarkctl gnarkctl
./gnarkctl setup --field kb

for prog in "${PROGRAMS[@]}"; do
  echo "Benchmarking $prog"
  cargo run --profile perf --bin bench --features jemalloc --features nightly-features -- --programs $prog --field kb >../../logs/pico-$prog.log
done

# release gnark
./gnarkctl teardown
rm gnarkctl

popd

echo "pico benchmark complete!"
