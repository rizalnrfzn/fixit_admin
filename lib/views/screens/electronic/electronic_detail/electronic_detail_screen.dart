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

class ElectronicDetailScreen extends StatefulWidget {
  final String id;

  const ElectronicDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ElectronicDetailScreen> createState() => _ElectronicDetailScreenState();
}

class _ElectronicDetailScreenState extends State<ElectronicDetailScreen> {
  late GlobalKey<FormBuilderState> _formKey;
  late TextEditingController _conName;
  late TextEditingController _conDescription;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();
    _conName = TextEditingController();
    _conDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _conName.dispose();
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
          context.read<ElectronicDetailCubit>().editElectronic(
                EditElectronicParams(
                  electronic: context
                      .read<ElectronicDetailCubit>()
                      .electronic!
                      .copyWith(
                        name: _conName.text,
                        description: _conDescription.text,
                        gripe: context
                            .read<ElectronicDetailCubit>()
                            .controller
                            .map((e) => e.text)
                            .toList(),
                      ),
                  picture: context.read<ElectronicDetailCubit>().picture,
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
        context.read<ElectronicDetailCubit>().deleteElectronic();
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
        'Electronic - ${widget.id.isEmpty ? context.l10n.crudNew : context.l10n.crudDetail}';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.electronic,
      body: BlocConsumer<ElectronicDetailCubit, ElectronicDetailState>(
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
                    context.go(RouteUri.electronic);
                  },
                );
            },
            successDelete: () {
              context
                ..dismiss()
                ..showSuccessDialog(
                  message: context.l10n.recordDeletedSuccessfully,
                  onTap: () {
                    context.go(RouteUri.electronic);
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
              if (_conName.text == '') {
                _conName.text =
                    context.read<ElectronicDetailCubit>().electronic!.name!;
              }
              if (_conDescription.text == '') {
                _conDescription.text = context
                    .read<ElectronicDetailCubit>()
                    .electronic!
                    .description!;
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
                                        BlocBuilder<ElectronicDetailCubit,
                                            ElectronicDetailState>(
                                          builder: (context, state) {
                                            if (context
                                                    .read<
                                                        ElectronicDetailCubit>()
                                                    .picture !=
                                                null) {
                                              return CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: MemoryImage(context
                                                    .read<
                                                        ElectronicDetailCubit>()
                                                    .picture!),
                                                radius: 60.0,
                                              );
                                            } else {
                                              return CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(
                                                    context
                                                        .read<
                                                            ElectronicDetailCubit>()
                                                        .electronic!
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
                                                    .read<
                                                        ElectronicDetailCubit>()
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
                                        bottom: kDefaultPadding * 1.5),
                                    child: FormBuilderTextField(
                                      name: 'name',
                                      controller: _conName,
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
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
                                  BlocBuilder<ElectronicDetailCubit,
                                      ElectronicDetailState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: kDefaultPadding),
                                        child: Column(
                                          children: List.generate(
                                            context
                                                .read<ElectronicDetailCubit>()
                                                .controller
                                                .length,
                                            (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: FormBuilderTextField(
                                                name: 'gripe $index',
                                                controller: context
                                                    .read<
                                                        ElectronicDetailCubit>()
                                                    .controller[index],
                                                decoration: InputDecoration(
                                                  labelText: 'Gripe',
                                                  hintText: 'Gripe',
                                                  border:
                                                      const OutlineInputBorder(),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  suffixIcon: context
                                                              .read<
                                                                  ElectronicDetailCubit>()
                                                              .controller
                                                              .length <=
                                                          1
                                                      ? null
                                                      : IconButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    ElectronicDetailCubit>()
                                                                .removeController(
                                                                    index);
                                                          },
                                                          icon: const Icon(Icons
                                                              .close_rounded),
                                                        ),
                                                ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: FormBuilderValidators
                                                    .required(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 40.0,
                                        child: ElevatedButton(
                                          style: themeData
                                              .extension<AppButtonTheme>()!
                                              .primaryElevated,
                                          onPressed: () {
                                            context
                                                .read<ElectronicDetailCubit>()
                                                .addController();
                                          },
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
                                                      .add_circle_outline_rounded,
                                                  size: (themeData
                                                          .textTheme
                                                          .labelLarge!
                                                          .fontSize! +
                                                      4.0),
                                                ),
                                              ),
                                              const Text('Add Gripe'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
                                              .go(RouteUri.electronic),
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
