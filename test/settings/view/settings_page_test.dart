import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/features/settings/settings.dart';

void main() {
  group('SettingsPage', () {
    testWidgets('renders SettingsView', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SettingsPage()));
      expect(find.byType(SettingsView), findsOneWidget);
    });
  });
}
