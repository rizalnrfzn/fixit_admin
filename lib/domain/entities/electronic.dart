import 'package:fixit_admin/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'electronic.freezed.dart';
part 'electronic.g.dart';

@freezed
class Electronic with _$Electronic {
  factory Electronic({
    String? id,
    String? name,
    String? description,
    String? image,
    @Default([]) List<String> gripe,
  }) = _Electronic;

  Electronic._();

  factory Electronic.fromJson(Map<String, dynamic> json) =>
      _$ElectronicFromJson(json);

  ElectronicResponse toModel() => ElectronicResponse(
        id: id,
        name: name,
        description: description,
        image: image,
        gripe: gripe,
      );
}
