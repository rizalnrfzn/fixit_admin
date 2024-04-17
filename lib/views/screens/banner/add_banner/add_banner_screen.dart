import 'package:awesome_dialog/awesome_dialog.dart';
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

class AddBannerScreen extends StatefulWidget {
  const AddBannerScreen({super.key});

  @override
  State<AddBannerScreen> createState() => _AddBannerScreenState();
}

class _AddBannerScreenState extends State<AddBannerScreen> {
  late GlobalKey<FormBuilderState> _formKey;
  late TextEditingController _conRoutes;
  late TextEditingController _conDescription;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _conRoutes = TextEditingController();
    _conDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _conRoutes.dispose();
    _conDescription.dispose();
    super.dispose();
  }

  void _doSubmit(BuildContext context) {
    AppFocusHelper.instance.requestUnfocus();
    if (context.read<AddBannerCubit>().picture != null) {
      if (_formKey.currentState!.validate()) {
        final dialog = AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          title: context.l10n.confirmSubmitRecord,
          width: kDialogWidth,
          btnOkText: context.l10n.yes,
          btnOkOnPress: () {
            context.read<AddBannerCubit>().addBanner(
                  AddBannerParams(
                    banner: BannerAd(
                      description: _conDescription.text,
                      routes: _conDescription.text,
                    ),
                    picture: context.read<AddBannerCubit>().picture!,
                  ),
                );
          },
          btnCancelText: context.l10n.cancel,
          btnCancelOnPress: () {},
        );

        dialog.show();
      }
    } else {
      context.showErrorDialog('Pilih gambar terlebih dahulu');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    const pageTitle = 'Add Banner';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.banner,
      body: BlocListener<AddBannerCubit, AddBannerState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            failure: (message) {
              context
                ..dismiss()
                ..showErrorDialog(message);
            },
            successAdd: () {
              context
                ..dismiss()
                ..showSuccessDialog(
                  message: context.l10n.recordSavedSuccessfully,
                  onTap: () {
                    context.go(RouteUri.banner);
                  },
                );
            },
          );
        },
        child: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            Text(
              pageTitle,
              style: themeData.textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CardHeader(
                      title: pageTitle,
                    ),
                    CardBody(
                      child: FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<AddBannerCubit, AddBannerState>(
                              builder: (context, state) {
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding * 1.5),
                                  child: Stack(
                                    children: [
                                      context.read<AddBannerCubit>().picture !=
                                              null
                                          ? CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 60.0,
                                              backgroundImage: MemoryImage(
                                                  context
                                                      .read<AddBannerCubit>()
                                                      .picture!),
                                            )
                                          : const CircleAvatar(
                                              backgroundColor: Colors.white,
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
                                                  .read<AddBannerCubit>()
                                                  .pickPicture();
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
                                name: 'description',
                                controller: _conDescription,
                                decoration: const InputDecoration(
                                  labelText: 'Description',
                                  hintText: 'Description',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.multiline,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: kDefaultPadding * 2.0),
                              child: FormBuilderTextField(
                                name: 'routes',
                                controller: _conRoutes,
                                decoration: const InputDecoration(
                                  labelText: 'Routes ad',
                                  hintText: 'Routes ad',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.name,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            const SizedBox(height: kDefaultPadding * 2.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: themeData
                                        .extension<AppButtonTheme>()!
                                        .secondaryElevated,
                                    onPressed: () => GoRouter.of(context)
                                        .go(RouteUri.banner),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: kDefaultPadding * 0.5),
                                          child: Icon(
                                            Icons.arrow_circle_left_outlined,
                                            size: (themeData.textTheme
                                                    .labelLarge!.fontSize! +
                                                4.0),
                                          ),
                                        ),
                                        Text(context.l10n.crudBack),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: themeData
                                        .extension<AppButtonTheme>()!
                                        .successElevated,
                                    onPressed: () => _doSubmit(context),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: kDefaultPadding * 0.5),
                                          child: Icon(
                                            Icons.check_circle_outline_rounded,
                                            size: (themeData.textTheme
                                                    .labelLarge!.fontSize! +
                                                4.0),
                                          ),
                                        ),
                                        Text(context.l10n.submit),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
