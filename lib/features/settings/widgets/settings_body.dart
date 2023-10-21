import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/settings/cubit/cubit.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              DefaultButton(
                text: 'Logout',
                onPressed: () {
                  context.read<AppBloc>().add(const AppLogoutRequested());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
