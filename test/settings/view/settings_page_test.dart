// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/settings/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsPage', () {
    group('route', () {
      test('is routable', () {
        expect(SettingsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SettingsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPage()));
      expect(find.byType(SettingsView), findsOneWidget);
    });
  });
}
