import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$LoginWithEmailPassword {
  factory Variables$Mutation$LoginWithEmailPassword({
    required String email,
    required String password,
    required String token,
  }) =>
      Variables$Mutation$LoginWithEmailPassword._({
        r'email': email,
        r'password': password,
        r'token': token,
      });

  Variables$Mutation$LoginWithEmailPassword._(this._$data);

  factory Variables$Mutation$LoginWithEmailPassword.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    return Variables$Mutation$LoginWithEmailPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  String get token => (_$data['token'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    final l$token = token;
    result$data['token'] = l$token;
    return result$data;
  }

  CopyWith$Variables$Mutation$LoginWithEmailPassword<
          Variables$Mutation$LoginWithEmailPassword>
      get copyWith => CopyWith$Variables$Mutation$LoginWithEmailPassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$LoginWithEmailPassword) ||
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
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    final l$token = token;
    return Object.hashAll([
      l$email,
      l$password,
      l$token,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$LoginWithEmailPassword<TRes> {
  factory CopyWith$Variables$Mutation$LoginWithEmailPassword(
    Variables$Mutation$LoginWithEmailPassword instance,
    TRes Function(Variables$Mutation$LoginWithEmailPassword) then,
  ) = _CopyWithImpl$Variables$Mutation$LoginWithEmailPassword;

  factory CopyWith$Variables$Mutation$LoginWithEmailPassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LoginWithEmailPassword;

  TRes call({
    String? email,
    String? password,
    String? token,
  });
}

class _CopyWithImpl$Variables$Mutation$LoginWithEmailPassword<TRes>
    implements CopyWith$Variables$Mutation$LoginWithEmailPassword<TRes> {
  _CopyWithImpl$Variables$Mutation$LoginWithEmailPassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LoginWithEmailPassword _instance;

  final TRes Function(Variables$Mutation$LoginWithEmailPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? password = _undefined,
    Object? token = _undefined,
  }) =>
      _then(Variables$Mutation$LoginWithEmailPassword._({
        ..._instance._$data,
        if (email != _undefined && email != null) 'email': (email as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (token != _undefined && token != null) 'token': (token as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$LoginWithEmailPassword<TRes>
    implements CopyWith$Variables$Mutation$LoginWithEmailPassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginWithEmailPassword(this._res);

  TRes _res;

  call({
    String? email,
    String? password,
    String? token,
  }) =>
      _res;
}

class Mutation$LoginWithEmailPassword {
  Mutation$LoginWithEmailPassword({
    required this.loginWithEmailPassword,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LoginWithEmailPassword.fromJson(Map<String, dynamic> json) {
    final l$loginWithEmailPassword = json['loginWithEmailPassword'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginWithEmailPassword(
      loginWithEmailPassword:
          Mutation$LoginWithEmailPassword$loginWithEmailPassword.fromJson(
              (l$loginWithEmailPassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$LoginWithEmailPassword$loginWithEmailPassword
      loginWithEmailPassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$loginWithEmailPassword = loginWithEmailPassword;
    _resultData['loginWithEmailPassword'] = l$loginWithEmailPassword.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$loginWithEmailPassword = loginWithEmailPassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loginWithEmailPassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$LoginWithEmailPassword) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$loginWithEmailPassword = loginWithEmailPassword;
    final lOther$loginWithEmailPassword = other.loginWithEmailPassword;
    if (l$loginWithEmailPassword != lOther$loginWithEmailPassword) {
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

extension UtilityExtension$Mutation$LoginWithEmailPassword
    on Mutation$LoginWithEmailPassword {
  CopyWith$Mutation$LoginWithEmailPassword<Mutation$LoginWithEmailPassword>
      get copyWith => CopyWith$Mutation$LoginWithEmailPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginWithEmailPassword<TRes> {
  factory CopyWith$Mutation$LoginWithEmailPassword(
    Mutation$LoginWithEmailPassword instance,
    TRes Function(Mutation$LoginWithEmailPassword) then,
  ) = _CopyWithImpl$Mutation$LoginWithEmailPassword;

  factory CopyWith$Mutation$LoginWithEmailPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginWithEmailPassword;

  TRes call({
    Mutation$LoginWithEmailPassword$loginWithEmailPassword?
        loginWithEmailPassword,
    String? $__typename,
  });
  CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes>
      get loginWithEmailPassword;
}

class _CopyWithImpl$Mutation$LoginWithEmailPassword<TRes>
    implements CopyWith$Mutation$LoginWithEmailPassword<TRes> {
  _CopyWithImpl$Mutation$LoginWithEmailPassword(
    this._instance,
    this._then,
  );

  final Mutation$LoginWithEmailPassword _instance;

  final TRes Function(Mutation$LoginWithEmailPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? loginWithEmailPassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginWithEmailPassword(
        loginWithEmailPassword: loginWithEmailPassword == _undefined ||
                loginWithEmailPassword == null
            ? _instance.loginWithEmailPassword
            : (loginWithEmailPassword
                as Mutation$LoginWithEmailPassword$loginWithEmailPassword),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes>
      get loginWithEmailPassword {
    final local$loginWithEmailPassword = _instance.loginWithEmailPassword;
    return CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword(
        local$loginWithEmailPassword, (e) => call(loginWithEmailPassword: e));
  }
}

class _CopyWithStubImpl$Mutation$LoginWithEmailPassword<TRes>
    implements CopyWith$Mutation$LoginWithEmailPassword<TRes> {
  _CopyWithStubImpl$Mutation$LoginWithEmailPassword(this._res);

  TRes _res;

  call({
    Mutation$LoginWithEmailPassword$loginWithEmailPassword?
        loginWithEmailPassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes>
      get loginWithEmailPassword =>
          CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword.stub(
              _res);
}

const documentNodeMutationLoginWithEmailPassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LoginWithEmailPassword'),
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
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
        name: NameNode(value: 'loginWithEmailPassword'),
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
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
Mutation$LoginWithEmailPassword _parserFn$Mutation$LoginWithEmailPassword(
        Map<String, dynamic> data) =>
    Mutation$LoginWithEmailPassword.fromJson(data);
typedef OnMutationCompleted$Mutation$LoginWithEmailPassword = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$LoginWithEmailPassword?,
);

class Options$Mutation$LoginWithEmailPassword
    extends graphql.MutationOptions<Mutation$LoginWithEmailPassword> {
  Options$Mutation$LoginWithEmailPassword({
    String? operationName,
    required Variables$Mutation$LoginWithEmailPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginWithEmailPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginWithEmailPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginWithEmailPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$LoginWithEmailPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginWithEmailPassword,
          parserFn: _parserFn$Mutation$LoginWithEmailPassword,
        );

  final OnMutationCompleted$Mutation$LoginWithEmailPassword?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LoginWithEmailPassword
    extends graphql.WatchQueryOptions<Mutation$LoginWithEmailPassword> {
  WatchOptions$Mutation$LoginWithEmailPassword({
    String? operationName,
    required Variables$Mutation$LoginWithEmailPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginWithEmailPassword? typedOptimisticResult,
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
          document: documentNodeMutationLoginWithEmailPassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LoginWithEmailPassword,
        );
}

extension ClientExtension$Mutation$LoginWithEmailPassword
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LoginWithEmailPassword>>
      mutate$LoginWithEmailPassword(
              Options$Mutation$LoginWithEmailPassword options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$LoginWithEmailPassword>
      watchMutation$LoginWithEmailPassword(
              WatchOptions$Mutation$LoginWithEmailPassword options) =>
          this.watchMutation(options);
}

class Mutation$LoginWithEmailPassword$HookResult {
  Mutation$LoginWithEmailPassword$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LoginWithEmailPassword runMutation;

  final graphql.QueryResult<Mutation$LoginWithEmailPassword> result;
}

Mutation$LoginWithEmailPassword$HookResult useMutation$LoginWithEmailPassword(
    [WidgetOptions$Mutation$LoginWithEmailPassword? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LoginWithEmailPassword());
  return Mutation$LoginWithEmailPassword$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LoginWithEmailPassword>
    useWatchMutation$LoginWithEmailPassword(
            WatchOptions$Mutation$LoginWithEmailPassword options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LoginWithEmailPassword
    extends graphql.MutationOptions<Mutation$LoginWithEmailPassword> {
  WidgetOptions$Mutation$LoginWithEmailPassword({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginWithEmailPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginWithEmailPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginWithEmailPassword>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$LoginWithEmailPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginWithEmailPassword,
          parserFn: _parserFn$Mutation$LoginWithEmailPassword,
        );

  final OnMutationCompleted$Mutation$LoginWithEmailPassword?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LoginWithEmailPassword
    = graphql.MultiSourceResult<Mutation$LoginWithEmailPassword> Function(
  Variables$Mutation$LoginWithEmailPassword, {
  Object? optimisticResult,
  Mutation$LoginWithEmailPassword? typedOptimisticResult,
});
typedef Builder$Mutation$LoginWithEmailPassword = widgets.Widget Function(
  RunMutation$Mutation$LoginWithEmailPassword,
  graphql.QueryResult<Mutation$LoginWithEmailPassword>?,
);

class Mutation$LoginWithEmailPassword$Widget
    extends graphql_flutter.Mutation<Mutation$LoginWithEmailPassword> {
  Mutation$LoginWithEmailPassword$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LoginWithEmailPassword? options,
    required Builder$Mutation$LoginWithEmailPassword builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LoginWithEmailPassword(),
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

class Mutation$LoginWithEmailPassword$loginWithEmailPassword {
  Mutation$LoginWithEmailPassword$loginWithEmailPassword({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    this.$__typename = 'Token',
  });

  factory Mutation$LoginWithEmailPassword$loginWithEmailPassword.fromJson(
      Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginWithEmailPassword$loginWithEmailPassword(
      user: (l$user as String),
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: DateTime.parse((l$accessTokenExpiry as String)),
      refreshTokenExpiry: DateTime.parse((l$refreshTokenExpiry as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String user;

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user;
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
    final l$user = user;
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user,
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
    if (!(other is Mutation$LoginWithEmailPassword$loginWithEmailPassword) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Mutation$LoginWithEmailPassword$loginWithEmailPassword
    on Mutation$LoginWithEmailPassword$loginWithEmailPassword {
  CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<
          Mutation$LoginWithEmailPassword$loginWithEmailPassword>
      get copyWith =>
          CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<
    TRes> {
  factory CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword(
    Mutation$LoginWithEmailPassword$loginWithEmailPassword instance,
    TRes Function(Mutation$LoginWithEmailPassword$loginWithEmailPassword) then,
  ) = _CopyWithImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword;

  factory CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword;

  TRes call({
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes>
    implements
        CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes> {
  _CopyWithImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword(
    this._instance,
    this._then,
  );

  final Mutation$LoginWithEmailPassword$loginWithEmailPassword _instance;

  final TRes Function(Mutation$LoginWithEmailPassword$loginWithEmailPassword)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginWithEmailPassword$loginWithEmailPassword(
        user: user == _undefined || user == null
            ? _instance.user
            : (user as String),
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

class _CopyWithStubImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword<
        TRes>
    implements
        CopyWith$Mutation$LoginWithEmailPassword$loginWithEmailPassword<TRes> {
  _CopyWithStubImpl$Mutation$LoginWithEmailPassword$loginWithEmailPassword(
      this._res);

  TRes _res;

  call({
    String? user,
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
    required this.refreshToken,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RefreshToken.fromJson(Map<String, dynamic> json) {
    final l$refreshToken = json['refreshToken'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken(
      refreshToken: Mutation$RefreshToken$refreshToken.fromJson(
          (l$refreshToken as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RefreshToken$refreshToken refreshToken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken.toJson();
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
        refreshToken: refreshToken == _undefined || refreshToken == null
            ? _instance.refreshToken
            : (refreshToken as Mutation$RefreshToken$refreshToken),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RefreshToken$refreshToken<TRes> get refreshToken {
    final local$refreshToken = _instance.refreshToken;
    return CopyWith$Mutation$RefreshToken$refreshToken(
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
