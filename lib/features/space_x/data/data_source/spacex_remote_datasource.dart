import 'package:either_dart/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uic_test/core/network/network_info.dart';
import 'package:uic_test/features/space_x/data/models/spacex_model.dart';

import '../../../../core/utils/states.dart';

abstract class SpaceXRemoteDataSource {
  Future<Either<AppStates, SpaceXModel>> getSpaceX();
}

class SpaceXRemoteDataSourceImpl extends SpaceXRemoteDataSource {
  NetworkInfo networkInfo;
  GraphQLClient qlClient;

  SpaceXRemoteDataSourceImpl({required this.networkInfo, required this.qlClient});

  @override
  Future<Either<AppStates, SpaceXModel>> getSpaceX() async  {
    if (await networkInfo.isConnected) {
      try {
        QueryResult queryResult = await qlClient.query(QueryOptions(
            fetchPolicy: FetchPolicy.noCache,
            document: gql(
                """
            query Query {
             company {
             ceo
             cto
             name
             summary
             valuation
             }
            }
              """
            )));
        if(queryResult.hasException) {
          return const Left(AppStates.error);
        }
        if(queryResult.data == null) {
          return const Left(AppStates.error);
        }
        final data = SpaceXModel.fromJson(queryResult.data!);
        return Right(data);
      } catch (e) {
        return const Left(AppStates.error);
      }
    } else {
      return const Left(AppStates.networkError);
    }
  }
}
