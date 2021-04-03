# set framework folder name
FRAMEWORK_FOLDER_NAME="DoubleConversion"
# set framework name or read it from project by this variable
FRAMEWORK_NAME="DoubleConversion"
#xcframework path
HOME_DIR="$(pwd)"
PROJECT_DIR="${HOME_DIR}/DoubleConversion"
ARCHIVE_PATH="${HOME_DIR}/archives"
FRAMEWORK_PATH="${HOME_DIR}/framework"
rm -rf "${FRAMEWORK_PATH}"
mkdir -p "${FRAMEWORK_PATH}"
# set path for iOS simulator archive
SIMULATOR_ARCHIVE_PATH="${ARCHIVE_PATH}/simulator/${FRAMEWORK_FOLDER_NAME}/simulator.xcarchive"
# set path for iOS device archive
IOS_DEVICE_ARCHIVE_PATH="${ARCHIVE_PATH}/device/${FRAMEWORK_FOLDER_NAME}/iOS.xcarchive"
rm -rf "${ARCHIVE_PATH}"
echo "Deleted ${ARCHIVE_PATH}"
mkdir "${ARCHIVE_PATH}"
echo "Created ${ARCHIVE_PATH}"
echo "Archiving ${FRAMEWORK_NAME}"
xcodebuild archive  -project "${PROJECT_DIR}/DoubleConversion.xcodeproj" -scheme "${FRAMEWORK_NAME}" -destination="iOS Simulator" -archivePath "${SIMULATOR_ARCHIVE_PATH}" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
xcodebuild archive -project "${PROJECT_DIR}/DoubleConversion.xcodeproj" -scheme ${FRAMEWORK_NAME} -destination="iOS" -archivePath "${IOS_DEVICE_ARCHIVE_PATH}" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
#Creating XCFramework
xcodebuild -create-xcframework -framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -framework ${IOS_DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework -output "${FRAMEWORK_PATH}/${FRAMEWORK_NAME}.xcframework"
# rm -rf "${SIMULATOR_ARCHIVE_PATH}"
# rm -rf "${IOS_DEVICE_ARCHIVE_PATH}"
# rm -rf "${ARCHIVE_PATH}"
open "${FRAMEWORK_PATH}"
