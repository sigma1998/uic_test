import 'package:either_dart/either.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/counties/data/models/countries_model.dart';
import 'package:uic_test/features/counties/domain/repo/countries_repo.dart';

abstract class GetCountries {
  Future<Either<AppStates, CountriesModel>> getCountries(String countryCode);
}

class GetCountriesImpl extends GetCountries {
  CountryRepo repo;

  GetCountriesImpl({required this.repo});

  @override
  Future<Either<AppStates, CountriesModel>> getCountries(
      String countryCode) async {
    return await repo.getCountries(countryCode);
  }
}
