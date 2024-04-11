import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String HTTP_LINK = "http://115.178.65.180:8080/graphql";

final HttpLink httpLink = HttpLink(
  HTTP_LINK,
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  ),
);
