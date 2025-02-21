# SP1 v4.0.1 Benchmarks

## Prerequisites

1. Install Rust:

   ```sh
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   rustup install nightly
   ```

2. Install the [SP1 toolchain](https://docs.succinct.xyz/getting-started/install.html):

   ```sh
   curl -L https://sp1.succinct.xyz | bash
   source ~/.bashrc
   sp1up
   cargo prove --version
   ```

3. Install [Go](https://go.dev/).

4. Install [Docker](https://docs.docker.com/engine/install/ubuntu/).


## Benchmark

To start the benchmark, make sure you are in the `zkvm-bench/sp1` directory and then run:

```
./run.sh
```