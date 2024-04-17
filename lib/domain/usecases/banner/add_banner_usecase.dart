import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';

class AddBannerUsecase extends UseCase<BannerAd, AddBannerParams> {
  final BannerRepository _repository;

  AddBannerUsecase(this._repository);

  @override
  Future<Either<Failure, BannerAd>> call(AddBannerParams params) =>
      _repository.addBanner(params);
}

class AddBannerParams {
  final BannerAd banner;
  final Uint8List picture;

  AddBannerParams({
    required this.banner,
    required this.picture,
  });
}
