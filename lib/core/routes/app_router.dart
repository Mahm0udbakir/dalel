import 'package:dalel/features/auth/presentation/views/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/signUp',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onBoarding',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: '/signIn',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpView(),
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
