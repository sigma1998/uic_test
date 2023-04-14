import 'package:uic_test/features/counties/data/models/countries_model.dart';
abstract class CountriesEvent{}


class CountrySearchEvent extends CountriesEvent{
  String code;
  CountrySearchEvent({required this.code});
}
