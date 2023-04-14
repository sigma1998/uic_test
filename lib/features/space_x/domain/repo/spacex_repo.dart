import 'package:either_dart/either.dart';

import '../../../../core/utils/states.dart';
import '../../data/models/spacex_model.dart';

abstract class SpaceXRepo {
  Future<Either<AppStates, SpaceXModel>> getSpaceX();
}