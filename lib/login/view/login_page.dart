import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/login/cubit/cubit.dart';
import 'package:oh_my_gym_app/login/widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<LoginCubit>(),
      child: const Scaffold(
        body: LoginView(),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
