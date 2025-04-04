import 'package:dalel/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
    // Optional: Error page for undefined routes
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route found for ${state.uri}'),
      ),
    ),
  );
}
