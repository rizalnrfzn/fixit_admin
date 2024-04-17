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

class BannerDetailScreen extends StatefulWidget {
  final String id;

  const BannerDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<BannerDetailScreen> createState() => _BannerDetailScreenState();
}

class _BannerDetailScreenState extends State<BannerDetailScreen> {
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

    if (_formKey.currentState!.validate()) {
      final dialog = AwesomeDialog(
        context: context,
        dialogType: DialogType.question,
        title: context.l10n.confirmSubmitRecord,
        width: kDialogWidth,
        btnOkText: context.l10n.yes,
        btnOkOnPress: () {
          context.read<BannerDetailCubit>().editBanner(
                EditBannerParams(
                  banner: context.read<BannerDetailCubit>().banner!.copyWith(
                        description: _conDescription.text,
                        routes: _conRoutes.text,
                      ),
                  picture: context.read<BannerDetailCubit>().picture,
                ),
              );
        },
        btnCancelText: context.l10n.cancel,
        btnCancelOnPress: () {},
      );

      dialog.show();
    }
  }

  void _doDelete(BuildContext context) {
    AppFocusHelper.instance.requestUnfocus();

    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      title: context.l10n.confirmDeleteRecord,
      width: kDialogWidth,
      btnOkText: context.l10n.yes,
      btnOkOnPress: () {
        context.read<BannerDetailCubit>().deleteBanner();
      },
      btnCancelText: context.l10n.cancel,
      btnCancelOnPress: () {},
    );

    dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final pageTitle =
        'Banner - ${widget.id.isEmpty ? context.l10n.crudNew : context.l10n.crudDetail}';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.banner,
      body: BlocConsumer<BannerDetailCubit, BannerDetailState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            failure: (message) {
              context
                ..dismiss()
                ..showErrorDialog(message);
            },
            successEdit: () {
              context
                ..dismiss()
                ..showSuccessDialog(
                  message: context.l10n.recordSavedSuccessfully,
                  onTap: () {
                    context.go(RouteUri.banner);
                  },
                );
            },
            successDelete: () {
              context
                ..dismiss()
                ..showSuccessDialog(
                  message: context.l10n.recordDeletedSuccessfully,
                  onTap: () {
                    context.go(RouteUri.banner);
                  },
                );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Loading(),
            failure: (messaage) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    pageTitle,
                    style: themeData.textTheme.headlineMedium,
                  ),
                ),
                const Empty(),
              ],
            ),
            success: () {
              if (_conRoutes.text == '') {
                _conRoutes.text =
                    context.read<BannerDetailCubit>().banner!.routes!;
              }
              if (_conDescription.text == '') {
                _conDescription.text =
                    context.read<BannerDetailCubit>().banner!.description!;
              }

              return ListView(
                padding: const EdgeInsets.all(kDefaultPadding),
                children: [
                  Text(
                    pageTitle,
                    style: themeData.textTheme.headlineMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardHeader(
                            title: pageTitle,
                          ),
                          CardBody(
                            child: FormBuilder(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 1.5),
                                    child: Stack(
                                      children: [
                                        BlocBuilder<BannerDetailCubit,
                                            BannerDetailState>(
                                          builder: (context, state) {
                                            if (context
                                                    .read<BannerDetailCubit>()
                                                    .picture !=
                                                null) {
                                              return CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: MemoryImage(
                                                    context
                                                        .read<
                                                            BannerDetailCubit>()
                                                        .picture!),
                                                radius: 60.0,
                                              );
                                            } else {
                                              return CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(
                                                    context
                                                        .read<
                                                            BannerDetailCubit>()
                                                        .banner!
                                                        .image!),
                                                radius: 60.0,
                                              );
                                            }
                                          },
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
                                                    .read<BannerDetailCubit>()
                                                    .pickPicture();
                                              },
                                              style: themeData
                                                  .extension<AppButtonTheme>()!
                                                  .secondaryElevated
                                                  .copyWith(
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            const CircleBorder()),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(EdgeInsets
                                                                .zero),
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'description',
                                      controller: _conDescription,
                                      decoration: const InputDecoration(
                                        labelText: 'Description',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 1.5),
                                    child: FormBuilderTextField(
                                      name: 'route',
                                      controller: _conRoutes,
                                      decoration: const InputDecoration(
                                        labelText: 'Route',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding * 2.0),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                    right:
                                                        kDefaultPadding * 0.5),
                                                child: Icon(
                                                  Icons
                                                      .arrow_circle_left_outlined,
                                                  size: (themeData
                                                          .textTheme
                                                          .labelLarge!
                                                          .fontSize! +
                                                      4.0),
                                                ),
                                              ),
                                              Text(context.l10n.crudBack),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Visibility(
                                        visible: widget.id.isNotEmpty,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: kDefaultPadding),
                                          child: SizedBox(
                                            height: 40.0,
                                            child: ElevatedButton(
                                              style: themeData
                                                  .extension<AppButtonTheme>()!
                                                  .errorElevated,
                                              onPressed: () =>
                                                  _doDelete(context),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right: kDefaultPadding *
                                                            0.5),
                                                    child: Icon(
                                                      Icons.delete_rounded,
                                                      size: (themeData
                                                              .textTheme
                                                              .labelLarge!
                                                              .fontSize! +
                                                          4.0),
                                                    ),
                                                  ),
                                                  Text(context.l10n.crudDelete),
                                                ],
                                              ),
                                            ),
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
                                                    right:
                                                        kDefaultPadding * 0.5),
                                                child: Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  size: (themeData
                                                          .textTheme
                                                          .labelLarge!
                                                          .fontSize! +
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
              );
            },
          );
        },
      ),
    );
  }
}
