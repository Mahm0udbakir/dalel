import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {

  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign Up View'),
          ],
        ),
      ),
    );
  }
}