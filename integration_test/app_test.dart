import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //senza questo su ios non va perchè non può accedere a una vera tastierra
  binding.testTextInput.register();

  group('e2e test', () {
    testWidgets(
      'login',
      (widgetTester) async {
        app.main();

        await widgetTester.pumpAndSettle();

        final emailTextField = find.byKey(const ValueKey('email'));
        await widgetTester.enterText(emailTextField, 'utente@prova.it');
        await widgetTester.testTextInput.receiveAction(TextInputAction.done);

        await widgetTester.pumpAndSettle();

        final passwordTextField = find.byKey(const ValueKey('password'));
        await widgetTester.enterText(passwordTextField, 'password123!?');
        await widgetTester.testTextInput.receiveAction(TextInputAction.done);

        await widgetTester.pumpAndSettle();

        final submitButton = find.byKey(const ValueKey('submit_button'));
        await widgetTester.tap(submitButton);

        await widgetTester.pumpAndSettle();

        final homeScreen = find.byType(app.HomeScreen);
        await widgetTester.ensureVisible(homeScreen);

        expect(homeScreen, findsOneWidget);
      },
    );
  });
}
