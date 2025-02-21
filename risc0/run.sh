#!/bin/bash

if [ ! -d "zkvm-perf" ]; then
  echo "Error: risc0 zkvm-perf submodule does not exist. Please initialize and update the submodule."
  exit 1
fi

cd zkvm-perf

if [ ! -d "../../logs" ]; then
  echo "Logs directory does not exist, creating it."
  mkdir -p ../../logs || { echo "Failed to create logs directory."; exit 1; }

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