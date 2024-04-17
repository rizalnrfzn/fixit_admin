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

class AddElectronicScreen extends StatefulWidget {
  const AddElectronicScreen({super.key});

  @override
  State<AddElectronicScreen> createState() => _AddElectronicScreenState();
}

class _AddElectronicScreenState extends State<AddElectronicScreen> {
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
    if (context.read<AddElectronicCubit>().picture != null) {
      if (_formKey.currentState!.validate()) {
        final dialog = AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          title: context.l10n.confirmSubmitRecord,
          width: kDialogWidth,
          btnOkText: context.l10n.yes,
          btnOkOnPress: () {
            context.read<AddElectronicCubit>().addElectronic(
                  AddElectronicParams(
                    electronic: Electronic(
                      name: _conName.text,
                      description: _conDescription.text,
                      gripe: context
                          .read<AddElectronicCubit>()
                          .controller
                          .map((e) => e.text)
                          .toList(),
                    ),
                    picture: context.read<AddElectronicCubit>().picture!,
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

    const pageTitle = 'Add Electronic';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.electronic,
      body: BlocListener<AddElectronicCubit, AddElectronicState>(
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
                    context.go(RouteUri.electronic);
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
                            BlocBuilder<AddElectronicCubit, AddElectronicState>(
                              builder: (context, state) {
                                return Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding * 1.5),
                                  child: Stack(
                                    children: [
                                      context
                                                  .read<AddElectronicCubit>()
                                                  .picture !=
                                              null
                                          ? CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 60.0,
                                              backgroundImage: MemoryImage(
                                                  context
                                                      .read<
                                                          AddElectronicCubit>()
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
                                                  .read<AddElectronicCubit>()
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
                                name: 'name',
                                controller: _conName,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  hintText: 'Name',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.name,
                                validator: FormBuilderValidators.required(),
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
                                  hintText: 'Description',
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.multiline,
                                validator: FormBuilderValidators.required(),
                              ),
                            ),
                            BlocBuilder<AddElectronicCubit, AddElectronicState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding),
                                  child: Column(
                                    children: List.generate(
                                      context
                                          .read<AddElectronicCubit>()
                                          .controller
                                          .length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: FormBuilderTextField(
                                          name: 'gripe $index',
                                          controller: context
                                              .read<AddElectronicCubit>()
                                              .controller[index],
                                          decoration: InputDecoration(
                                            labelText: 'Gripe',
                                            hintText: 'Gripe',
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            suffixIcon: context
                                                        .read<
                                                            AddElectronicCubit>()
                                                        .controller
                                                        .length <=
                                                    1
                                                ? null
                                                : IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              AddElectronicCubit>()
                                                          .removeController(
                                                              index);
                                                    },
                                                    icon: const Icon(
                                                        Icons.close_rounded),
                                                  ),
                                          ),
                                          keyboardType: TextInputType.multiline,
                                          validator:
                                              FormBuilderValidators.required(),
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
                                          .read<AddElectronicCubit>()
                                          .addController();
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
                                            Icons.add_circle_outline_rounded,
                                            size: (themeData.textTheme
                                                    .labelLarge!.fontSize! +
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
                                        .go(RouteUri.electronic),
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
