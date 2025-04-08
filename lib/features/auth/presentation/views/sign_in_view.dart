import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In View'),
          ],
        ),
      ),
    );
  }
}