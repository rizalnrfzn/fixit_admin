import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/injector.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/theme/themes.dart';
import 'package:fixit_admin/utils/utils.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  final GoRouter _appRouter = appRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AppCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              // Tap anywhere to dismiss soft keyboard.
              AppFocusHelper.instance.requestUnfocus();
            },
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routeInformationProvider: _appRouter.routeInformationProvider,
                  routeInformationParser: _appRouter.routeInformationParser,
                  routerDelegate: _appRouter.routerDelegate,
                  supportedLocales: AppLocalizations.supportedLocales,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: context.read<AppCubit>().locale,
                  onGenerateTitle: (context) => context.l10n.appTitle,
                  theme: AppThemeData.instance.light(),
                  darkTheme: AppThemeData.instance.dark(),
                  themeMode: context.read<AppCubit>().themeMode,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
