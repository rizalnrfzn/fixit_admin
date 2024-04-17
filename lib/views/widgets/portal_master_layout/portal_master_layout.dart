import 'package:fixit_admin/utils/ext/ext.dart';
import 'package:fixit_admin/views/cubits/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/master_layout_config.dart';
import 'package:fixit_admin/theme/theme_extensions/app_color_scheme.dart';
import 'package:fixit_admin/theme/theme_extensions/app_sidebar_theme.dart';
import 'package:fixit_admin/views/widgets/portal_master_layout/sidebar.dart';

class LocaleMenuConfig {
  final String languageCode;
  final String? scriptCode;
  final String name;

  const LocaleMenuConfig({
    required this.languageCode,
    this.scriptCode,
    required this.name,
  });
}

class PortalMasterLayout extends StatelessWidget {
  final Widget body;
  final bool autoSelectMenu;
  final String? selectedMenuUri;
  final void Function(bool isOpened)? onDrawerChanged;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;

  const PortalMasterLayout({
    super.key,
    required this.body,
    this.autoSelectMenu = true,
    this.selectedMenuUri,
    this.onDrawerChanged,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);
    final drawer = (mediaQueryData.size.width <= kScreenWidthLg
        ? _sidebar(context)
        : null);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: (drawer != null),
        title: ResponsiveAppBarTitle(
          onAppBarTitlePressed: () => GoRouter.of(context).go(RouteUri.home),
        ),
        actions: [
          _toggleThemeButton(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: VerticalDivider(
              width: 1.0,
              thickness: 1.0,
              color: themeData.appBarTheme.foregroundColor!.withOpacity(0.5),
              indent: 14.0,
              endIndent: 14.0,
            ),
          ),
          _changeLanguageButton(context),
          const SizedBox(width: kDefaultPadding * 0.5),
        ],
      ),
      drawer: drawer,
      drawerEnableOpenDragGesture: false,
      onDrawerChanged: onDrawerChanged,
      body: _responsiveBody(context),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
    );
  }

  Widget _responsiveBody(BuildContext context) {
    if (MediaQuery.of(context).size.width <= kScreenWidthLg) {
      return body;
    } else {
      return Row(
        children: [
          SizedBox(
            width: Theme.of(context).extension<AppSidebarTheme>()!.sidebarWidth,
            child: _sidebar(context),
          ),
          Expanded(child: body),
        ],
      );
    }
  }

  Widget _sidebar(BuildContext context) {
    final goRouter = GoRouter.of(context);

    return Sidebar(
      autoSelectMenu: autoSelectMenu,
      selectedMenuUri: selectedMenuUri,
      onAccountButtonPressed: () => goRouter.go(RouteUri.myProfile),
      onLogoutButtonPressed: () => context.showQuestionDialog(
        message: 'Anda yakin ingin keluar?',
        onTap: () => context.go(RouteUri.logout),
      ),
      sidebarConfigs: sidebarMenuConfigs,
    );
  }

  Widget _toggleThemeButton(BuildContext context) {
    final themeData = Theme.of(context);
    final isFullWidthButton =
        (MediaQuery.of(context).size.width > kScreenWidthMd);

    return SizedBox(
      width: (isFullWidthButton ? null : 48.0),
      child: TextButton(
        onPressed: () {
          final cubit = context.read<AppCubit>();
          final currentTheme = cubit.themeMode;
          final theme = (currentTheme != ThemeMode.dark
              ? ThemeMode.dark
              : ThemeMode.light);

          cubit.setThemeMode(themeMode: theme);
        },
        style: TextButton.styleFrom(
          foregroundColor: themeData.colorScheme.onPrimary,
          disabledForegroundColor:
              themeData.extension<AppColorScheme>()!.primary.withOpacity(0.38),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final currentTheme = context.read<AppCubit>().themeMode;

            var icon = Icons.dark_mode_rounded;
            var text = context.l10n.darkTheme;

            if (currentTheme == ThemeMode.dark) {
              icon = Icons.light_mode_rounded;
              text = context.l10n.lightTheme;
            }

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: (themeData.textTheme.labelLarge!.fontSize! + 4.0),
                ),
                Visibility(
                  visible: isFullWidthButton,
                  child: Padding(
                    padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                    child: Text(text),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _changeLanguageButton(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 0.0,
      tooltip: '',
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return localeMenuConfigs.map<PopupMenuItem>((e) {
          return PopupMenuItem(
            onTap: () {
              final cubit = context.read<AppCubit>();

              cubit.setLocale(
                locale: Locale.fromSubtags(
                  languageCode: e.languageCode,
                  scriptCode: e.scriptCode,
                ),
              );
            },
            child: Text(e.name),
          );
        }).toList(growable: false);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
        constraints: const BoxConstraints(minWidth: 48.0),
        child: Row(
          children: [
            Icon(
              Icons.translate_rounded,
              size: (Theme.of(context).textTheme.labelLarge!.fontSize! + 4.0),
            ),
            Visibility(
              visible: (MediaQuery.of(context).size.width > kScreenWidthMd),
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                child: Text(context.l10n.language),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveAppBarTitle extends StatelessWidget {
  final void Function() onAppBarTitlePressed;

  const ResponsiveAppBarTitle({
    super.key,
    required this.onAppBarTitlePressed,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onAppBarTitlePressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: (mediaQueryData.size.width > kScreenWidthSm),
              child: Container(
                padding: const EdgeInsets.only(right: kDefaultPadding * 0.7),
                height: 40.0,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(context.l10n.appTitle),
          ],
        ),
      ),
    );
  }
}
