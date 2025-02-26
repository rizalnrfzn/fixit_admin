import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  factory Client({
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    String? address,
    String? location,
    bool? isRegistered,
  }) = _Client;

  Client._();

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
