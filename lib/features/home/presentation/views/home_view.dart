import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/features/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              navigateWithOutBackButton(context, '/signIn');
            },
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomNavBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home View'),
          ],
        ),
      ),
    );
  }
}
