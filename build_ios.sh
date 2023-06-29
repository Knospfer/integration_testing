output="../build/ios_integ"
product="build/ios_integ/Build/Products"
dev_target="16.4" #occhio a tenerla aggiornata
configuration="Release" #Debug Release

#https://firebase.google.com/docs/test-lab/ios/run-xctest?authuser=0
#https://github.com/flutter/flutter/tree/main/packages/integration_test#ios-device-testing

#ricordati di firmare il target dei test su xcode

# flutter build ios --config-only integration_test/app_test.dart

flutter clean && flutter pub get

# Pass --simulator if building for the simulator.
flutter build ios integration_test/app_test.dart --release #--release

pushd ios
xcodebuild build-for-testing \
  -workspace Runner.xcworkspace \
  -scheme Runner \
  -xcconfig Flutter/Release.xcconfig \
  -configuration $configuration \
  -derivedDataPath $output \
  -sdk iphoneos
popd

#"/Users/mattia/Lavoro/integration_testing/ios/DerivedData"\

pushd $product
zip -r "ios_tests.zip" "$configuration-iphoneos" "Runner_iphoneos$dev_target-arm64.xctestrun"
popd

sh is_ios_working.sh

# se non usi ios 16.5, il 15.7 non becca gli entitlements giusti su firebase maledetto