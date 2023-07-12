import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/features/login/login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'OH MY GYM',
                    style: UITextStyle.headline1,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    child: const SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sign In With Google'),
                        ],
                      ),
                    ),
                    onPressed: () =>
                        context.read<LoginCubit>().loginWithGoogle(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
