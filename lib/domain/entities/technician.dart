import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'technician.freezed.dart';
part 'technician.g.dart';

@freezed
class Technician with _$Technician {
  factory Technician({
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
    Direction? direction,
    List<Electronic>? electronics,
  }) = _Technician;

  Technician._();

  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);

  TechnicianResponse toModel() => TechnicianResponse(
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
