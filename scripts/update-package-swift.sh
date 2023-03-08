#!/bin/sh

GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

ALL_TARGETS="MLImage MLKitBarcodeScanning MLKitCommon MLKitVision GoogleToolboxForMac GoogleUtilitiesComponents Protobuf"

for TARGET_NAME in $ALL_TARGETS
do
    CHECKSUM=$(cat build/outputs/$TARGET_NAME.xcframework.zip.shasum)
    URL="https://github.com/kientux/google-mlkit-spm/releases/download/$TARGET_VERSION/$TARGET_NAME.xcframework.zip"
    sed -Ei '' "s|name: \"$TARGET_NAME\".+\)|name: \"$TARGET_NAME\", url: \"$URL\", checksum: \"$CHECKSUM\"\)|g" Package.swift
done