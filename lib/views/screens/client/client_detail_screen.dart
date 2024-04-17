import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';

class ClientDetailScreen extends StatefulWidget {
  final String id;

  const ClientDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final pageTitle =
        'Client - ${widget.id.isEmpty ? context.l10n.crudNew : context.l10n.crudDetail}';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.client,
      body: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Loading(),
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
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(context
                                          .read<ClientCubit>()
                                          .client!
                                          .profilePicture!),
                                      radius: 60.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 1.5),
                                    child: FormBuilderTextField(
                                      name: 'name',
                                      decoration: const InputDecoration(
                                        labelText: 'Name',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      initialValue: context
                                          .read<ClientCubit>()
                                          .client!
                                          .name,
                                      readOnly: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'uid',
                                      decoration: const InputDecoration(
                                        labelText: 'Uid',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      initialValue: context
                                          .read<ClientCubit>()
                                          .client!
                                          .uid,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'email',
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      initialValue: context
                                          .read<ClientCubit>()
                                          .client!
                                          .email,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'phone number',
                                      decoration: const InputDecoration(
                                        labelText: 'Phone Number',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      initialValue: context
                                          .read<ClientCubit>()
                                          .client!
                                          .phoneNumber,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
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
                                              .go(RouteUri.client),
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
