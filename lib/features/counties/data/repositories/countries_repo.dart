import 'package:either_dart/either.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/counties/data/data_source/countries_remote_datasource.dart';
import 'package:uic_test/features/counties/data/models/countries_model.dart';
import 'package:uic_test/features/counties/domain/repo/countries_repo.dart';

class CountryRepoImpl extends CountryRepo {
  CountriesRemoteDataSource dataSource;

  CountryRepoImpl({required this.dataSource});

  @override
  Future<Either<AppStates, CountriesModel>> getCountries(String countryCode) async {
      return  await dataSource.getCountries(countryCode);
  }

}