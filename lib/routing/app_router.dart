import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/counter/counter.dart';
import 'package:oh_my_gym_app/login/login.dart';

class AppRouter {
  AppRouter(this.context);

  static GoRouter get router => _goRouter;

  final BuildContext context;

  static final GoRouter _goRouter = GoRouter(
    redirect: (context, state) {
      final state = context.watch<AppBloc>().state;

      if (state.status.isAuthenticated) {
        return '/home';
      }

      return '/';
    },
    routes: <RouteBase>[
      GoRoute(
        name: 'login',
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const CounterPage(),
      ),
    ],
  );
}
