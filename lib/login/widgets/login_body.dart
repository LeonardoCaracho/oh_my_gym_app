import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/login/cubit/cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Login with google!'),
                onPressed: () => context.read<LoginCubit>().loginWithGoogle(),
              ),
            ],
          ),
        );
      },
    );
  }
}
