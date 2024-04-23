import 'package:graphql_flutter/graphql_flutter.dart';

FetchMoreOptions morefetchOption({
  Map<String, dynamic>? varialbeData,
}) {
  return FetchMoreOptions(
    variables: varialbeData ?? {},
    updateQuery: (previousResultData, fetchMoreResultData) {
      return fetchMoreResultData;
    },
  );
}
