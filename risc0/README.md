# RISC0 v1.2.1 Benchmarks

## Prerequisites
1. Install Rust:

   ```sh
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   rustup install nightly
   ```

2. Install the [Risc0 toolchain](https://dev.risczero.com/api/zkvm/install):

   ```sh
   curl -L https://risczero.com/install | bash
   source ~/.bashrc
   rzup install
   cargo risczero --version
   ```

4. Install [Docker](https://docs.docker.com/engine/install/ubuntu/).


**Note:** Run one round of a small program (e.g., Fibonacci) to download the R0 docker image before benchmarking to avoid affecting benchmark times.

**Note:** On Ubuntu 22.04, you might need to install libssl1.0 for the Risc0 toolchain. Follow these [instructions](https://stackoverflow.com/questions/72133316/libssl-so-1-1-cannot-open-shared-object-file-no-such-file-or-directory/73604364#73604364).

## Benchmark

To start the benchmark, make sure you are in the `zkvm-bench/risc0` directory and then run:

```
./run.sh
```