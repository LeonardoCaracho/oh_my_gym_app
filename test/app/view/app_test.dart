import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oh_my_gym_app/app/app.dart';
import 'package:oh_my_gym_app/login/login.dart';

class MockAppBloc extends MockCubit<AppState> implements AppBloc {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
