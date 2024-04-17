import 'package:fixit_admin/data/data.dart';
import 'package:fixit_admin/data/repositories/banner_repository_impl.dart';
import 'package:fixit_admin/domain/domain.dart';
import 'package:fixit_admin/views/views.dart';
import 'package:get_it/get_it.dart';
import 'package:fixit_admin/core/core.dart';
import 'package:fixit_admin/utils/utils.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  await _initSharedPref();
}

Future<void> _initSharedPref() async {
  await SharedPref.init();
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  sl.registerLazySingleton<RepairOrderRepository>(
      () => RepairOrderRepositoryImpl(sl()));

  sl.registerLazySingleton<ClientRepository>(() => ClientRepositoryImpl(sl()));

  sl.registerLazySingleton<TechnicianRepository>(
      () => TechnicianRepositoryImpl(sl()));

  sl.registerLazySingleton<ElectronicRepository>(
      () => ElectronicRepositoryImpl(sl()));

  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(sl()));

  sl.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(sl()));
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());

  sl.registerLazySingleton<RepairOrderRemoteDatasource>(
      () => RepairOrderRemoteDatasourceImpl());

  sl.registerLazySingleton<ClientRemoteDatasource>(
      () => ClientRemoteDatasourceImpl());

  sl.registerLazySingleton<TechnicianRemoteDatasource>(
      () => TechnicianRemoteDatasourceImpl());

  sl.registerLazySingleton<ElectronicRemoteDatasource>(
      () => ElectronicRemoteDatasourceImpl());

  sl.registerLazySingleton<ProfileRemoteDatasource>(
      () => ProfileRemoteDatasourceImpl());

  sl.registerLazySingleton<BannerRemoteDatasource>(
      () => BannerRemoteDatasourceImpl());
}

void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => RegistrationUsecase(sl()));

  // profile
  sl.registerLazySingleton(() => EditProfileUsecase(sl()));

  // order
  sl.registerLazySingleton(() => GetAllOrdersUsecase(sl()));
  sl.registerLazySingleton(() => GetOrderUsecase(sl()));
  sl.registerLazySingleton(() => GetRacentOrderUsecase(sl()));

  // client
  sl.registerLazySingleton(() => GetClientUsecase(sl()));
  sl.registerLazySingleton(() => GetAllClientsUsecase(sl()));
  sl.registerLazySingleton(() => GetTotalCLientUsecase(sl()));

  // technician
  sl.registerLazySingleton(() => GetTechnicianUsecase(sl()));
  sl.registerLazySingleton(() => GetAllTechniciansUsecase(sl()));
  sl.registerLazySingleton(() => GetUnverifiedTechnicianUsecase(sl()));
  sl.registerLazySingleton(() => GetTotalTechnicianUsecase(sl()));
  sl.registerLazySingleton(() => GetTotalUnverifiedTechnicianUsecase(sl()));
  sl.registerLazySingleton(() => VerifyTechnicianUsecase(sl()));

  // electronic
  sl.registerLazySingleton(() => GetElectronicUsecase(sl()));
  sl.registerLazySingleton(() => GetAllElectronicUsecase(sl()));
  sl.registerLazySingleton(() => AddElectronicUsecase(sl()));
  sl.registerLazySingleton(() => EditElectronicUsecase(sl()));
  sl.registerLazySingleton(() => DeleteElectronicUsecase(sl()));

  // Banner
  sl.registerLazySingleton(() => GetBannerUsecase(sl()));
  sl.registerLazySingleton(() => GetAllBannerUsecase(sl()));
  sl.registerLazySingleton(() => AddBannerUsecase(sl()));
  sl.registerLazySingleton(() => EditBannerUsecase(sl()));
  sl.registerLazySingleton(() => DeleteBannerUsecase(sl()));
}

void _cubit() {
  // cubit
  sl.registerFactory(() => AppCubit());
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerFactory(
      () => GeneralCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));

  // profile
  sl.registerFactory(() => ProfileCubit(sl()));

  // technician
  sl.registerFactory(() => TechnicianCubit(sl()));
  sl.registerFactory(() => TechnicianDetailCubit(sl(), sl()));
  sl.registerFactory(() => UnverifiedTechnicianCubit(sl()));
  sl.registerFactory(() => UnverifiedTechnicianDetailCubit(sl(), sl(), sl()));

  // client
  sl.registerFactory(() => ClientCubit(sl(), sl()));

  // order
  sl.registerFactory(() => OrderCubit(sl(), sl(), sl(), sl(), sl()));

  // electronic
  sl.registerFactory(() => ElectronicCubit(sl()));
  sl.registerFactory(() => ElectronicDetailCubit(sl(), sl(), sl()));
  sl.registerFactory(() => AddElectronicCubit(sl()));

  // Banner
  sl.registerFactory(() => BannerCubit(sl()));
  sl.registerFactory(() => BannerDetailCubit(sl(), sl(), sl()));
  sl.registerFactory(() => AddBannerCubit(sl()));
}
