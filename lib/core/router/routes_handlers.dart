part of 'router.dart';

Page<Widget> _loginPageHandler(BuildContext context, GoRouterState state) {
  return NoTransitionPage(
    child: BlocProvider(
      create: (_) => injection.sl<LoginBloc>(),
      child: const LoginPage(),
    ),
  );
}
