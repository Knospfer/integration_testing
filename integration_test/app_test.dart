import 'package:integration_test/integration_test.dart';

import 'home_test.dart' as home;
import 'login_test.dart' as login;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //senza questo su ios non va perchè non può accedere a una vera tastierra
  //https://github.com/flutter/flutter/issues/87990
  binding.testTextInput.register();

  login.main();
  home.main();
}
