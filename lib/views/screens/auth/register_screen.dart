import 'package:fixit_admin/domain/domain.dart';
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
import 'package:fixit_admin/theme/theme_extensions/app_button_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conRepeatPassword = TextEditingController();
  final _conName = TextEditingController();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _conEmail.dispose();
    _conPassword.dispose();
    _conRepeatPassword.dispose();
    _conName.dispose();

    super.dispose();
  }

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
            context.showSuccessDialog(
              message: 'Akun berhasil didaftarkan',
              onTap: () {
                context.go(RouteUri.home);
              },
            );
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
                          context.l10n.registerANewAccount,
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
                                controller: _conName,
                                name: 'name',
                                decoration: InputDecoration(
                                  labelText: context.l10n.username,
                                  hintText: context.l10n.username,
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
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'password',
                                decoration: InputDecoration(
                                  labelText: context.l10n.password,
                                  hintText: context.l10n.password,
                                  helperText: context.l10n.passwordHelperText,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                obscureText: true,
                                controller: _conPassword,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.minLength(6),
                                  FormBuilderValidators.maxLength(18),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                controller: _conRepeatPassword,
                                name: 'retypePassword',
                                decoration: InputDecoration(
                                  labelText: context.l10n.retypePassword,
                                  hintText: context.l10n.retypePassword,
                                  border: const OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                enableSuggestions: false,
                                obscureText: true,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  (value) {
                                    if (_formKey.currentState
                                            ?.fields['password']?.value !=
                                        value) {
                                      return context.l10n.passwordNotMatch;
                                    }

                                    return null;
                                  },
                                ]),
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
                                      orElse: () {
                                        return ElevatedButton(
                                          style: themeData
                                              .extension<AppButtonTheme>()!
                                              .primaryElevated,
                                          onPressed: null,
                                          child: Text(context.l10n.register),
                                        );
                                      },
                                      initial: () {
                                        return ElevatedButton(
                                          style: themeData
                                              .extension<AppButtonTheme>()!
                                              .primaryElevated,
                                          onPressed: () {
                                            AppFocusHelper.instance
                                                .requestUnfocus();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<AuthCubit>()
                                                  .registration(
                                                    RegistrationParams(
                                                      email: _conEmail.text,
                                                      password:
                                                          _conPassword.text,
                                                      name: _conName.text,
                                                    ),
                                                  );
                                            }
                                          },
                                          child: Text(context.l10n.register),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              width: double.infinity,
                              child: OutlinedButton(
                                style: themeData
                                    .extension<AppButtonTheme>()!
                                    .secondaryOutlined,
                                onPressed: () =>
                                    GoRouter.of(context).go(RouteUri.login),
                                child: Text(context.l10n.backToLogin),
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
