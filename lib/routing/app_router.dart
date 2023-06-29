import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/counter/counter.dart';
import 'package:oh_my_gym_app/login/login.dart';

class AppRouter {
  static GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'login',
        path: '/',
        builder: (BuildContext context, _) => const LoginPage(),
        redirect: (context, _) {
          final state = context.read<AppBloc>().state;

          if (state.status.isAuthenticated) {
            return '/home';
          }

          return null;
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}
