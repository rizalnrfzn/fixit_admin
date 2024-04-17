import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'technician_response.freezed.dart';
part 'technician_response.g.dart';

@freezed
class TechnicianResponse with _$TechnicianResponse {
  factory TechnicianResponse({
    String? uid,
    String? name,
    String? email,
    bool? isRegistered,
    String? phoneNumber,
    String? description,
    String? profilePicture,
    List<String>? images,
    List<String>? files,
    String? address,
    @LatLngConverter() LatLng? location,
    @LatLngConverter() LatLng? currentLocation,
    List<String>? electronicId,
    bool? isVerified,
    bool? isOnline,
    bool? inOrder,
    double? rating,
    int? numberOfReviews,
  }) = _TechnicianResponse;

  TechnicianResponse._();

  factory TechnicianResponse.fromJson(Map<String, dynamic> json) =>
      _$TechnicianResponseFromJson(json);

  factory TechnicianResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      TechnicianResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          TechnicianResponse object, SetOptions? options) =>
      object.toJson();

  Technician toEntity() => Technician(
        uid: uid,
        name: name,
        email: email,
        isRegistered: isRegistered,
        phoneNumber: phoneNumber,
        description: description,
        profilePicture: profilePicture,
        images: images,
        files: files,
        address: address,
        location: location,
        currentLocation: currentLocation,
        electronicId: electronicId,
        isVerified: isVerified,
        isOnline: isOnline,
        inOrder: inOrder,
        rating: rating,
        numberOfReviews: numberOfReviews,
      );
}
