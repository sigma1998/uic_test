import 'package:either_dart/either.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/space_x/data/models/spacex_model.dart';
import 'package:uic_test/features/space_x/domain/repo/spacex_repo.dart';

import '../data_source/spacex_remote_datasource.dart';

class SpaceXRepoImpl extends SpaceXRepo {
  SpaceXRemoteDataSource source;

  SpaceXRepoImpl({required this.source});

  @override
  Future<Either<AppStates, SpaceXModel>> getSpaceX() async {
    return await source.getSpaceX();
  }
}