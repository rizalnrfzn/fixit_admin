import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => context.show(),
          failure: (message) {
            context.dismiss();
            context.showErrorDialog(message);
          },
          success: () {
            context.dismiss();
            context.go(RouteUri.home);
          },
        );
      },
      child: PublicMasterLayout(
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: kDefaultPadding),
                        child: Image.asset(
                          'assets/images/app_logo.png',
                          height: 80.0,
                        ),
                      ),
                      Text(
                        context.l10n.appTitle,
                        style: themeData.textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: kDefaultPadding * 2.0),
                        child: Text(
                          context.l10n.adminPortalLogin,
                          style: themeData.textTheme.titleMedium,
                        ),
                      ),
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                controller: _conEmail,
                                name: 'email',
                                decoration: InputDecoration(
                                  labelText: context.l10n.email,
                                  hintText: context.l10n.email,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                controller: _conPassword,
                                name: 'password',
                                decoration: InputDecoration(
                                  labelText: context.l10n.password,
                                  hintText: context.l10n.password,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                obscureText: true,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding),
                              child: SizedBox(
                                height: 40.0,
                                width: double.infinity,
                                child: BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () => ElevatedButton(
                                        style: themeData
                                            .extension<AppButtonTheme>()!
                                            .primaryElevated,
                                        onPressed: null,
                                        child: Text(context.l10n.login),
                                      ),
                                      initial: () => ElevatedButton(
                                        style: themeData
                                            .extension<AppButtonTheme>()!
                                            .primaryElevated,
                                        onPressed: () {
                                          AppFocusHelper.instance
                                              .requestUnfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<AuthCubit>().login(
                                                LoginParams(
                                                    email: _conEmail.text,
                                                    password:
                                                        _conPassword.text));
                                          }
                                        },
                                        child: Text(context.l10n.login),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
