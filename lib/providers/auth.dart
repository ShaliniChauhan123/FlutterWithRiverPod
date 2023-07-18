// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/auth_repository.dart';
import 'package:flutter_application_1/routes/names.dart';
import 'package:flutter_application_1/utils/navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncAuthNotifier extends AsyncNotifier<bool> {
  late final AuthRepository authRepository;
  //AsyncAuthNotifier() : authRepository = AuthRepository();

  Future<bool> delayMethod() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<bool> build() async {
    authRepository = ref.read(authRepositoryProvider);
    print('try');

    return delayMethod();
  }

  void handleAuthenticationScreenPush(context) {
    if (state.value == true) {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.splash);
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
    required context,
  }) async {
    print('login method');
    // final res =
    try {
      await authRepository.SignIn(phoneNumber, password);
      NavigationKey.navigationKey.currentState?.pushNamed(Routes.splash);
      state = const AsyncData(true);
    } catch (error) {
      print('@@@$error');
    }

    state = const AsyncData(true);
    //  handleAuthenticationScreenPush(context);
  }
}

final asyncAuthProvider = AsyncNotifierProvider<AsyncAuthNotifier, bool>(
  AsyncAuthNotifier.new,
);
