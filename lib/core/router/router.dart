import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sharely/gen/l10n.dart';

class CustomRouter {
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: Text(
              IntlTranslations.of(context).hello_world,
            ),
          ),
        ),
      ),
    ],
  );

  static GoRouter get router => _router;
}
