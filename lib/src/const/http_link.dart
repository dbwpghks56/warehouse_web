import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String HTTP_LINK = "http://115.178.65.180:8080/graphql";

final HttpLink httpLink = HttpLink(
  HTTP_LINK,
  defaultHeaders: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "DELETE, POST, GET, OPTIONS",
    "Access-Control-Allow-Headers":
        "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
  },
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  ),
);
