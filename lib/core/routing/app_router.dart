import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/add_workout/add_workout.dart';
import 'package:oh_my_gym_app/features/login/login.dart';
import 'package:oh_my_gym_app/features/workouts/view/workouts_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  factory AppRouter(BuildContext context) {
    _instance ??= AppRouter._internal(context);
    return _instance!;
  }

  AppRouter._internal(this.context) {
    _router ??= _goRouter(context);
  }

  final BuildContext context;

  static GoRouter? _router;
  static AppRouter? _instance;

  static GoRouter get router => _router!;

  static GoRouter _goRouter(BuildContext context) {
    final appBloc = context.read<AppBloc>();

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      refreshListenable: GoRouterRefreshStream(appBloc.stream),
      initialLocation: RouteConstants.loginRoute,
      redirect: (context, state) {
        final appState = context.read<AppBloc>().state;

        if (appState.status.isAuthenticated) {
          if (state.location.startsWith(RouteConstants.loginRoute)) {
            return RouteConstants.homeRoute;
          }
        } else {
          return RouteConstants.loginRoute;
        }

        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          name: RouteConstants.loginRouteName,
          path: RouteConstants.loginRoute,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          name: RouteConstants.homeRouteName,
          path: RouteConstants.homeRoute,
          builder: (context, state) => const WorkoutsPage(),
          routes: [
            GoRoute(
              name: RouteConstants.addWorkoutRouteName,
              path: RouteConstants.addWorkoutsRoute,
              builder: (context, state) => const AddWorkoutPage(),
            ),
          ],
        ),
      ],
    );
  }
}
