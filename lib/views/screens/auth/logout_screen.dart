import 'package:fixit_admin/views/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  Future<void> _doLogoutAsync({
    required VoidCallback onSuccess,
  }) async {
    context.read<AuthCubit>().logout();

    onSuccess.call();
  }

  void _onLogoutSuccess(BuildContext context) {
    GoRouter.of(context).go(RouteUri.login);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Clear local user data and redirect to login screen.
      _doLogoutAsync(
        onSuccess: () => _onLogoutSuccess(context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
