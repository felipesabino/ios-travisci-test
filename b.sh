echo "xctool -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -configuration Release ARCHIVE_PATH=/Users/felipesabino/projetos/ios-travisci-test/archive OBJROOT=/Users/felipesabino/projetos/ios-travisci-test/build SYMROOT=/Users/felipesabino/projetos/ios-travisci-test/build ONLY_ACTIVE_ARCH=NO archive"


xcodebuild -verbose -workspace TravisCiIntegration.xcworkspace -scheme TravisCiIntegration -sdk iphoneos -configuration Release -archivePath /Users/felipesabino/projetos/ios-travisci-test/archive.xcarchive archive

xcodebuild -verbose -exportArchive -exportFormat ipa -archivePath /Users/felipesabino/projetos/ios-travisci-test/archive.xcarchive -exportPath /Users/felipesabino/projetos/ios-travisci-test/build.ipa -exportProvisioningProfile "Taqtile Travis Test Adhoc"
