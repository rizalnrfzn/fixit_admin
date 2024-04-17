import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'direction.freezed.dart';
part 'direction.g.dart';

@freezed
class Direction with _$Direction {
  factory Direction({
    List<Route>? routes,
  }) = _Direction;

  Direction._();

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);
}

@freezed
class Route with _$Route {
  factory Route({
    double? duration,
    double? distance,
    Gmtry? geometry,
  }) = _Route;

  Route._();

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

@freezed
class Gmtry with _$Gmtry {
  factory Gmtry({
    @ListLatLngJsonConverter() List<LatLng>? coordinates,
    String? type,
  }) = _Gmtry;

  Gmtry._();

  factory Gmtry.fromJson(Map<String, dynamic> json) => _$GmtryFromJson(json);
}
