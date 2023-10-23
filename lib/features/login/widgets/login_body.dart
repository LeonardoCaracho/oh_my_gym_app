import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/login/login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Image.asset(
              AssetsConstants.logo,
              scale: 2,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DefaultButtonSmall(
                icon: Icons.g_mobiledata,
                text: 'Sign In With Google',
                onPressed: () => context.read<LoginCubit>().loginWithGoogle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
