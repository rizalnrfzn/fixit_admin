import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'repair_order.freezed.dart';
part 'repair_order.g.dart';

@freezed
class RepairOrder with _$RepairOrder {
  factory RepairOrder({
    String? id,
    String? clientUid,
    String? technicianUid,
    @LatLngConverter() LatLng? clientLocation,
    @LatLngConverter() LatLng? technicianLocation,
    String? clientAddress,
    double? duration,
    double? distance,
    String? electronicId,
    List<String>? gripe,
    List<String>? damage,
    List<String>? electronicPicture,
    int? checkingCost,
    int? repairCost,
    int? totalCost,
    @TimestampConverter() DateTime? dateTime,
    String? status,
    bool? repair,
    bool? pay,
    bool? canceled,
    String? reasonCancelled,
    Direction? direction,
    Client? client,
    Technician? technician,
    Electronic? electronic,
  }) = _RepairOrder;

  RepairOrder._();

  factory RepairOrder.fromJson(Map<String, dynamic> json) =>
      _$RepairOrderFromJson(json);
}
