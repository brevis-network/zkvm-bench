#!/bin/bash
set -ex

source .env
mkdir -p ../logs

pushd openvm-benchmark

echo "Benchmarking fibonacci"
RPC_1=$RPC_1 APP=fibonacci bash run.sh >../../logs/openvm-fib_300k.log

echo "Benchmarking tendermint"
RPC_1=$RPC_1 APP=tendermint bash run.sh >../../logs/openvm-tendermint.log

echo "Benchmarking reth-17106222"
RPC_1=$RPC_1 APP=reth BLOCK_NUMBER=17106222 bash run.sh >../../logs/openvm-reth_17106222.log

echo "Benchmarking reth-20528709"
RPC_1=$RPC_1 APP=reth BLOCK_NUMBER=20528709 bash run.sh >../../logs/openvm-reth_20528709.log

popd
echo "openvm benchmark complete!"
