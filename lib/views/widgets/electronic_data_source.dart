import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/theme/theme.dart';
import 'package:flutter/material.dart';

class ElectronicDataSource extends DataTableSource {
  final List<Electronic> listData;
  final bool verified;
  final void Function(Electronic data) onDetailButtonPressed;
  final void Function(Electronic data) onDeleteButtonPressed;

  ElectronicDataSource({
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
      DataCell(Text('${data.name}')),
      DataCell(Text('${data.description}')),
      DataCell(Text('${data.gripe}')),
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
