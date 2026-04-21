import 'package:flutter/material.dart';
import 'package:optitest/optitest.dart';

void main() => runApp(const OptiTestExampleApp());

class OptiTestExampleApp extends StatelessWidget {
  const OptiTestExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OptiTest Example',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const _LoginDemoScreen(),
    );
  }
}

class _LoginDemoScreen extends StatefulWidget {
  const _LoginDemoScreen();

  @override
  State<_LoginDemoScreen> createState() => _LoginDemoScreenState();
}

class _LoginDemoScreenState extends State<_LoginDemoScreen> {
  final _emailController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Testable(
          testId: TestKey.header('login_title'),
          child: const Text('OptiTest Demo'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Testable(
              testId: TestKey.input('login_email'),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(height: 24),
            Testable(
              testId: TestKey.button(
                'login_submit',
                state: _loading ? ElementState.loading : null,
              ),
              child: FilledButton(
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() => _loading = true);
                        await Future<void>.delayed(const Duration(seconds: 1));
                        if (mounted) setState(() => _loading = false);
                      },
                child: Text(_loading ? 'Loading…' : 'Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
