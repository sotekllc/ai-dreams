.PHONY: build-android build-debug-android build-debug-ios build-ios configure run-prod run-staging

build-android:
	flutter build appbundle --obfuscate --dart-define=ENVIRONMENT=prod

build-debug-android:
	flutter build appbundle --obfuscate --dart-define=ENVIRONMENT=staging

build-ios:
	flutter build ios --obfuscate --dart-define=ENVIRONMENT=prod

build-debug-ios:
	flutter build ios --obfuscate --dart-define=ENVIRONMENT=staging

# configure:
# 	dart run flutter_launcher_icons 
# 	dart run flutter_native_splash:create

run-prod:
	flutter run --dart-define=ENVIRONMENT=prod

run-staging:
	flutter run --dart-define=ENVIRONMENT=staging


