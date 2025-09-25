import 'package:flutter/material.dart';
import 'package:gamebox/app_router.dart';
import 'package:gamebox/features/forbidden_sequel/forbidden_sequel_provider.dart';
import 'package:gamebox/features/activation/activation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ForbiddenSequelProvider>(create: (_) => ForbiddenSequelProvider()),
        ChangeNotifierProvider<ActivationProvider>(create: (_) => ActivationProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getAppRouter(),
    );
  }
}
