import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/l10n/l10n.dart';
import 'package:oh_my_gym_app/routing/routing.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repo = auth.SupabaseAuth(client: Supabase.instance.client);

    return RepositoryProvider<auth.AuthenticationContract>.value(
      value: repo,
      child: BlocProvider<AppBloc>(
        create: (context) => AppBloc(
          authenticationRepository: repo,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
