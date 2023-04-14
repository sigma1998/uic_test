import 'package:either_dart/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uic_test/core/network/network_info.dart';
import 'package:uic_test/core/utils/states.dart';
import 'package:uic_test/features/counties/data/models/countries_model.dart';

abstract class CountriesRemoteDataSource {
  Future<Either<AppStates, CountriesModel>> getCountries(String countryCode);
}

class CountriesRemoteImpl extends CountriesRemoteDataSource {
  NetworkInfo networkInfo;
  GraphQLClient qlClient;

  CountriesRemoteImpl({required this.networkInfo, required this.qlClient});

  @override
  Future<Either<AppStates, CountriesModel>> getCountries(String code) async {
    if (await networkInfo.isConnected) {
      try {
        QueryResult queryResult = await qlClient.query(QueryOptions(
            variables: {'code': code},
            fetchPolicy: FetchPolicy.noCache,
            document: gql(
                """
             query Query(\$code:  ID!) {
             country (code: \$code){
             name
             native
             emoji
             currency
             languages {
             name
             native
               }
              }
             }
              """)));
        if(queryResult.hasException) {
          return const Left(AppStates.error);
        }
        if(queryResult.data == null) {
          return const Left(AppStates.error);
        }
        final data = CountriesModel.fromJson(queryResult.data!);
        return Right(data);
      } catch (e) {
        return const Left(AppStates.error);
      }
    } else {
      return const Left(AppStates.networkError);
    }
  }
}
