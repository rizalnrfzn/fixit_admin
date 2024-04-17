import 'package:dartz/dartz.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/domain/domain.dart';

class GetAllBannerUsecase extends UseCase<List<BannerAd>, NoParams> {
  final BannerRepository _repository;

  GetAllBannerUsecase(this._repository);

  @override
  Future<Either<Failure, List<BannerAd>>> call(NoParams params) =>
      _repository.getAllBanner();
}
