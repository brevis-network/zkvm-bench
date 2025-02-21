#!/bin/bash

cd zkvm-perf

commands=(
  "./eval.sh fibonacci300kn sp1 poseidon 21 benchmark  > ../../logs/sp1-fibo-300kn.log"
  "./eval.sh rsp17106222 sp1 poseidon 21 benchmark 17106222 > ../../logs/sp1-reth-17106222.log"
  "./eval.sh tendermint sp1 poseidon 21 benchmark > ../../logs/sp1-tendermint.log"
  "./eval.sh rsp20528709 sp1 poseidon 21 benchmark 20528709 > ../../logs/sp1-reth-20528709.log"
)

for cmd in "${commands[@]}"; do
  echo "Executing: $cmd"
  eval $cmd
done

cp benchmarks/benchmarks_latest.csv ../../logs/sp1_bench.csv

cd ..