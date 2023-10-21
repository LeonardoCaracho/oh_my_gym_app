// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/settings/cubit/cubit.dart';

void main() {
  group('SettingsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          SettingsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final settingsCubit = SettingsCubit();
      expect(settingsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<SettingsCubit, SettingsState>(
      'yourCustomFunction emits nothing',
      build: SettingsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <SettingsState>[],
    );
  });
}
