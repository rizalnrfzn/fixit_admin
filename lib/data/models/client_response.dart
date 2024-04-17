import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_response.freezed.dart';
part 'client_response.g.dart';

@freezed
class ClientResponse with _$ClientResponse {
  factory ClientResponse({
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    String? address,
    String? location,
    bool? isRegistered,
  }) = _ClientResponse;

  ClientResponse._();

  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);

  factory ClientResponse.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ClientResponse.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ClientResponse object, SetOptions? options) =>
      object.toJson();

  Client toEntity() => Client(
        uid: uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        profilePicture: profilePicture,
        address: address,
        location: location,
        isRegistered: isRegistered,
      );
}
