import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile view'),
      ),
      body: const Center(
        child: Text(
          'Profile view',
        ),
      ),
    );
  }
}
