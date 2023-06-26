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
        '/': (_) => _LoginScreen(),
        'home': (_) => const _HomeScreen(),
      },
    );
  }
}

class _LoginScreen extends StatelessWidget {
  final form = FormGroup({
    'email': FormControl(validators: [Validators.required]),
    'password': FormControl(validators: [Validators.required]),
  });

  void validate(FormGroup formGroup, BuildContext context) {
    if (formGroup.invalid) return;

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
              formControlName: 'email',
              decoration: const InputDecoration(label: Text('Email')),
            ),
            ReactiveTextField(
              formControlName: 'password',
              decoration: const InputDecoration(label: Text('Password')),
            ),
            const SizedBox(height: 24),
            ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                return ElevatedButton(
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

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home!"),
      ),
    );
  }
}
