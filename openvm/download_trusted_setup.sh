#!/bin/bash

mkdir -p openvm-benchmark/params

for k in {5..24}; do
  wget "https://axiom-crypto.s3.amazonaws.com/challenge_0085/kzg_bn254_${k}.srs"
done

mv *.srs openvm-benchmark/params/
