import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      asyncAuthProvider,
      (_, state) => ref
          .read(asyncAuthProvider.notifier)
          .handleAuthenticationScreenPush(context),
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
