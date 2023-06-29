import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => LoginScreen(),
        'home': (_) => const HomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  final form = FormGroup({
    'email': FormControl(validators: [Validators.required]),
    'password': FormControl(validators: [Validators.required]),
  });

  void validate(FormGroup formGroup, BuildContext context) {
    Navigator.of(context).pushNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E2E?!"),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            ReactiveTextField(
              key: const ValueKey('email'),
              formControlName: 'email',
              decoration: const InputDecoration(label: Text('Email')),
            ),
            ReactiveTextField(
              key: const ValueKey('password'),
              formControlName: 'password',
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 24),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                return ElevatedButton(
                  key: const ValueKey('submit_button'),
                  onPressed: formGroup.valid
                      ? () => validate(formGroup, context)
                      : null,
                  child: const Text("Login!"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('home_scaffold'),
      appBar: AppBar(
        title: const Text("Home!"),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen();

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('home_scaffold'),
      appBar: AppBar(
        title: const Text("Second Screen!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text widget. This allows
              // identifying the widget from inside the test suite,
              // and reading the text.
              key: const Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
