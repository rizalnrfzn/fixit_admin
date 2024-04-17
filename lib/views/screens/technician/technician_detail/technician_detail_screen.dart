import 'dart:js' as js;

import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/constants/dimens.dart';
import 'package:fixit_admin/l10n/l10n.dart';

class TechnicianDetailScreen extends StatefulWidget {
  final String id;

  const TechnicianDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<TechnicianDetailScreen> createState() => _TechnicianDetailScreenState();
}

class _TechnicianDetailScreenState extends State<TechnicianDetailScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final pageTitle =
        'Technician - ${widget.id.isEmpty ? context.l10n.crudNew : context.l10n.crudDetail}';

    return PortalMasterLayout(
      selectedMenuUri: RouteUri.technician,
      body: BlocBuilder<TechnicianDetailCubit, TechnicianDetailState>(
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
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .profilePicture!),
                                      radius: 60.0,
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
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .uid,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
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
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .name,
                                      readOnly: true,
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
                                          .read<TechnicianDetailCubit>()
                                          .technician!
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
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .phoneNumber,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'description',
                                      decoration: const InputDecoration(
                                        labelText: 'Description',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .description,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'address',
                                      decoration: const InputDecoration(
                                        labelText: 'Address',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .address,
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'rating',
                                      decoration: const InputDecoration(
                                        labelText: 'Rating',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .rating
                                          .toString(),
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderTextField(
                                      name: 'number of reviews',
                                      decoration: const InputDecoration(
                                        labelText: 'Number Of Reviews',
                                        border: OutlineInputBorder(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .numberOfReviews
                                          .toString(),
                                      readOnly: true,
                                      validator:
                                          FormBuilderValidators.required(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderFilterChip(
                                      name: 'electronics',
                                      spacing: kDefaultPadding * 0.5,
                                      runSpacing: kDefaultPadding * 0.5,
                                      selectedColor: Theme.of(context)
                                          .extension<AppColorScheme>()!
                                          .info,
                                      decoration: const InputDecoration(
                                        labelText: 'Electronics',
                                        border: OutlineInputBorder(),
                                      ),
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .electronics
                                          ?.map((e) => e.id)
                                          .toList(),
                                      enabled: false,
                                      showCheckmark: false,
                                      options: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .electronics!
                                          .map(
                                            (e) => FormBuilderChipOption(
                                              value: e.id,
                                              child: Text('${e.name}'),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2.0),
                                    child: FormBuilderFilterChip(
                                      name: 'files',
                                      spacing: kDefaultPadding * 0.5,
                                      runSpacing: kDefaultPadding * 0.5,
                                      selectedColor: Theme.of(context)
                                          .extension<AppColorScheme>()!
                                          .info,
                                      decoration: const InputDecoration(
                                        labelText: 'Files',
                                        border: OutlineInputBorder(),
                                      ),
                                      initialValue: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .files
                                          ?.map((e) {
                                        String fileName = e;

                                        fileName = fileName.split("/")[7];
                                        fileName =
                                            fileName.replaceAll("%2F", " ");
                                        fileName = fileName.substring(
                                            0, fileName.indexOf('.pdf'));
                                        fileName = fileName.split(' ')[3];
                                        return fileName;
                                      }).toList(),
                                      enabled: false,
                                      showCheckmark: false,
                                      options: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .files!
                                          .map((e) {
                                        String fileName = e;

                                        fileName = fileName.split("/")[7];
                                        fileName =
                                            fileName.replaceAll("%2F", " ");
                                        fileName = fileName.substring(
                                            0, fileName.indexOf('.pdf'));
                                        fileName = fileName.split(' ')[3];
                                        return FormBuilderChipOption(
                                          value: fileName,
                                          child: InkWell(
                                              onTap: () {
                                                js.context
                                                    .callMethod('open', [e]);
                                              },
                                              child: Text(fileName)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Container(
                                    height: context
                                                .read<TechnicianDetailCubit>()
                                                .technician!
                                                .images!
                                                .length <=
                                            4
                                        ? 316
                                        : context
                                                    .read<
                                                        TechnicianDetailCubit>()
                                                    .technician!
                                                    .images!
                                                    .length <=
                                                8
                                            ? 616
                                            : context
                                                        .read<
                                                            TechnicianDetailCubit>()
                                                        .technician!
                                                        .images!
                                                        .length <=
                                                    12
                                                ? 916
                                                : context
                                                            .read<
                                                                TechnicianDetailCubit>()
                                                            .technician!
                                                            .images!
                                                            .length <=
                                                        16
                                                    ? 1216
                                                    : 1516,
                                    margin: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: AlignedGridView.count(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: context
                                          .read<TechnicianDetailCubit>()
                                          .technician!
                                          .images!
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Image.network(
                                          context
                                              .read<TechnicianDetailCubit>()
                                              .technician!
                                              .images![index],
                                          height: 300,
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 500,
                                    width: 500,
                                    margin: const EdgeInsets.only(
                                        bottom: kDefaultPadding * 2),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: FlutterMap(
                                      mapController: mapController,
                                      options: MapOptions(
                                        minZoom: 13,
                                        maxZoom: 20,
                                        initialCenter: context
                                            .read<TechnicianDetailCubit>()
                                            .technician!
                                            .location!,
                                        initialZoom: 17,
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              'https://api.mapbox.com/styles/v1/levelsekawan/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}',
                                          additionalOptions: const {
                                            'mapStyleId':
                                                'clh4egprz00pd01qyaovgde4c',
                                            'accessToken':
                                                'pk.eyJ1IjoibGV2ZWxzZWthd2FuIiwiYSI6ImNsZnpsaGhxOTBhd3IzZ3Mxdzdid2VyNzIifQ.p1-pFcopO4HCVdeWb27DOg',
                                          },
                                        ),
                                        MarkerLayer(
                                          markers: [
                                            Marker(
                                              point: context
                                                  .read<TechnicianDetailCubit>()
                                                  .technician!
                                                  .location!,
                                              child: const Icon(
                                                Icons.location_on_rounded,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
                                              .go(RouteUri.technician),
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
