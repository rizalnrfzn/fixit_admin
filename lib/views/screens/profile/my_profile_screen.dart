import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:go_router/go_router.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late GlobalKey<FormBuilderState> _formKey;
  late TextEditingController _conName;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _conName = TextEditingController(text: SharedPref.getInfoUser()?.name);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _conName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return PortalMasterLayout(
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            failure: (message) {
              context.dismiss();
              context.showErrorDialog(message);
            },
            successEdit: () {
              context.dismiss();
              context.showSuccessDialog(
                message: context.l10n.recordSavedSuccessfully,
                onTap: () {
                  context.go(RouteUri.dashboard);
                },
              );
            },
          );
        },
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              context.l10n.myProfile,
              style: themeData.textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardHeader(
                      title: context.l10n.myProfile,
                    ),
                    CardBody(
                      child: FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding * 1.5),
                                  child: Stack(
                                    children: [
                                      if (context
                                              .read<ProfileCubit>()
                                              .newProfilePicture !=
                                          null)
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: MemoryImage(context
                                              .read<ProfileCubit>()
                                              .newProfilePicture!),
                                          radius: 60.0,
                                        )
                                      else
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              SharedPref.getInfoUser()!
                                                  .profilePicture!),
                                          radius: 60.0,
                                        ),
                                      Positioned(
                                        top: 0.0,
                                        right: 0.0,
                                        child: SizedBox(
                                          height: 40.0,
                                          width: 40.0,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .pickProfilePicture();
                                            },
                                            style: themeData
                                                .extension<AppButtonTheme>()!
                                                .secondaryElevated
                                                .copyWith(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          const CircleBorder()),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero),
                                                ),
                                            child: const Icon(
                                              Icons.edit_rounded,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 1.5),
                              child: FormBuilderTextField(
                                name: 'name',
                                controller: _conName,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  hintText: 'Name',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 40.0,
                                child: ElevatedButton(
                                  style: themeData
                                      .extension<AppButtonTheme>()!
                                      .successElevated,
                                  onPressed: () {
                                    AppFocusHelper.instance.requestUnfocus();

                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      _formKey.currentState!.save();
                                      final user = SharedPref.getInfoUser()!;

                                      context.read<ProfileCubit>().editProfile(
                                            EditProfileParams(
                                              user: user.copyWith(
                                                  name: _conName.text),
                                              file: context
                                                  .read<ProfileCubit>()
                                                  .newProfilePicture,
                                            ),
                                          );
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: kDefaultPadding * 0.5),
                                        child: Icon(
                                          Icons.save_rounded,
                                          size: (themeData.textTheme.labelLarge!
                                                  .fontSize! +
                                              4.0),
                                        ),
                                      ),
                                      Text(context.l10n.save),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
