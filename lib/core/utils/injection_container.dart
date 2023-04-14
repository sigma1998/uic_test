import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:uic_test/core/network/network_info.dart';
import 'package:uic_test/core/services/graph_ql/graph_service.dart';
import 'package:uic_test/features/counties/data/data_source/countries_remote_datasource.dart';
import 'package:uic_test/features/counties/data/repositories/countries_repo.dart';
import 'package:uic_test/features/counties/domain/repo/countries_repo.dart';
import 'package:uic_test/features/counties/domain/usecase/countries_usecase.dart';
import 'package:uic_test/features/space_x/data/data_source/spacex_remote_datasource.dart';
import 'package:uic_test/features/space_x/data/repo/SpaceXRepo.dart';
import 'package:uic_test/features/space_x/domain/usecase/get_spacex_usecase.dart';

import '../../features/space_x/domain/repo/spacex_repo.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _registerSingleton();
  await getIt.allReady();
}

Future<void> _registerSingleton() async {
  ///network
  getIt.registerSingleton<Connectivity>(Connectivity());
  getIt.registerSingleton<InternetConnectionChecker>(
      InternetConnectionChecker());
  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(connectivity: getIt.get(), dataChecker: getIt.get()));

  ///data source
  getIt.registerSingleton<CountriesRemoteDataSource>(CountriesRemoteImpl(
      networkInfo: getIt.get(),
      qlClient: GraphService.getCountryGraphClient()));
  getIt.registerSingleton<SpaceXRemoteDataSource>(SpaceXRemoteDataSourceImpl(
      networkInfo: getIt.get(),
      qlClient: GraphService.getSpaceXGraphClient()));

  ///repo
  getIt
      .registerSingleton<CountryRepo>(CountryRepoImpl(dataSource: getIt.get()));
  getIt.registerSingleton<SpaceXRepo>(SpaceXRepoImpl(
    source: getIt.get(),
  ));

  ///use cases
  getIt.registerSingleton<GetCountries>(GetCountriesImpl(repo: getIt.get()));
  getIt.registerSingleton<GetSpaceXUseCase>(
      GetSpaceXUseCaseImpl(spaceXRepo: getIt.get()));
}
