#!/bin/bash
# Runner script for arceos-helloworld
# Usage: run_qemu.sh <elf_path>
# This script is used as a Cargo runner to convert the ELF binary
# and launch it in QEMU.

set -e

ELF="$1"
BIN="${ELF%.elf}.bin"
if [ "$BIN" = "$ELF" ]; then
    BIN="${ELF}.bin"
fi

# Convert ELF to raw binary
rust-objcopy --binary-architecture=riscv64 "$ELF" --strip-all -O binary "$BIN"

# Check that the binary is not empty
if [ ! -s "$BIN" ]; then
    echo "Empty kernel image, please check your build configuration"
    exit 1
fi

# Run in QEMU
# MEM = phys-memory-size = 0x800_0000 = 128MB = 134217728 bytes
# SMP = cpu-num = 1
qemu-system-riscv64 \
    -m 134217728B \
    -smp 1 \
    -machine virt \
    -bios default \
    -kernel "$BIN" \
    -nographic
