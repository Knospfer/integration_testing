#https://github.com/flutter/flutter/tree/main/packages/integration_test#firebase-test-lab
pushd android
# flutter build generates files in android/ for building the app

#mi sono rotto le balle di non beccare java
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home

flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget="/Users/mattia/Lavoro/integration_testing/integration_test/app_test.dart"
popd