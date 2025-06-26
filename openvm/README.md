# openvm benchmark

## Prerequisite

1. Setup as the main README.

2. Install [Rust](https://www.rust-lang.org/tools/install).

3. Install cargo-openvm CLI by `cargo install --git 'http://github.com/openvm-org/openvm.git' --tag v1.2.1-rc.0 cargo-openvm`.

4. Run `download_trusted_setup.sh` to download trusted setup files.

5. Set a RPC URL of full node to `RPC_1` in `.env` file.

## Benchmark

Execute the `run.sh` directly for the first time, after complete check the output results in the `logs` folders.
Then you could re-execute with the cache eth data by `CACHE=true run.sh`.
