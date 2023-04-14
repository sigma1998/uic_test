import 'package:uic_test/features/space_x/data/models/spacex_model.dart';

class SpaceXState{}
class SpaceXLoading extends SpaceXState{}
class SpaceXLoaded extends SpaceXState{
  SpaceXModel spaceXModel;
  SpaceXLoaded({required this.spaceXModel});
}
class SpaceXEmpty extends SpaceXState{}
class SpaceXError extends SpaceXState{}
class SpaceXNetworkError extends SpaceXState{}