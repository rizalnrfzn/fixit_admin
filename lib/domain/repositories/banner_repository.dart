import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

abstract class BannerRepository {
  Future<Either<Failure, BannerAd>> getBanner(String params);

  Future<Either<Failure, List<BannerAd>>> getAllBanner();

  Future<Either<Failure, BannerAd>> addBanner(AddBannerParams params);

  Future<Either<Failure, BannerAd>> editBanner(EditBannerParams params);

  Future<Either<Failure, BannerAd>> deleteBanner(String params);
}
