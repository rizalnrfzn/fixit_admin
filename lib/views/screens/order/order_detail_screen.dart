import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';

class OrderDetailScreen extends StatefulWidget {
  final String id;

  const OrderDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final pageTitle =
        'Order - ${widget.id.isEmpty ? context.l10n.crudNew : context.l10n.crudDetail}';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.order,
      body: BlocBuilder<OrderCubit, OrderState>(
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
                                  TextFieldReadOnly(
                                    name: 'Date Time',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .dateTime
                                        .toString(),
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Client Name',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .client
                                        ?.name,
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Client Address',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .clientAddress,
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Technician Name',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .technician
                                        ?.name,
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Technician Address',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .technician
                                        ?.address,
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Distance',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .distance
                                        .toString(),
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Duration',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .duration
                                        .toString(),
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Electronic',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .electronic
                                        ?.name,
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Gripe',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .gripe
                                        .toString(),
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Damage',
                                    initialValue: context
                                        .read<OrderCubit>()
                                        .order!
                                        .damage
                                        .toString(),
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Status',
                                    initialValue: getStatus(context
                                            .read<OrderCubit>()
                                            .order!
                                            .status!)
                                        .text,
                                  ),
                                  if (context
                                              .read<OrderCubit>()
                                              .order!
                                              .canceled !=
                                          null &&
                                      context
                                          .read<OrderCubit>()
                                          .order!
                                          .canceled!)
                                    TextFieldReadOnly(
                                      name: 'Reason Cancelled',
                                      initialValue: context
                                          .read<OrderCubit>()
                                          .order!
                                          .reasonCancelled,
                                    ),
                                  TextFieldReadOnly(
                                    name: 'Checking Cost',
                                    initialValue:
                                        'Rp${context.read<OrderCubit>().order!.checkingCost ?? 0}',
                                  ),
                                  if (context
                                              .read<OrderCubit>()
                                              .order!
                                              .repairCost !=
                                          null &&
                                      context
                                              .read<OrderCubit>()
                                              .order!
                                              .repairCost !=
                                          0)
                                    TextFieldReadOnly(
                                      name: 'Repair Cost',
                                      initialValue:
                                          'Rp${context.read<OrderCubit>().order!.repairCost ?? 0}',
                                    ),
                                  TextFieldReadOnly(
                                    name: 'Total Cost',
                                    initialValue:
                                        'Rp${context.read<OrderCubit>().order!.totalCost ?? 0}',
                                  ),
                                  TextFieldReadOnly(
                                    name: 'Payment Status',
                                    initialValue:
                                        context.read<OrderCubit>().order!.pay!
                                            ? 'Paid'
                                            : 'Not Paid',
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
                                              .go(RouteUri.order),
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
