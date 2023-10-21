// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => SettingsCubit(),
          child: MaterialApp(home: SettingsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}