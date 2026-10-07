import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_view.dart';
// وباقي الـ imports بتاعت الشاشات لما تجهز:
// import '../../features/authentication/presentation/screens/login_screen.dart';
// import '../../features/authentication/presentation/screens/signup_screen.dart';
// import '../../features/authentication/presentation/screens/role_selection_screen.dart';

import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,

    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),

      GoRoute(
        path: RouteNames.login,
        builder: (context, state) {
          return const SizedBox();
          // return const LoginScreen();
        },
      ),

      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) {
          return const SizedBox();
          // return const SignupScreen();
        },
      ),

      GoRoute(
        path: RouteNames.roleSelection,
        builder: (context, state) {
          return const SizedBox();
          // return const RoleSelectionScreen();
        },
      ),
    ],
  );
}
