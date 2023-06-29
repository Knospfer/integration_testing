deviceId="00008020-000D1C622151002E" #"00008020-000D1C622151002E" #F0C0A06B-EA41-4959-891A-76DFF4EC30A5   #iphone14 liscio -> lo trovi su xcode window -> devices and simulators
dev_target="16.4"

xcodebuild test-without-building \
  -xctestrun "build/ios_integ/Build/Products/Runner_iphoneos$dev_target-arm64.xctestrun" \
  -destination id=$deviceId


#Questo è quello che fa xcode quando fai PRoduct Test
# pushd ios


#se cerchi esempi trovi solo col project ma a te serve worskspace perchè hai i pods
# xcodebuild \
#  test \
#  -workspace Runner.xcworkspace\ 
#  -scheme Runner\
#  -destination id=$deviceId

 #cd ios && xcodebuild test -project Runner.xcodeproj -list   

#  Information about workspace "Runner":
#     Schemes:
#         Flutter
#         integration_test
#         Pods-Runner
#         Pods-RunnerTests
#         Runner -> è lui quello che funziona