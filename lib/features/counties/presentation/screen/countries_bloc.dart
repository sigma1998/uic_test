import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/counties/domain/usecase/countries_usecase.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_event.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  GetCountries getCountries;


  CountriesBloc(this.getCountries) : super(CountriesState()){
    on<CountrySearchEvent>((event, emit) async {
      emit(CountriesLoading());
      final res = await getCountries.getCountries(event.code);
      res.fold((left) {
        if(left == AppStates.networkError) {
          emit(CountriesNetworkError());
        }else {
          emit(CountriesError());
        }
      }, (right) {
        emit(CountriesLoaded(data: right));
      });
    });
  }
}
