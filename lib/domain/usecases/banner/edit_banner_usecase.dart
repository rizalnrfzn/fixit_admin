import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:flutter/services.dart';

class EditBannerUsecase extends UseCase<BannerAd, EditBannerParams> {
  final BannerRepository _repository;

  EditBannerUsecase(this._repository);

  @override
  Future<Either<Failure, BannerAd>> call(EditBannerParams params) =>
      _repository.editBanner(params);
}

class EditBannerParams {
  final BannerAd banner;
  final Uint8List? picture;

  EditBannerParams({
    required this.banner,
    this.picture,
  });
}
