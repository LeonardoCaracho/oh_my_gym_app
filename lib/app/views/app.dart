import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/login/login.dart';
import 'package:oh_my_gym_app/features/workouts/bloc/bloc.dart';
import 'package:oh_my_gym_app/features/workouts_history/cubit/cubit.dart';
import 'package:oh_my_gym_app/l10n/l10n.dart';
import 'package:workout_repository/workout_repository.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(
            authenticationRepository: locator<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            authRepository: locator<AuthenticationRepository>(),
          ),
        ),
        BlocProvider<WorkoutsBloc>(
          create: (context) => WorkoutsBloc(
            workoutsRepository: locator<WorkoutRepository>(),
          )..add(const WorkoutsRequested()),
        ),
        BlocProvider<WorkoutsHistoryCubit>(
          create: (context) => WorkoutsHistoryCubit(
            historyRepository: locator<HistoryRepository>(),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppRouter(context);

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
