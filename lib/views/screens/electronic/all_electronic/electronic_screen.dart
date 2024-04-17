import 'dart:math';

import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';

class ElectronicScreen extends StatefulWidget {
  const ElectronicScreen({super.key});

  @override
  State<ElectronicScreen> createState() => _ElectronicScreenState();
}

class _ElectronicScreenState extends State<ElectronicScreen> {
  final _scrollController = ScrollController();
  final _formKey = GlobalKey<FormBuilderState>();

  late ElectronicDataSource _dataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final appDataTableTheme = themeData.extension<AppDataTableTheme>()!;

    return PortalMasterLayout(
      body: BlocBuilder<ElectronicCubit, ElectronicState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Loading(),
            failure: (message) => Column(
              children: [
                Text(
                  'Electronic',
                  style: themeData.textTheme.headlineMedium,
                ),
                Expanded(
                  child: Empty(
                    errorMessage: message,
                  ),
                ),
              ],
            ),
            success: () {
              _dataSource = ElectronicDataSource(
                listData: List.generate(
                    context.read<ElectronicCubit>().electronics.length,
                    (index) =>
                        context.read<ElectronicCubit>().electronics[index]),
                onDetailButtonPressed: (data) => GoRouter.of(context)
                    .go('${RouteUri.electronicDetail}?id=${data.id}'),
                onDeleteButtonPressed: (data) {},
              );

              return ListView(
                padding: const EdgeInsets.all(kDefaultPadding),
                children: [
                  Text(
                    'Electronic',
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
                          const CardHeader(
                            title: 'Electronic',
                          ),
                          CardBody(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: kDefaultPadding * 2.0),
                                  child: FormBuilder(
                                    key: _formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        spacing: kDefaultPadding,
                                        runSpacing: kDefaultPadding,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 300.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right:
                                                              kDefaultPadding *
                                                                  1.5),
                                                  child: FormBuilderTextField(
                                                    name: 'search',
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          context.l10n.search,
                                                      hintText:
                                                          context.l10n.search,
                                                      border:
                                                          const OutlineInputBorder(),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      isDense: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: kDefaultPadding),
                                                child: SizedBox(
                                                  height: 40.0,
                                                  child: ElevatedButton(
                                                    style: themeData
                                                        .extension<
                                                            AppButtonTheme>()!
                                                        .infoElevated,
                                                    onPressed: () {},
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              right:
                                                                  kDefaultPadding *
                                                                      0.5),
                                                          child: Icon(
                                                            Icons.search,
                                                            size: (themeData
                                                                    .textTheme
                                                                    .labelLarge!
                                                                    .fontSize! +
                                                                4.0),
                                                          ),
                                                        ),
                                                        Text(context
                                                            .l10n.search),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              SizedBox(
                                                height: 40.0,
                                                child: ElevatedButton(
                                                  style: themeData
                                                      .extension<
                                                          AppButtonTheme>()!
                                                      .successElevated,
                                                  onPressed: () =>
                                                      GoRouter.of(context).go(
                                                          RouteUri
                                                              .addElectronic),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .only(
                                                            right:
                                                                kDefaultPadding *
                                                                    0.5),
                                                        child: Icon(
                                                          Icons.add,
                                                          size: (themeData
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .fontSize! +
                                                              4.0),
                                                        ),
                                                      ),
                                                      Text(
                                                          context.l10n.crudNew),
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
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final double dataTableWidth = max(
                                          kScreenWidthMd, constraints.maxWidth);

                                      return Scrollbar(
                                        controller: _scrollController,
                                        thumbVisibility: true,
                                        trackVisibility: true,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          controller: _scrollController,
                                          child: SizedBox(
                                            width: dataTableWidth,
                                            child: Theme(
                                              data: themeData.copyWith(
                                                cardTheme:
                                                    appDataTableTheme.cardTheme,
                                                dataTableTheme:
                                                    appDataTableTheme
                                                        .dataTableThemeData,
                                              ),
                                              child: PaginatedDataTable(
                                                source: _dataSource,
                                                rowsPerPage: context
                                                            .read<
                                                                ElectronicCubit>()
                                                            .electronics
                                                            .length <=
                                                        20
                                                    ? context
                                                        .read<ElectronicCubit>()
                                                        .electronics
                                                        .length
                                                    : 20,
                                                showCheckboxColumn: false,
                                                showFirstLastButtons: true,
                                                columns: const [
                                                  DataColumn(
                                                      label: Text('No.'),
                                                      numeric: true),
                                                  DataColumn(
                                                    label: Text('Name'),
                                                  ),
                                                  DataColumn(
                                                    label: Text('Description'),
                                                  ),
                                                  DataColumn(
                                                    label: Text('Gripe'),
                                                  ),
                                                  DataColumn(
                                                    label: Text('Actions'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
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
