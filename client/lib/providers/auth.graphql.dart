import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$LoginUser {
  factory Variables$Mutation$LoginUser({
    required String email,
    required String password,
  }) =>
      Variables$Mutation$LoginUser._({
        r'email': email,
        r'password': password,
      });

  Variables$Mutation$LoginUser._(this._$data);

  factory Variables$Mutation$LoginUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Variables$Mutation$LoginUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Variables$Mutation$LoginUser<Variables$Mutation$LoginUser>
      get copyWith => CopyWith$Variables$Mutation$LoginUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$LoginUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([
      l$email,
      l$password,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$LoginUser<TRes> {
  factory CopyWith$Variables$Mutation$LoginUser(
    Variables$Mutation$LoginUser instance,
    TRes Function(Variables$Mutation$LoginUser) then,
  ) = _CopyWithImpl$Variables$Mutation$LoginUser;

  factory CopyWith$Variables$Mutation$LoginUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LoginUser;

  TRes call({
    String? email,
    String? password,
  });
}

class _CopyWithImpl$Variables$Mutation$LoginUser<TRes>
    implements CopyWith$Variables$Mutation$LoginUser<TRes> {
  _CopyWithImpl$Variables$Mutation$LoginUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LoginUser _instance;

  final TRes Function(Variables$Mutation$LoginUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Variables$Mutation$LoginUser._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$LoginUser<TRes>
    implements CopyWith$Variables$Mutation$LoginUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginUser(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
  }) =>
      _res;
}

class Mutation$LoginUser {
  Mutation$LoginUser({
    this.loginUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LoginUser.fromJson(Map<String, dynamic> json) {
    final l$loginUser = json['loginUser'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUser(
      loginUser: l$loginUser == null
          ? null
          : Mutation$LoginUser$loginUser.fromJson(
              (l$loginUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$LoginUser$loginUser? loginUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$loginUser = loginUser;
    _resultData['loginUser'] = l$loginUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$loginUser = loginUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loginUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$LoginUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$loginUser = loginUser;
    final lOther$loginUser = other.loginUser;
    if (l$loginUser != lOther$loginUser) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$LoginUser on Mutation$LoginUser {
  CopyWith$Mutation$LoginUser<Mutation$LoginUser> get copyWith =>
      CopyWith$Mutation$LoginUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LoginUser<TRes> {
  factory CopyWith$Mutation$LoginUser(
    Mutation$LoginUser instance,
    TRes Function(Mutation$LoginUser) then,
  ) = _CopyWithImpl$Mutation$LoginUser;

  factory CopyWith$Mutation$LoginUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginUser;

  TRes call({
    Mutation$LoginUser$loginUser? loginUser,
    String? $__typename,
  });
  CopyWith$Mutation$LoginUser$loginUser<TRes> get loginUser;
}

class _CopyWithImpl$Mutation$LoginUser<TRes>
    implements CopyWith$Mutation$LoginUser<TRes> {
  _CopyWithImpl$Mutation$LoginUser(
    this._instance,
    this._then,
  );

  final Mutation$LoginUser _instance;

  final TRes Function(Mutation$LoginUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? loginUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUser(
        loginUser: loginUser == _undefined
            ? _instance.loginUser
            : (loginUser as Mutation$LoginUser$loginUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$LoginUser$loginUser<TRes> get loginUser {
    final local$loginUser = _instance.loginUser;
    return local$loginUser == null
        ? CopyWith$Mutation$LoginUser$loginUser.stub(_then(_instance))
        : CopyWith$Mutation$LoginUser$loginUser(
            local$loginUser, (e) => call(loginUser: e));
  }
}

class _CopyWithStubImpl$Mutation$LoginUser<TRes>
    implements CopyWith$Mutation$LoginUser<TRes> {
  _CopyWithStubImpl$Mutation$LoginUser(this._res);

  TRes _res;

  call({
    Mutation$LoginUser$loginUser? loginUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginUser$loginUser<TRes> get loginUser =>
      CopyWith$Mutation$LoginUser$loginUser.stub(_res);
}

const documentNodeMutationLoginUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LoginUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'loginUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'userId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'accessToken'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'refreshToken'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'accessTokenExpiry'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'refreshTokenExpiry'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$LoginUser _parserFn$Mutation$LoginUser(Map<String, dynamic> data) =>
    Mutation$LoginUser.fromJson(data);
typedef OnMutationCompleted$Mutation$LoginUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LoginUser?,
);

class Options$Mutation$LoginUser
    extends graphql.MutationOptions<Mutation$LoginUser> {
  Options$Mutation$LoginUser({
    String? operationName,
    required Variables$Mutation$LoginUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$LoginUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginUser,
          parserFn: _parserFn$Mutation$LoginUser,
        );

  final OnMutationCompleted$Mutation$LoginUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LoginUser
    extends graphql.WatchQueryOptions<Mutation$LoginUser> {
  WatchOptions$Mutation$LoginUser({
    String? operationName,
    required Variables$Mutation$LoginUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationLoginUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LoginUser,
        );
}

extension ClientExtension$Mutation$LoginUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LoginUser>> mutate$LoginUser(
          Options$Mutation$LoginUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$LoginUser> watchMutation$LoginUser(
          WatchOptions$Mutation$LoginUser options) =>
      this.watchMutation(options);
}

class Mutation$LoginUser$HookResult {
  Mutation$LoginUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LoginUser runMutation;

  final graphql.QueryResult<Mutation$LoginUser> result;
}

Mutation$LoginUser$HookResult useMutation$LoginUser(
    [WidgetOptions$Mutation$LoginUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LoginUser());
  return Mutation$LoginUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LoginUser> useWatchMutation$LoginUser(
        WatchOptions$Mutation$LoginUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LoginUser
    extends graphql.MutationOptions<Mutation$LoginUser> {
  WidgetOptions$Mutation$LoginUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$LoginUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginUser,
          parserFn: _parserFn$Mutation$LoginUser,
        );

  final OnMutationCompleted$Mutation$LoginUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LoginUser
    = graphql.MultiSourceResult<Mutation$LoginUser> Function(
  Variables$Mutation$LoginUser, {
  Object? optimisticResult,
  Mutation$LoginUser? typedOptimisticResult,
});
typedef Builder$Mutation$LoginUser = widgets.Widget Function(
  RunMutation$Mutation$LoginUser,
  graphql.QueryResult<Mutation$LoginUser>?,
);

class Mutation$LoginUser$Widget
    extends graphql_flutter.Mutation<Mutation$LoginUser> {
  Mutation$LoginUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LoginUser? options,
    required Builder$Mutation$LoginUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LoginUser(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$LoginUser$loginUser {
  Mutation$LoginUser$loginUser({
    required this.userId,
    required this.token,
    this.$__typename = 'LoginUserResponse',
  });

  factory Mutation$LoginUser$loginUser.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$token = json['token'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUser$loginUser(
      userId: (l$userId as String),
      token: Mutation$LoginUser$loginUser$token.fromJson(
          (l$token as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final Mutation$LoginUser$loginUser$token token;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$token = token;
    _resultData['token'] = l$token.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$token = token;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$token,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$LoginUser$loginUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$LoginUser$loginUser
    on Mutation$LoginUser$loginUser {
  CopyWith$Mutation$LoginUser$loginUser<Mutation$LoginUser$loginUser>
      get copyWith => CopyWith$Mutation$LoginUser$loginUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginUser$loginUser<TRes> {
  factory CopyWith$Mutation$LoginUser$loginUser(
    Mutation$LoginUser$loginUser instance,
    TRes Function(Mutation$LoginUser$loginUser) then,
  ) = _CopyWithImpl$Mutation$LoginUser$loginUser;

  factory CopyWith$Mutation$LoginUser$loginUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginUser$loginUser;

  TRes call({
    String? userId,
    Mutation$LoginUser$loginUser$token? token,
    String? $__typename,
  });
  CopyWith$Mutation$LoginUser$loginUser$token<TRes> get token;
}

class _CopyWithImpl$Mutation$LoginUser$loginUser<TRes>
    implements CopyWith$Mutation$LoginUser$loginUser<TRes> {
  _CopyWithImpl$Mutation$LoginUser$loginUser(
    this._instance,
    this._then,
  );

  final Mutation$LoginUser$loginUser _instance;

  final TRes Function(Mutation$LoginUser$loginUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? token = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUser$loginUser(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as Mutation$LoginUser$loginUser$token),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$LoginUser$loginUser$token<TRes> get token {
    final local$token = _instance.token;
    return CopyWith$Mutation$LoginUser$loginUser$token(
        local$token, (e) => call(token: e));
  }
}

class _CopyWithStubImpl$Mutation$LoginUser$loginUser<TRes>
    implements CopyWith$Mutation$LoginUser$loginUser<TRes> {
  _CopyWithStubImpl$Mutation$LoginUser$loginUser(this._res);

  TRes _res;

  call({
    String? userId,
    Mutation$LoginUser$loginUser$token? token,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginUser$loginUser$token<TRes> get token =>
      CopyWith$Mutation$LoginUser$loginUser$token.stub(_res);
}

class Mutation$LoginUser$loginUser$token {
  Mutation$LoginUser$loginUser$token({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    this.$__typename = 'Token',
  });

  factory Mutation$LoginUser$loginUser$token.fromJson(
      Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUser$loginUser$token(
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: DateTime.parse((l$accessTokenExpiry as String)),
      refreshTokenExpiry: DateTime.parse((l$refreshTokenExpiry as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    _resultData['accessTokenExpiry'] = l$accessTokenExpiry.toIso8601String();
    final l$refreshTokenExpiry = refreshTokenExpiry;
    _resultData['refreshTokenExpiry'] = l$refreshTokenExpiry.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accessToken,
      l$refreshToken,
      l$accessTokenExpiry,
      l$refreshTokenExpiry,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$LoginUser$loginUser$token) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$accessTokenExpiry = accessTokenExpiry;
    final lOther$accessTokenExpiry = other.accessTokenExpiry;
    if (l$accessTokenExpiry != lOther$accessTokenExpiry) {
      return false;
    }
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final lOther$refreshTokenExpiry = other.refreshTokenExpiry;
    if (l$refreshTokenExpiry != lOther$refreshTokenExpiry) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$LoginUser$loginUser$token
    on Mutation$LoginUser$loginUser$token {
  CopyWith$Mutation$LoginUser$loginUser$token<
          Mutation$LoginUser$loginUser$token>
      get copyWith => CopyWith$Mutation$LoginUser$loginUser$token(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginUser$loginUser$token<TRes> {
  factory CopyWith$Mutation$LoginUser$loginUser$token(
    Mutation$LoginUser$loginUser$token instance,
    TRes Function(Mutation$LoginUser$loginUser$token) then,
  ) = _CopyWithImpl$Mutation$LoginUser$loginUser$token;

  factory CopyWith$Mutation$LoginUser$loginUser$token.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginUser$loginUser$token;

  TRes call({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LoginUser$loginUser$token<TRes>
    implements CopyWith$Mutation$LoginUser$loginUser$token<TRes> {
  _CopyWithImpl$Mutation$LoginUser$loginUser$token(
    this._instance,
    this._then,
  );

  final Mutation$LoginUser$loginUser$token _instance;

  final TRes Function(Mutation$LoginUser$loginUser$token) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUser$loginUser$token(
        accessToken: accessToken == _undefined || accessToken == null
            ? _instance.accessToken
            : (accessToken as String),
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as String),
        accessTokenExpiry:
            accessTokenExpiry == _undefined || accessTokenExpiry == null
                ? _instance.accessTokenExpiry
                : (accessTokenExpiry as DateTime),
        refreshTokenExpiry:
            refreshTokenExpiry == _undefined || refreshTokenExpiry == null
                ? _instance.refreshTokenExpiry
                : (refreshTokenExpiry as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$LoginUser$loginUser$token<TRes>
    implements CopyWith$Mutation$LoginUser$loginUser$token<TRes> {
  _CopyWithStubImpl$Mutation$LoginUser$loginUser$token(this._res);

  TRes _res;

  call({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RefreshToken {
  factory Variables$Mutation$RefreshToken({
    required String accessToken,
    required String refreshToken,
    required String device,
  }) =>
      Variables$Mutation$RefreshToken._({
        r'accessToken': accessToken,
        r'refreshToken': refreshToken,
        r'device': device,
      });

  Variables$Mutation$RefreshToken._(this._$data);

  factory Variables$Mutation$RefreshToken.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$accessToken = data['accessToken'];
    result$data['accessToken'] = (l$accessToken as String);
    final l$refreshToken = data['refreshToken'];
    result$data['refreshToken'] = (l$refreshToken as String);
    final l$device = data['device'];
    result$data['device'] = (l$device as String);
    return Variables$Mutation$RefreshToken._(result$data);
  }

  Map<String, dynamic> _$data;

  String get accessToken => (_$data['accessToken'] as String);

  String get refreshToken => (_$data['refreshToken'] as String);

  String get device => (_$data['device'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$accessToken = accessToken;
    result$data['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    result$data['refreshToken'] = l$refreshToken;
    final l$device = device;
    result$data['device'] = l$device;
    return result$data;
  }

  CopyWith$Variables$Mutation$RefreshToken<Variables$Mutation$RefreshToken>
      get copyWith => CopyWith$Variables$Mutation$RefreshToken(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$RefreshToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$device = device;
    final lOther$device = other.device;
    if (l$device != lOther$device) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$device = device;
    return Object.hashAll([
      l$accessToken,
      l$refreshToken,
      l$device,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$RefreshToken<TRes> {
  factory CopyWith$Variables$Mutation$RefreshToken(
    Variables$Mutation$RefreshToken instance,
    TRes Function(Variables$Mutation$RefreshToken) then,
  ) = _CopyWithImpl$Variables$Mutation$RefreshToken;

  factory CopyWith$Variables$Mutation$RefreshToken.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RefreshToken;

  TRes call({
    String? accessToken,
    String? refreshToken,
    String? device,
  });
}

class _CopyWithImpl$Variables$Mutation$RefreshToken<TRes>
    implements CopyWith$Variables$Mutation$RefreshToken<TRes> {
  _CopyWithImpl$Variables$Mutation$RefreshToken(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RefreshToken _instance;

  final TRes Function(Variables$Mutation$RefreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? device = _undefined,
  }) =>
      _then(Variables$Mutation$RefreshToken._({
        ..._instance._$data,
        if (accessToken != _undefined && accessToken != null)
          'accessToken': (accessToken as String),
        if (refreshToken != _undefined && refreshToken != null)
          'refreshToken': (refreshToken as String),
        if (device != _undefined && device != null)
          'device': (device as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RefreshToken<TRes>
    implements CopyWith$Variables$Mutation$RefreshToken<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RefreshToken(this._res);

  TRes _res;

  call({
    String? accessToken,
    String? refreshToken,
    String? device,
  }) =>
      _res;
}

class Mutation$RefreshToken {
  Mutation$RefreshToken({
    this.refreshToken,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RefreshToken.fromJson(Map<String, dynamic> json) {
    final l$refreshToken = json['refreshToken'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken(
      refreshToken: l$refreshToken == null
          ? null
          : Mutation$RefreshToken$refreshToken.fromJson(
              (l$refreshToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RefreshToken$refreshToken? refreshToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$refreshToken = refreshToken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$refreshToken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RefreshToken) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$RefreshToken on Mutation$RefreshToken {
  CopyWith$Mutation$RefreshToken<Mutation$RefreshToken> get copyWith =>
      CopyWith$Mutation$RefreshToken(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RefreshToken<TRes> {
  factory CopyWith$Mutation$RefreshToken(
    Mutation$RefreshToken instance,
    TRes Function(Mutation$RefreshToken) then,
  ) = _CopyWithImpl$Mutation$RefreshToken;

  factory CopyWith$Mutation$RefreshToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RefreshToken;

  TRes call({
    Mutation$RefreshToken$refreshToken? refreshToken,
    String? $__typename,
  });
  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken;
}

class _CopyWithImpl$Mutation$RefreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken<TRes> {
  _CopyWithImpl$Mutation$RefreshToken(
    this._instance,
    this._then,
  );

  final Mutation$RefreshToken _instance;

  final TRes Function(Mutation$RefreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? refreshToken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RefreshToken(
        refreshToken: refreshToken == _undefined
            ? _instance.refreshToken
            : (refreshToken as Mutation$RefreshToken$refreshToken?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken {
    final local$refreshToken = _instance.refreshToken;
    return local$refreshToken == null
        ? CopyWith$Mutation$RefreshToken$refreshToken.stub(_then(_instance))
        : CopyWith$Mutation$RefreshToken$refreshToken(
            local$refreshToken, (e) => call(refreshToken: e));
  }
}

class _CopyWithStubImpl$Mutation$RefreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken<TRes> {
  _CopyWithStubImpl$Mutation$RefreshToken(this._res);

  TRes _res;

  call({
    Mutation$RefreshToken$refreshToken? refreshToken,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken =>
      CopyWith$Mutation$RefreshToken$refreshToken.stub(_res);
}

const documentNodeMutationRefreshToken = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RefreshToken'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'accessToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'refreshToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'device')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'refreshToken'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'accessToken'),
            value: VariableNode(name: NameNode(value: 'accessToken')),
          ),
          ArgumentNode(
            name: NameNode(value: 'refreshToken'),
            value: VariableNode(name: NameNode(value: 'refreshToken')),
          ),
          ArgumentNode(
            name: NameNode(value: 'device'),
            value: VariableNode(name: NameNode(value: 'device')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'accessToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accessTokenExpiry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'refreshTokenExpiry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Mutation$RefreshToken _parserFn$Mutation$RefreshToken(
        Map<String, dynamic> data) =>
    Mutation$RefreshToken.fromJson(data);
typedef OnMutationCompleted$Mutation$RefreshToken = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RefreshToken?,
);

class Options$Mutation$RefreshToken
    extends graphql.MutationOptions<Mutation$RefreshToken> {
  Options$Mutation$RefreshToken({
    String? operationName,
    required Variables$Mutation$RefreshToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RefreshToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$RefreshToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$RefreshToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRefreshToken,
          parserFn: _parserFn$Mutation$RefreshToken,
        );

  final OnMutationCompleted$Mutation$RefreshToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RefreshToken
    extends graphql.WatchQueryOptions<Mutation$RefreshToken> {
  WatchOptions$Mutation$RefreshToken({
    String? operationName,
    required Variables$Mutation$RefreshToken variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationRefreshToken,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RefreshToken,
        );
}

extension ClientExtension$Mutation$RefreshToken on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RefreshToken>> mutate$RefreshToken(
          Options$Mutation$RefreshToken options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RefreshToken> watchMutation$RefreshToken(
          WatchOptions$Mutation$RefreshToken options) =>
      this.watchMutation(options);
}

class Mutation$RefreshToken$HookResult {
  Mutation$RefreshToken$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$RefreshToken runMutation;

  final graphql.QueryResult<Mutation$RefreshToken> result;
}

Mutation$RefreshToken$HookResult useMutation$RefreshToken(
    [WidgetOptions$Mutation$RefreshToken? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RefreshToken());
  return Mutation$RefreshToken$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RefreshToken> useWatchMutation$RefreshToken(
        WatchOptions$Mutation$RefreshToken options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RefreshToken
    extends graphql.MutationOptions<Mutation$RefreshToken> {
  WidgetOptions$Mutation$RefreshToken({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RefreshToken? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RefreshToken? onCompleted,
    graphql.OnMutationUpdate<Mutation$RefreshToken>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$RefreshToken(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRefreshToken,
          parserFn: _parserFn$Mutation$RefreshToken,
        );

  final OnMutationCompleted$Mutation$RefreshToken? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$RefreshToken
    = graphql.MultiSourceResult<Mutation$RefreshToken> Function(
  Variables$Mutation$RefreshToken, {
  Object? optimisticResult,
  Mutation$RefreshToken? typedOptimisticResult,
});
typedef Builder$Mutation$RefreshToken = widgets.Widget Function(
  RunMutation$Mutation$RefreshToken,
  graphql.QueryResult<Mutation$RefreshToken>?,
);

class Mutation$RefreshToken$Widget
    extends graphql_flutter.Mutation<Mutation$RefreshToken> {
  Mutation$RefreshToken$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RefreshToken? options,
    required Builder$Mutation$RefreshToken builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$RefreshToken(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$RefreshToken$refreshToken {
  Mutation$RefreshToken$refreshToken({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    this.$__typename = 'Token',
  });

  factory Mutation$RefreshToken$refreshToken.fromJson(
      Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken$refreshToken(
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: DateTime.parse((l$accessTokenExpiry as String)),
      refreshTokenExpiry: DateTime.parse((l$refreshTokenExpiry as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    _resultData['accessTokenExpiry'] = l$accessTokenExpiry.toIso8601String();
    final l$refreshTokenExpiry = refreshTokenExpiry;
    _resultData['refreshTokenExpiry'] = l$refreshTokenExpiry.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$accessToken,
      l$refreshToken,
      l$accessTokenExpiry,
      l$refreshTokenExpiry,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RefreshToken$refreshToken) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
      return false;
    }
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) {
      return false;
    }
    final l$accessTokenExpiry = accessTokenExpiry;
    final lOther$accessTokenExpiry = other.accessTokenExpiry;
    if (l$accessTokenExpiry != lOther$accessTokenExpiry) {
      return false;
    }
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final lOther$refreshTokenExpiry = other.refreshTokenExpiry;
    if (l$refreshTokenExpiry != lOther$refreshTokenExpiry) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$RefreshToken$refreshToken
    on Mutation$RefreshToken$refreshToken {
  CopyWith$Mutation$RefreshToken$refreshToken<
          Mutation$RefreshToken$refreshToken>
      get copyWith => CopyWith$Mutation$RefreshToken$refreshToken(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  factory CopyWith$Mutation$RefreshToken$refreshToken(
    Mutation$RefreshToken$refreshToken instance,
    TRes Function(Mutation$RefreshToken$refreshToken) then,
  ) = _CopyWithImpl$Mutation$RefreshToken$refreshToken;

  factory CopyWith$Mutation$RefreshToken$refreshToken.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RefreshToken$refreshToken;

  TRes call({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RefreshToken$refreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  _CopyWithImpl$Mutation$RefreshToken$refreshToken(
    this._instance,
    this._then,
  );

  final Mutation$RefreshToken$refreshToken _instance;

  final TRes Function(Mutation$RefreshToken$refreshToken) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RefreshToken$refreshToken(
        accessToken: accessToken == _undefined || accessToken == null
            ? _instance.accessToken
            : (accessToken as String),
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as String),
        accessTokenExpiry:
            accessTokenExpiry == _undefined || accessTokenExpiry == null
                ? _instance.accessTokenExpiry
                : (accessTokenExpiry as DateTime),
        refreshTokenExpiry:
            refreshTokenExpiry == _undefined || refreshTokenExpiry == null
                ? _instance.refreshTokenExpiry
                : (refreshTokenExpiry as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RefreshToken$refreshToken<TRes>
    implements CopyWith$Mutation$RefreshToken$refreshToken<TRes> {
  _CopyWithStubImpl$Mutation$RefreshToken$refreshToken(this._res);

  TRes _res;

  call({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? $__typename,
  }) =>
      _res;
}
