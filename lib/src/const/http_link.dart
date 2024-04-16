import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String HTTP_LINK = html.window.location.href.contains('localhost')
    ? "http://115.178.65.180:8080/graphql"
    : "api";

final HttpLink httpLink = HttpLink(
  HTTP_LINK,
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: GraphQLCache(),
    link: httpLink,
  ),
);
