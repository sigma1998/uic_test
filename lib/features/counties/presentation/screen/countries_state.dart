
import 'package:uic_test/features/counties/data/models/countries_model.dart';

class CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  CountriesModel data;
  CountriesLoaded({required this.data});
}


class CountriesEmpty extends CountriesState {}

class CountriesError extends CountriesState {}

class CountriesNetworkError extends CountriesState {}
