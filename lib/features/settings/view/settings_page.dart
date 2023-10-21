import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/settings/cubit/cubit.dart';
import 'package:oh_my_gym_app/features/settings/widgets/settings_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: UITextStyle.headline3.copyWith(
              color: UIColors.white,
            ),
          ),
        ),
        body: const SettingsView(),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsBody();
  }
}
