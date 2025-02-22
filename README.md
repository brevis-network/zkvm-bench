# zkvm-bench

This repository provides instructions for benchmarking four zkVMs: RISC0, OpenVM, SP1, and Pico.

Our initial benchmarks —- detailed in our [blog post](https://blog.brevis.network/2025/02/11/introducing-pico-a-modular-and-performant-zkvm/) -— present an apple-to-apple comparison by running each zkVM on identical hardware (`r7a.x48large`), compiling the same Rust program, and executing without compiler acceleration or custom parameters. This consistent approach was applied across all zkVMs, including Pico, ensuring fairness.

While these results effectively showcase each zkVM's capabilities, we recognize that teams behind these VMs may prefer optimized settings. We hereby offer benchmarks configured to each zkVM's strengths. For RISC0 and SP1, we use settings from their [`zkvm-perf`](https://github.com/succinctlabs/zkvm-perf) repository, and for OpenVM, we use settings from the [`openvm-reth-benchmark`](https://github.com/axiom-crypto/openvm-reth-benchmark) repository. This approach allows each zkVM to demonstrate its best possible performance on CPU.

## Setup

Initialize the git sub-modules:
```shell
git submodule update --init --recursive
```

## Machine and OS

- AWS: `r7a.48xlarge` (192 CPUs)
- OS: `ubuntu-24.04-amd64-server`

## Process

- To benchmark RISC0, please follow instructions in [risc0/README](risc0/README.md)
- To benchmark OpenVM, please follow instructions in [openvm/README](openvm/README.md)
- To benchmark SP1, please follow instructions in [sp1/README](sp1/README.md)
- To benchmark Pico, please follow instructions in [pico/README](pico/README.md)
