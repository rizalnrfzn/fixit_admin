import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetBannerUsecase extends UseCase<BannerAd, String> {
  final BannerRepository _repository;

  GetBannerUsecase(this._repository);

  @override
  Future<Either<Failure, BannerAd>> call(String params) =>
      _repository.getBanner(params);
}
