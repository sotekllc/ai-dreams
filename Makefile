.PHONY: build-android build-ios configure run

build-debug-android:
	flutter build appbundle --obfuscate

build-debug-ios:
	flutter build ios --obfuscate

# configure:
# 	dart run flutter_launcher_icons 
# 	dart run flutter_native_splash:create

run:
	flutter run
