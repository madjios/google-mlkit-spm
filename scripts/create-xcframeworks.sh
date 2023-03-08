#!/bin/sh

GREEN='\033[0;32m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

ARCHIVE_PATH="build/archives"
OUTPUT_PATH="build/outputs"

PODS_ROOT="PodsProject/Pods"

build_framework() {
    TARGET_NAME="$1"

    echo "Archiving ios target: ${GREEN}$TARGET_NAME${NC}.."

    xcodebuild archive \
        -project $PODS_ROOT/Pods.xcodeproj \
        -scheme "$TARGET_NAME" \
        -configuration Release \
        -destination 'generic/platform=iOS' \
        -archivePath "$ARCHIVE_PATH/$TARGET_NAME-ios.xcarchive" \
        -quiet \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "Archiving iphonesimulator target: ${GREEN}$TARGET_NAME${NC}.."

    xcodebuild archive \
        -project $PODS_ROOT/Pods.xcodeproj \
        -scheme "$TARGET_NAME" \
        -configuration Release \
        -destination 'generic/platform=iOS Simulator' \
        -archivePath "$ARCHIVE_PATH/$TARGET_NAME-iphonesimulator.xcarchive" \
        -quiet \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES
}

create_xcframework() {
    TARGET_NAME="$1"

    CMD="xcodebuild -create-xcframework -framework $ARCHIVE_PATH/$TARGET_NAME-ios.xcarchive/Products/Library/Frameworks/$TARGET_NAME.framework"

    SYMBOLS_DIR="$ARCHIVE_PATH/$TARGET_NAME-ios.xcarchive/dSYMs"

    for entry in "$SYMBOLS_DIR"/*
    do
        CMD+=" -debug-symbols $(pwd)/$entry"
    done

    CMD+=" -output $OUTPUT_PATH/$TARGET_NAME.xcframework"

    echo "Create xcframework for target: ${GREEN}$TARGET_NAME${NC}.."
    eval $CMD
    echo ""
}

build_make_xcframework_tool() {
    echo "Build ${GREEN}xcframework-maker${NC}.."
    (cd "xcframework-maker" && swift build -c release)
    echo ""
}

make_xcframework() {
    TARGET_NAME="$1"

    MAKE_XCFRAMEWORK_PATH="./xcframework-maker/.build/release/make-xcframework"

    echo "Make xcframework for target: ${GREEN}$TARGET_NAME${NC}.."
    $MAKE_XCFRAMEWORK_PATH -ios "$PODS_ROOT/$TARGET_NAME/Frameworks/$TARGET_NAME.framework" -output "$OUTPUT_PATH/"
}

zip_xcframework() {
    TARGET_NAME="$1"

    zip -r "$TARGET_NAME.xcframework.zip" "$TARGET_NAME.xcframework" > /dev/null
    echo "Checksum: ${GREEN}$TARGET_NAME${NC}"
    swift package compute-checksum "$TARGET_NAME.xcframework.zip" | tee "$TARGET_NAME.xcframework.zip.shasum"
    echo ""
}

FRAMEWORK_TARGETS="MLImage MLKitBarcodeScanning MLKitCommon MLKitVision"
SOURCE_TARGETS="GoogleToolboxForMac GoogleUtilitiesComponents Protobuf"

rm -rf "$ARCHIVE_PATH"
rm -rf "$OUTPUT_PATH"

build_make_xcframework_tool

for TARGET_NAME in $FRAMEWORK_TARGETS
do
    make_xcframework $TARGET_NAME
done

echo "\nBuild source-based frameworks...\n"

for TARGET_NAME in $SOURCE_TARGETS
do
    build_framework $TARGET_NAME
    create_xcframework $TARGET_NAME
done

echo "Zip xcframeworks and generate SHA256...\n"

ALL_TARGETS="$FRAMEWORK_TARGETS $SOURCE_TARGETS"

for TARGET_NAME in $ALL_TARGETS
do
    (cd "$OUTPUT_PATH" && zip_xcframework $TARGET_NAME)
done