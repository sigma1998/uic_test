import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uic_test/app/app_constants.dart';

class GraphService {
  static getCountryGraphClient() {
    HttpLink httpLink = HttpLink(AppConstants.countryBaseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
    return qlClient;
  }

  static getSpaceXGraphClient() {
    HttpLink httpLink = HttpLink(AppConstants.spaceXBaseUrl);
    GraphQLClient qlClient = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
    return qlClient;
  }
}
