import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'repair_order_response.freezed.dart';
part 'repair_order_response.g.dart';

@freezed
class RepairOrderResponse with _$RepairOrderResponse {
  factory RepairOrderResponse({
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
  }) = _RepairOrderResponse;

  RepairOrderResponse._();

  factory RepairOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RepairOrderResponseFromJson(json);

  factory RepairOrderResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      RepairOrderResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          RepairOrderResponse object, SetOptions? options) =>
      object.toJson();

  RepairOrder toEntity() => RepairOrder(
        id: id,
        clientUid: clientUid,
        technicianUid: technicianUid,
        clientLocation: clientLocation,
        technicianLocation: technicianLocation,
        clientAddress: clientAddress,
        duration: duration,
        distance: distance,
        electronicId: electronicId,
        gripe: gripe,
        damage: damage,
        electronicPicture: electronicPicture,
        checkingCost: checkingCost,
        repairCost: repairCost,
        totalCost: totalCost,
        dateTime: dateTime,
        status: status,
        repair: repair,
        pay: pay,
        canceled: canceled,
        reasonCancelled: reasonCancelled,
      );
}
