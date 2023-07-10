import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/features/login/login.dart';
import 'package:oh_my_gym_app/features/workouts/view/workouts_page.dart';
import 'package:oh_my_gym_app/routing/routing.dart';

class AppRouter {
  AppRouter(this.context);

  static GoRouter get router => _goRouter;

  final BuildContext context;

  static final GoRouter _goRouter = GoRouter(
    redirect: (context, state) {
      final state = context.watch<AppBloc>().state;

      if (state.status.isAuthenticated) {
        return RouteConstants.workoutsRoute;
      }

      return RouteConstants.homeRoute;
    },
    routes: <RouteBase>[
      GoRoute(
        name: RouteConstants.homeRouteName,
        path: RouteConstants.homeRoute,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RouteConstants.workoutRouteName,
        path: RouteConstants.workoutsRoute,
        builder: (context, state) => const WorkoutsPage(),
      ),
    ],
  );
}
