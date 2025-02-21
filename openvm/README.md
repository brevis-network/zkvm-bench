# openvm benchmark

## Prerequisite

Initialize the openvm environment:
- [Install cargo-openvm CLI](https://github.com/brevis-network/openvm-reth-benchmark?tab=readme-ov-file#installing-the-cargo-openvm-cli)
- Run `download_trusted_setup.sh` to download trusted setup files
- Set a RPC URL of full node to `RPC_1` in `.env` file

## Benchmark

Execute the `run.sh` directly for the first time, after that the outputs are saved in the `openvm_logs` folders.
Then you could re-execute with the cache eth data by `CACHE=true run.sh`.
