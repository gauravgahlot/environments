#!/bin/bash

set -eux

export RUSTFLAGS="-C target-feature=-crt-static"
if [ -f "${SRC_PKG}"/Cargo.toml ]; then
    echo "Building rust cargo project in $SRC_PKG"
else
  echo "Not a rust cargo project, exiting"
  exit 1
fi

# change directory to source package
cd ${SRC_PKG}

# get the target_directory
target_dir=$(cargo metadata --format-version 1 | jq '.target_directory' | sed 's/"//g')

# start cargo build in release mode
cargo build --release --verbose

# copy the generated artifact
cp "${target_dir}/release/lib${project_name}".so "${DEPLOY_PKG}/handler.so"
