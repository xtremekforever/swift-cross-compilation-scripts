#!/bin/bash

set -e
source common-defines

mkdir -p $WORKSPACE_DIR
cd $WORKSPACE_DIR

# Fetch sources
if [[ -d $SWIFT_SRCDIR ]]; then
    echo "$SWIFT_SRCDIR exists"
    cd $SWIFT_SRCDIR
    git stash
else
    echo "Checkout Swift"
    git clone https://github.com/swiftlang/swift.git
    cd $SWIFT_SRCDIR
fi

# We skip many directories below that are not needed for cross-compilation,
# but they can be added back in once they are needed.
./utils/update-checkout --clone --tag $SWIFT_VERSION \
    --skip-repository cmake \
    --skip-repository cmark \
    --skip-repository curl \
    --skip-repository icu \
    --skip-repository indexstore-db \
    --skip-repository llbuild \
    --skip-repository libxml2 \
    --skip-repository ninja \
    --skip-repository sourcekit-lsp \
    --skip-repository swift-asn1 \
    --skip-repository swift-async-algorithms \
    --skip-repository swift-atomics \
    --skip-repository swift-argument-parser \
    --skip-repository swift-build \
    --skip-repository swift-certificates \
    --skip-repository swift-crypto \
    --skip-repository swift-docc \
    --skip-repository swift-docc-render-artifact \
    --skip-repository swift-docc-symbolkit \
    --skip-repository swift-driver \
    --skip-repository swift-format \
    --skip-repository swift-installer-scripts \
    --skip-repository swift-integration-tests \
    --skip-repository swift-log \
    --skip-repository swift-llvm-bindings \
    --skip-repository swift-lmdb \
    --skip-repository swift-markdown \
    --skip-repository swift-nio \
    --skip-repository swift-nio-ssl \
    --skip-repository swift-numerics \
    --skip-repository swift-stress-tester \
    --skip-repository swift-system \
    --skip-repository swift-tools-support-core \
    --skip-repository swift-xcode-playground-support \
    --skip-repository swiftpm \
    --skip-repository tensorflow-swift-apis \
    --skip-repository wasi-libc \
    --skip-repository wasmkit \
    --skip-repository yams \
    --skip-repository zlib
