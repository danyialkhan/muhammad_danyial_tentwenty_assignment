#!/bin/zsh
flutter pub run easy_localization:generate -S assets/translations/ -O lib/app/localization -o locale_keys.g.dart -f keys
flutter pub run easy_localization:generate -S assets/translations/ -O lib/app/localization
