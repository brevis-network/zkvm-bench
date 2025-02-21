#!/bin/bash

cd zkvm-perf

commands=(
  ./eval.sh fibonacci300kn risc0 poseidon 21 benchmark > ../../logs/risc0_f_300kn.log
  ./eval.sh tendermint risc0 poseidon 21 benchmark > ../../logs/risc0_tendermint.log
  ./eval.sh rsp20528709 risc0 poseidon 21 benchmark > ../../logs/risc0_rsp20528709.log
  ./eval.sh rsp17106222 risc0 poseidon 21 benchmark > ../../logs/risc0_rsp17106222.log
)

for cmd in "${commands[@]}"; do
  echo "Executing: $cmd"
  eval $cmd
done

cp benchmarks/benchmarks_latest.csv ../../logs/risc0_bench.csv

cd ..