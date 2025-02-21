#!/bin/bash
set -ex

source .env
mkdir -p openvm_logs

pushd openvm-benchmark

echo "Benchmarking fibonacci"
RPC_1=$RPC_1 APP=fibonacci bash run.sh >../openvm_logs/fib_300k.log

echo "Benchmarking tendermint"
RPC_1=$RPC_1 APP=tendermint bash run.sh >../openvm_logs/tendermint.log

echo "Benchmarking reth-17106222"
RPC_1=$RPC_1 APP=reth BLOCK_NUMBER=17106222 bash run.sh >../openvm_logs/reth_17106222.log

echo "Benchmarking reth-20528709"
RPC_1=$RPC_1 APP=reth BLOCK_NUMBER=20528709 bash run.sh >../openvm_logs/reth_20528709.log

popd
echo "openvm benchmark complete!"
