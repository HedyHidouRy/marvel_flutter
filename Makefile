default: prepare_android_release
prepare_android_release:
	echo "Preparing android AAB";\
    flutter clean && flutter build appbundle --release --no-shrink;
generate_files:
	flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs
watch_file_generation_changes:
	flutter packages pub run build_runner watch
clean_all:
	flutter clean;\
    rm -rf build/;\
    rm pubspec.lock;\
    rm -rf ios/Pods;\
    rm ios/Podfile*;\
    flutter pub get
lint_analyse:
	flutter analyze
activate_very_good_cli:
	dart pub global activate very_good_cli