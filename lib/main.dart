import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/names.dart';
import 'package:flutter_application_1/routes/router.dart';
import 'package:flutter_application_1/utils/navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: NavigationKey.navigationKey,
      //home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}
