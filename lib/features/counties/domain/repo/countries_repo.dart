import 'package:either_dart/either.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/counties/data/models/countries_model.dart';

abstract class CountryRepo {
  Future<Either<AppStates, CountriesModel>> getCountries(String countryCode);
}