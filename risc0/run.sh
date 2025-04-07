#!/bin/bash

cd zkvm-perf

if [ ! -d "../../logs" ]; then
  echo "Logs directory does not exist, creating it."
  mkdir -p ../../logs || { echo "Failed to create logs directory."; exit 1; }
fi

commands=(
  # dummy test to warm up R0 docker image
  "RISC0_FEATURE_bigint2=1 ./eval.sh fibonacci300kn risc0 poseidon 21 benchmark > ../../logs/risc0_f_300kn.log"
  
  "RISC0_FEATURE_bigint2=1 ./eval.sh fibonacci300kn risc0 poseidon 21 benchmark > ../../logs/risc0_f_300kn.log"
  "RISC0_FEATURE_bigint2=1 ./eval.sh tendermint risc0 poseidon 21 benchmark > ../../logs/risc0_tendermint.log"
  "RISC0_FEATURE_bigint2=1 ./eval.sh rsp17106222 risc0 poseidon 21 benchmark > ../../logs/risc0_rsp17106222.log"
  "RISC0_FEATURE_bigint2=1 ./eval.sh rsp20528709 risc0 poseidon 21 benchmark > ../../logs/risc0_rsp20528709.log"
)

for cmd in "${commands[@]}"; do
  echo "Executing: $cmd"
  eval $cmd
done

cp benchmarks/benchmarks_latest.csv ../../logs/risc0_bench.csv

cd ..

echo "risc0 benchmark complete!"