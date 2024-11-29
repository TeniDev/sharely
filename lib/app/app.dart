import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sharely/injection/injection_container.dart' as injection;
import 'package:sharely_ui/sharely_ui.dart';

import '../core/constants/constants.dart';
import '../core/router/router.dart';
import '../gen/l10n.dart';
import 'bloc/app_bloc.dart';

class SharelyApp extends StatelessWidget {
  const SharelyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = CustomRouter.router;

    return BlocProvider(
      create: (_) => injection.sl<AppBloc>(),
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: AppTheme().getTheme(),
        localizationsDelegates: const [
          IntlTranslations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // TODO: Implement locale change
        //locale: locale,
        supportedLocales: IntlTranslations.delegate.supportedLocales,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
