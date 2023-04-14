import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_event.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_state.dart';

import '../../domain/usecase/get_spacex_usecase.dart';

class SpaceXBloC extends Bloc<SpaceXEvent, SpaceXState> {
  GetSpaceXUseCase getSpaceXUseCase;

  SpaceXBloC(this.getSpaceXUseCase) : super(SpaceXState()) {
    on<SpaceXEvent>((event, emit) async {
      emit(SpaceXLoading());
      final res = await getSpaceXUseCase.getSpaceX();
      res.fold((left) {
        print("SpaceXBloC $left");
        if(left == AppStates.networkError) {
          emit(SpaceXNetworkError());
        }else {
          emit(SpaceXError());
        }
      }, (right) {
        print("SpaceXBloC $right");
        emit(SpaceXLoaded(spaceXModel: right));
      });
    });
  }

}