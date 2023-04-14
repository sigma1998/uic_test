import 'package:either_dart/either.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/space_x/data/models/spacex_model.dart';
import 'package:uic_test/features/space_x/domain/repo/spacex_repo.dart';

abstract class GetSpaceXUseCase {
  Future<Either<AppStates, SpaceXModel>> getSpaceX();
}
class GetSpaceXUseCaseImpl extends GetSpaceXUseCase {
  SpaceXRepo spaceXRepo;

  GetSpaceXUseCaseImpl({required this.spaceXRepo});

  @override
  Future<Either<AppStates, SpaceXModel>> getSpaceX() async {
    return await spaceXRepo.getSpaceX();
  }

}