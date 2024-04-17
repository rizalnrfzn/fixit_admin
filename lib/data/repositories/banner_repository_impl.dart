import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/error/failure.dart';
import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/domain/domain.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource _datasource;

  BannerRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, BannerAd>> getBanner(String params) async {
    final response = await _datasource.getBanner(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, List<BannerAd>>> getAllBanner() async {
    final response = await _datasource.getAllBanner();

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.map((e) => e.toEntity()).toList()),
    );
  }

  @override
  Future<Either<Failure, BannerAd>> addBanner(AddBannerParams params) async {
    final response = await _datasource.addBanner(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, BannerAd>> editBanner(EditBannerParams params) async {
    final response = await _datasource.editBanner(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, BannerAd>> deleteBanner(String params) async {
    final response = await _datasource.deleteBanner(params);

    return response.fold(
      (l) => Left(l),
      (r) => Right(r.toEntity()),
    );
  }
}
