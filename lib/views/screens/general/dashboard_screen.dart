import 'dart:math';

import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final appColorScheme = Theme.of(context).extension<AppColorScheme>()!;
    final appDataTableTheme = Theme.of(context).extension<AppDataTableTheme>()!;
    final size = MediaQuery.of(context).size;

    final summaryCardCrossAxisCount = (size.width >= kScreenWidthLg ? 4 : 2);

    return PortalMasterLayout(
      body: BlocBuilder<GeneralCubit, GeneralState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Loading(),
            failure: (message) => Column(
              children: [
                Text(
                  context.l10n.dashboard,
                  style: themeData.textTheme.headlineMedium,
                ),
                Expanded(child: Empty(errorMessage: message)),
              ],
            ),
            success: () {
              return ListView(
                padding: const EdgeInsets.all(kDefaultPadding),
                children: [
                  Text(
                    context.l10n.dashboard,
                    style: themeData.textTheme.headlineMedium,
                  ),
                  BlocBuilder<GeneralCubit, GeneralState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        failure: (message) => Empty(errorMessage: message),
                        success: () {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final summaryCardWidth =
                                        ((constraints.maxWidth -
                                                (kDefaultPadding *
                                                    (summaryCardCrossAxisCount -
                                                        1))) /
                                            summaryCardCrossAxisCount);

                                    return Wrap(
                                      direction: Axis.horizontal,
                                      spacing: kDefaultPadding,
                                      runSpacing: kDefaultPadding,
                                      children: [
                                        SummaryCard(
                                          title: context.l10n.newOrders(2),
                                          value: context
                                              .read<GeneralCubit>()
                                              .totalOrder
                                              .toString(),
                                          icon: Icons.shopping_cart_rounded,
                                          backgroundColor: appColorScheme.info,
                                          textColor:
                                              themeData.colorScheme.onPrimary,
                                          iconColor: Colors.black12,
                                          width: summaryCardWidth,
                                        ),
                                        SummaryCard(
                                          title: 'Technicians',
                                          value: context
                                              .read<GeneralCubit>()
                                              .totalTechnician
                                              .toString(),
                                          icon: Icons.ssid_chart_rounded,
                                          backgroundColor:
                                              appColorScheme.success,
                                          textColor:
                                              themeData.colorScheme.onPrimary,
                                          iconColor: Colors.black12,
                                          width: summaryCardWidth,
                                        ),
                                        SummaryCard(
                                          title: 'Unverified Technicians',
                                          value: context
                                              .read<GeneralCubit>()
                                              .totalUnverifiedTechnician
                                              .toString(),
                                          icon: Icons.group_add_rounded,
                                          backgroundColor:
                                              appColorScheme.warning,
                                          textColor:
                                              appColorScheme.buttonTextBlack,
                                          iconColor: Colors.black12,
                                          width: summaryCardWidth,
                                        ),
                                        SummaryCard(
                                          title: 'Client',
                                          value: context
                                              .read<GeneralCubit>()
                                              .totalClient
                                              .toString(),
                                          icon: Icons
                                              .report_gmailerrorred_rounded,
                                          backgroundColor:
                                              appColorScheme.secondary,
                                          textColor:
                                              themeData.colorScheme.onPrimary,
                                          iconColor: Colors.black12,
                                          width: summaryCardWidth,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CardHeader(
                                        title: context.l10n.recentOrders(2),
                                        showDivider: false,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            final double dataTableWidth = max(
                                                kScreenWidthMd,
                                                constraints.maxWidth);

                                            return Scrollbar(
                                              controller:
                                                  _dataTableHorizontalScrollController,
                                              thumbVisibility: true,
                                              trackVisibility: true,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                controller:
                                                    _dataTableHorizontalScrollController,
                                                child: SizedBox(
                                                  width: dataTableWidth,
                                                  child: Theme(
                                                    data: themeData.copyWith(
                                                      cardTheme:
                                                          appDataTableTheme
                                                              .cardTheme,
                                                      dataTableTheme:
                                                          appDataTableTheme
                                                              .dataTableThemeData,
                                                    ),
                                                    child: DataTable(
                                                      showCheckboxColumn: false,
                                                      showBottomBorder: true,
                                                      columns: const [
                                                        DataColumn(
                                                            label: Text('No.'),
                                                            numeric: true),
                                                        DataColumn(
                                                            label: Text(
                                                                'Date Time')),
                                                        DataColumn(
                                                            label:
                                                                Text('Client')),
                                                        DataColumn(
                                                            label: Text(
                                                                'Tehcnician')),
                                                        DataColumn(
                                                            label: Text(
                                                                'Electronic')),
                                                        DataColumn(
                                                            label: Text(
                                                                'Order Status')),
                                                      ],
                                                      rows: List.generate(
                                                          context
                                                              .read<
                                                                  GeneralCubit>()
                                                              .orders
                                                              .length, (index) {
                                                        return DataRow.byIndex(
                                                          index: index,
                                                          cells: [
                                                            DataCell(
                                                              Text(
                                                                  '${index + 1}'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  '${context.read<GeneralCubit>().orders[index].dateTime}'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  '${context.read<GeneralCubit>().orders[index].client?.name}'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  '${context.read<GeneralCubit>().orders[index].technician?.name}'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  '${context.read<GeneralCubit>().orders[index].electronic?.name}'),
                                                            ),
                                                            DataCell(
                                                              Text(getStatus(context
                                                                      .read<
                                                                          GeneralCubit>()
                                                                      .orders[
                                                                          index]
                                                                      .status!)
                                                                  .text),
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              kDefaultPadding),
                                          child: SizedBox(
                                            height: 40.0,
                                            width: 120.0,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context.go(RouteUri.order);
                                              },
                                              style: themeData
                                                  .extension<AppButtonTheme>()!
                                                  .infoElevated,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right: kDefaultPadding *
                                                            0.5),
                                                    child: Icon(
                                                      Icons.visibility_rounded,
                                                      size: (themeData
                                                              .textTheme
                                                              .labelLarge!
                                                              .fontSize! +
                                                          4.0),
                                                    ),
                                                  ),
                                                  const Text('View All'),
                                                ],
                                              ),
                                            ),
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
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 120.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              child: Icon(
                icon,
                size: 80.0,
                color: iconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
