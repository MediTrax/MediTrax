import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meditrax/env.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "graphql.g.dart";

final String apiUrl = environment['apiUrl']!;

@riverpod
class GraphQLService extends _$GraphQLService {
  @override
  GraphQLClient build() {
    final HttpLink httpLink = HttpLink(
      "$apiUrl/graphql",
    );
    final AuthLink authLink = AuthLink(
      getToken: () => ref.read(appStateProvider).bearerToken,
    );

    // final WebSocketLink websocketLink = WebSocketLink(
    //   '$websocketsUrl/graphql',
    //   config: SocketClientConfig(
    //     autoReconnect: true,
    //     inactivityTimeout: const Duration(seconds: 30),
    //     headers: {'Authorization': ref.read(appStateProvider).bearerToken},
    //     initialPayload: () =>
    //         {'Authorization': ref.read(appStateProvider).bearerToken},
    //   ),
    // );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(
          // store: HiveStore(),
          ),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    );
  }
}
