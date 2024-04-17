import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/theme/theme.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:flutter/material.dart';

class OrderDataSource extends DataTableSource {
  final List<RepairOrder> listData;
  final bool verified;
  final void Function(RepairOrder data) onDetailButtonPressed;
  final void Function(RepairOrder data) onDeleteButtonPressed;

  OrderDataSource({
    required this.listData,
    this.verified = true,
    required this.onDetailButtonPressed,
    required this.onDeleteButtonPressed,
  });

  @override
  DataRow? getRow(int index) {
    final data = listData[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text('${data.dateTime}')),
      DataCell(Text('${data.client?.name}')),
      DataCell(Text('${data.technician?.name}')),
      DataCell(Text('${data.electronic?.name}')),
      DataCell(Text('${data.distance}')),
      DataCell(Text('Rp${data.checkingCost}')),
      DataCell(Text('Rp${data.repairCost}')),
      DataCell(Text('Rp${data.totalCost}')),
      DataCell(Text('${getStatus(data.status!).text} ')),
      DataCell(Builder(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () => onDetailButtonPressed.call(data),
                style:
                    Theme.of(context).extension<AppButtonTheme>()!.infoOutlined,
                child: Text(context.l10n.crudDetail),
              ),
            ],
          );
        },
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listData.length;

  @override
  int get selectedRowCount => 0;
}
