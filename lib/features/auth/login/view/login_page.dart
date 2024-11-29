import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(const LoginEvent.resetLogin());
          },
          child: const Text('Login page'),
        ),
      ),
    );
  }
}
