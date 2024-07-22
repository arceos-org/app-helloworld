# app-helloworld

[![CI](https://github.com/arceos-org/app-helloworld/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/arceos-org/app-helloworld/actions/workflows/ci.yml)

A "Hello, world!" application on [ArceOS](https://github.com/arceos-org/arceos).

## Quick Start

### 1. Install Build Dependencies

Install [cargo-binutils](https://github.com/rust-embedded/cargo-binutils) to use `rust-objcopy` and `rust-objdump` tools:

```bash
cargo install cargo-binutils
```

Download ArceOS source code:

```bash
./scripts/get_deps.sh
```

The ArceOS repository will be cloned into `.arceos`.
You can also skip this step by specifying the `AX_ROOT` parameter when running the `make` command.

### 2. Build & Run

```bash
make ARCH=<arch> LOG=<log> run
```

Where `<arch>` should be one of `riscv64`, `aarch64`, `x86_64`.

`<log>` should be one of `off`, `error`, `warn`, `info`, `debug`, `trace`.

Other arguments are the same as ArceOS's [Makefile](https://github.com/arceos-org/arceos/blob/main/Makefile).

For example, to run on `qemu-system-aarch64` with 4 cores and log level `info`:

```bash
make ARCH=aarch64 LOG=info SMP=4 run
```

[![Run app-helloworld on ArceOS](img/demo.gif)](https://asciinema.org/a/669147?autoplay=1)
