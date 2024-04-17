import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'direction_response.freezed.dart';
part 'direction_response.g.dart';

@freezed
class DirectionResponse with _$DirectionResponse {
  factory DirectionResponse({
    List<RouteResponse>? routes,
  }) = _DirectionResponse;

  DirectionResponse._();

  factory DirectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DirectionResponseFromJson(json);

  Direction toEntity() => Direction(
        routes: routes
            ?.map(
              (e) => e.toEntity(),
            )
            .toList(),
      );
}

@freezed
class RouteResponse with _$RouteResponse {
  factory RouteResponse({
    double? duration,
    double? distance,
    GmtryResponse? geometry,
  }) = _RouteResponse;

  RouteResponse._();

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);

  Route toEntity() => Route(
        duration: duration,
        distance: distance,
        geometry: geometry?.toEntity(),
      );
}

@freezed
class GmtryResponse with _$GmtryResponse {
  factory GmtryResponse({
    @ListLatLngJsonConverter() List<LatLng>? coordinates,
    String? type,
  }) = _GmtryResponse;

  GmtryResponse._();

  factory GmtryResponse.fromJson(Map<String, dynamic> json) =>
      _$GmtryResponseFromJson(json);

  Gmtry toEntity() => Gmtry(
        coordinates: coordinates,
        type: type,
      );
}
