import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/app/bloc/app_bloc.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/edit_workout/edit_workout.dart';
import 'package:oh_my_gym_app/features/login/login.dart';
import 'package:oh_my_gym_app/features/settings/view/settings_page.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';
import 'package:oh_my_gym_app/features/workouts/view/workouts_page.dart';
import 'package:oh_my_gym_app/features/workouts_history/workouts_history.dart';
import 'package:workouts_api/workouts_api.dart';

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
          if (state.matchedLocation.startsWith(RouteConstants.loginRoute)) {
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
              builder: (context, state) => EditWorkoutPage(
                workout: Workout.create(),
              ),
            ),
            GoRoute(
              name: RouteConstants.editWorkoutRouteName,
              path: RouteConstants.editWorkoutsRoute,
              builder: (context, state) {
                return EditWorkoutPage(
                  workout: state.extra! as Workout,
                  isEditMode: true,
                );
              },
            ),
            GoRoute(
              name: RouteConstants.startWorkoutRouteName,
              path: RouteConstants.startWorkoutsRoute,
              builder: (context, state) {
                return StartWorkoutPage(
                  workout: state.extra! as Workout,
                );
              },
            ),
            GoRoute(
              name: RouteConstants.workoutsHistoryRouteName,
              path: RouteConstants.workoutsHistoryRoute,
              builder: (context, state) {
                return const WorkoutsHistoryPage();
              },
            ),
            GoRoute(
              name: RouteConstants.settingsHistoryRouteName,
              path: RouteConstants.settingsHistoryRoute,
              builder: (context, state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    );
  }
}
