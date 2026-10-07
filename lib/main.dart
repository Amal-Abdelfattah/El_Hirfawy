import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'injection_container/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(const ElHirfawyApp());
}

class ElHirfawyApp extends StatelessWidget {
  const ElHirfawyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: 'El-Hirfawy',

      theme: AppTheme.lightTheme,

      routerConfig: AppRouter.router,
    );
  }
}