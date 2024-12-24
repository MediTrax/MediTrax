import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Variables$Mutation$CreateUser {
  factory Variables$Mutation$CreateUser({
    required String phoneNumber,
    required String password,
    required String username,
    required String role,
  }) =>
      Variables$Mutation$CreateUser._({
        r'phoneNumber': phoneNumber,
        r'password': password,
        r'username': username,
        r'role': role,
      });

  Variables$Mutation$CreateUser._(this._$data);

  factory Variables$Mutation$CreateUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    final l$username = data['username'];
    result$data['username'] = (l$username as String);
    final l$role = data['role'];
    result$data['role'] = (l$role as String);
    return Variables$Mutation$CreateUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get password => (_$data['password'] as String);

  String get username => (_$data['username'] as String);

  String get role => (_$data['role'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    final l$password = password;
    result$data['password'] = l$password;
    final l$username = username;
    result$data['username'] = l$username;
    final l$role = role;
    result$data['role'] = l$role;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateUser<Variables$Mutation$CreateUser>
      get copyWith => CopyWith$Variables$Mutation$CreateUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    final l$password = password;
    final l$username = username;
    final l$role = role;
    return Object.hashAll([
      l$phoneNumber,
      l$password,
      l$username,
      l$role,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateUser<TRes> {
  factory CopyWith$Variables$Mutation$CreateUser(
    Variables$Mutation$CreateUser instance,
    TRes Function(Variables$Mutation$CreateUser) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateUser;

  factory CopyWith$Variables$Mutation$CreateUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateUser;

  TRes call({
    String? phoneNumber,
    String? password,
    String? username,
    String? role,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateUser<TRes>
    implements CopyWith$Variables$Mutation$CreateUser<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateUser _instance;

  final TRes Function(Variables$Mutation$CreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phoneNumber = _undefined,
    Object? password = _undefined,
    Object? username = _undefined,
    Object? role = _undefined,
  }) =>
      _then(Variables$Mutation$CreateUser._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
        if (password != _undefined && password != null)
          'password': (password as String),
        if (username != _undefined && username != null)
          'username': (username as String),
        if (role != _undefined && role != null) 'role': (role as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateUser<TRes>
    implements CopyWith$Variables$Mutation$CreateUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateUser(this._res);

  TRes _res;

  call({
    String? phoneNumber,
    String? password,
    String? username,
    String? role,
  }) =>
      _res;
}

class Mutation$CreateUser {
  Mutation$CreateUser({
    this.createUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateUser.fromJson(Map<String, dynamic> json) {
    final l$createUser = json['createUser'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateUser(
      createUser: l$createUser == null
          ? null
          : Mutation$CreateUser$createUser.fromJson(
              (l$createUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateUser$createUser? createUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createUser = createUser;
    _resultData['createUser'] = l$createUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createUser = createUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createUser = createUser;
    final lOther$createUser = other.createUser;
    if (l$createUser != lOther$createUser) {
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

extension UtilityExtension$Mutation$CreateUser on Mutation$CreateUser {
  CopyWith$Mutation$CreateUser<Mutation$CreateUser> get copyWith =>
      CopyWith$Mutation$CreateUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateUser<TRes> {
  factory CopyWith$Mutation$CreateUser(
    Mutation$CreateUser instance,
    TRes Function(Mutation$CreateUser) then,
  ) = _CopyWithImpl$Mutation$CreateUser;

  factory CopyWith$Mutation$CreateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateUser;

  TRes call({
    Mutation$CreateUser$createUser? createUser,
    String? $__typename,
  });
  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser;
}

class _CopyWithImpl$Mutation$CreateUser<TRes>
    implements CopyWith$Mutation$CreateUser<TRes> {
  _CopyWithImpl$Mutation$CreateUser(
    this._instance,
    this._then,
  );

  final Mutation$CreateUser _instance;

  final TRes Function(Mutation$CreateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateUser(
        createUser: createUser == _undefined
            ? _instance.createUser
            : (createUser as Mutation$CreateUser$createUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser {
    final local$createUser = _instance.createUser;
    return local$createUser == null
        ? CopyWith$Mutation$CreateUser$createUser.stub(_then(_instance))
        : CopyWith$Mutation$CreateUser$createUser(
            local$createUser, (e) => call(createUser: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateUser<TRes>
    implements CopyWith$Mutation$CreateUser<TRes> {
  _CopyWithStubImpl$Mutation$CreateUser(this._res);

  TRes _res;

  call({
    Mutation$CreateUser$createUser? createUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateUser$createUser<TRes> get createUser =>
      CopyWith$Mutation$CreateUser$createUser.stub(_res);
}

const documentNodeMutationCreateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
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
        variable: VariableNode(name: NameNode(value: 'username')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'role')),
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
        name: NameNode(value: 'createUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'phoneNumber'),
            value: VariableNode(name: NameNode(value: 'phoneNumber')),
          ),
          ArgumentNode(
            name: NameNode(value: 'password'),
            value: VariableNode(name: NameNode(value: 'password')),
          ),
          ArgumentNode(
            name: NameNode(value: 'username'),
            value: VariableNode(name: NameNode(value: 'username')),
          ),
          ArgumentNode(
            name: NameNode(value: 'role'),
            value: VariableNode(name: NameNode(value: 'role')),
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
            name: NameNode(value: 'message'),
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
Mutation$CreateUser _parserFn$Mutation$CreateUser(Map<String, dynamic> data) =>
    Mutation$CreateUser.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateUser?,
);

class Options$Mutation$CreateUser
    extends graphql.MutationOptions<Mutation$CreateUser> {
  Options$Mutation$CreateUser({
    String? operationName,
    required Variables$Mutation$CreateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateUser>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateUser,
          parserFn: _parserFn$Mutation$CreateUser,
        );

  final OnMutationCompleted$Mutation$CreateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateUser
    extends graphql.WatchQueryOptions<Mutation$CreateUser> {
  WatchOptions$Mutation$CreateUser({
    String? operationName,
    required Variables$Mutation$CreateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
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
          document: documentNodeMutationCreateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateUser,
        );
}

extension ClientExtension$Mutation$CreateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateUser>> mutate$CreateUser(
          Options$Mutation$CreateUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateUser> watchMutation$CreateUser(
          WatchOptions$Mutation$CreateUser options) =>
      this.watchMutation(options);
}

class Mutation$CreateUser$HookResult {
  Mutation$CreateUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateUser runMutation;

  final graphql.QueryResult<Mutation$CreateUser> result;
}

Mutation$CreateUser$HookResult useMutation$CreateUser(
    [WidgetOptions$Mutation$CreateUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateUser());
  return Mutation$CreateUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateUser> useWatchMutation$CreateUser(
        WatchOptions$Mutation$CreateUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateUser
    extends graphql.MutationOptions<Mutation$CreateUser> {
  WidgetOptions$Mutation$CreateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateUser>? update,
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
                    data == null ? null : _parserFn$Mutation$CreateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateUser,
          parserFn: _parserFn$Mutation$CreateUser,
        );

  final OnMutationCompleted$Mutation$CreateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateUser
    = graphql.MultiSourceResult<Mutation$CreateUser> Function(
  Variables$Mutation$CreateUser, {
  Object? optimisticResult,
  Mutation$CreateUser? typedOptimisticResult,
});
typedef Builder$Mutation$CreateUser = widgets.Widget Function(
  RunMutation$Mutation$CreateUser,
  graphql.QueryResult<Mutation$CreateUser>?,
);

class Mutation$CreateUser$Widget
    extends graphql_flutter.Mutation<Mutation$CreateUser> {
  Mutation$CreateUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateUser? options,
    required Builder$Mutation$CreateUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateUser(),
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

class Mutation$CreateUser$createUser {
  Mutation$CreateUser$createUser({
    required this.userId,
    required this.message,
    this.$__typename = 'CreateUserResponse',
  });

  factory Mutation$CreateUser$createUser.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateUser$createUser(
      userId: (l$userId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateUser$createUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$CreateUser$createUser
    on Mutation$CreateUser$createUser {
  CopyWith$Mutation$CreateUser$createUser<Mutation$CreateUser$createUser>
      get copyWith => CopyWith$Mutation$CreateUser$createUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateUser$createUser<TRes> {
  factory CopyWith$Mutation$CreateUser$createUser(
    Mutation$CreateUser$createUser instance,
    TRes Function(Mutation$CreateUser$createUser) then,
  ) = _CopyWithImpl$Mutation$CreateUser$createUser;

  factory CopyWith$Mutation$CreateUser$createUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateUser$createUser;

  TRes call({
    String? userId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateUser$createUser<TRes>
    implements CopyWith$Mutation$CreateUser$createUser<TRes> {
  _CopyWithImpl$Mutation$CreateUser$createUser(
    this._instance,
    this._then,
  );

  final Mutation$CreateUser$createUser _instance;

  final TRes Function(Mutation$CreateUser$createUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateUser$createUser(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateUser$createUser<TRes>
    implements CopyWith$Mutation$CreateUser$createUser<TRes> {
  _CopyWithStubImpl$Mutation$CreateUser$createUser(this._res);

  TRes _res;

  call({
    String? userId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$LoginUser {
  factory Variables$Mutation$LoginUser({
    required String phoneNumber,
    required String password,
  }) =>
      Variables$Mutation$LoginUser._({
        r'phoneNumber': phoneNumber,
        r'password': password,
      });

  Variables$Mutation$LoginUser._(this._$data);

  factory Variables$Mutation$LoginUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Variables$Mutation$LoginUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
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
    if (other is! Variables$Mutation$LoginUser ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
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
    final l$phoneNumber = phoneNumber;
    final l$password = password;
    return Object.hashAll([
      l$phoneNumber,
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
    String? phoneNumber,
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
    Object? phoneNumber = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Variables$Mutation$LoginUser._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
        if (password != _undefined && password != null)
          'password': (password as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$LoginUser<TRes>
    implements CopyWith$Variables$Mutation$LoginUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginUser(this._res);

  TRes _res;

  call({
    String? phoneNumber,
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
    if (other is! Mutation$LoginUser || runtimeType != other.runtimeType) {
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
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
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
            name: NameNode(value: 'phoneNumber'),
            value: VariableNode(name: NameNode(value: 'phoneNumber')),
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
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
                name: NameNode(value: 'device'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updatedAt'),
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
            name: NameNode(value: 'message'),
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
    required this.message,
    this.$__typename = 'LoginUserResponse',
  });

  factory Mutation$LoginUser$loginUser.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$token = json['token'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUser$loginUser(
      userId: (l$userId as String),
      token: Mutation$LoginUser$loginUser$token.fromJson(
          (l$token as Map<String, dynamic>)),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final Mutation$LoginUser$loginUser$token token;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$token = token;
    _resultData['token'] = l$token.toJson();
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$token = token;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$token,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginUser$loginUser ||
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
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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
    String? message,
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
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUser$loginUser(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as Mutation$LoginUser$loginUser$token),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
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
    String? message,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginUser$loginUser$token<TRes> get token =>
      CopyWith$Mutation$LoginUser$loginUser$token.stub(_res);
}

class Mutation$LoginUser$loginUser$token {
  Mutation$LoginUser$loginUser$token({
    required this.id,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    required this.device,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Token',
  });

  factory Mutation$LoginUser$loginUser$token.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$device = json['device'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUser$loginUser$token(
      id: (l$id as String),
      user: (l$user as String),
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: dateTimeFromJson(l$accessTokenExpiry),
      refreshTokenExpiry: dateTimeFromJson(l$refreshTokenExpiry),
      device: (l$device as String),
      createdAt: dateTimeFromJson(l$createdAt),
      updatedAt: dateTimeFromJson(l$updatedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String user;

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String device;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user;
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    _resultData['accessTokenExpiry'] = dateTimeToJson(l$accessTokenExpiry);
    final l$refreshTokenExpiry = refreshTokenExpiry;
    _resultData['refreshTokenExpiry'] = dateTimeToJson(l$refreshTokenExpiry);
    final l$device = device;
    _resultData['device'] = l$device;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = dateTimeToJson(l$updatedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$device = device;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$accessToken,
      l$refreshToken,
      l$accessTokenExpiry,
      l$refreshTokenExpiry,
      l$device,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginUser$loginUser$token ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$device = device;
    final lOther$device = other.device;
    if (l$device != lOther$device) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    Object? id = _undefined,
    Object? user = _undefined,
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? device = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUser$loginUser$token(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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
        device: device == _undefined || device == null
            ? _instance.device
            : (device as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
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
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RequestOTP {
  factory Variables$Mutation$RequestOTP({required String phoneNumber}) =>
      Variables$Mutation$RequestOTP._({
        r'phoneNumber': phoneNumber,
      });

  Variables$Mutation$RequestOTP._(this._$data);

  factory Variables$Mutation$RequestOTP.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    return Variables$Mutation$RequestOTP._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    return result$data;
  }

  CopyWith$Variables$Mutation$RequestOTP<Variables$Mutation$RequestOTP>
      get copyWith => CopyWith$Variables$Mutation$RequestOTP(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RequestOTP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    return Object.hashAll([l$phoneNumber]);
  }
}

abstract class CopyWith$Variables$Mutation$RequestOTP<TRes> {
  factory CopyWith$Variables$Mutation$RequestOTP(
    Variables$Mutation$RequestOTP instance,
    TRes Function(Variables$Mutation$RequestOTP) then,
  ) = _CopyWithImpl$Variables$Mutation$RequestOTP;

  factory CopyWith$Variables$Mutation$RequestOTP.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RequestOTP;

  TRes call({String? phoneNumber});
}

class _CopyWithImpl$Variables$Mutation$RequestOTP<TRes>
    implements CopyWith$Variables$Mutation$RequestOTP<TRes> {
  _CopyWithImpl$Variables$Mutation$RequestOTP(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RequestOTP _instance;

  final TRes Function(Variables$Mutation$RequestOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? phoneNumber = _undefined}) =>
      _then(Variables$Mutation$RequestOTP._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RequestOTP<TRes>
    implements CopyWith$Variables$Mutation$RequestOTP<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RequestOTP(this._res);

  TRes _res;

  call({String? phoneNumber}) => _res;
}

class Mutation$RequestOTP {
  Mutation$RequestOTP({
    this.requestOTP,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RequestOTP.fromJson(Map<String, dynamic> json) {
    final l$requestOTP = json['requestOTP'];
    final l$$__typename = json['__typename'];
    return Mutation$RequestOTP(
      requestOTP: l$requestOTP == null
          ? null
          : Mutation$RequestOTP$requestOTP.fromJson(
              (l$requestOTP as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RequestOTP$requestOTP? requestOTP;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestOTP = requestOTP;
    _resultData['requestOTP'] = l$requestOTP?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestOTP = requestOTP;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$requestOTP,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RequestOTP || runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestOTP = requestOTP;
    final lOther$requestOTP = other.requestOTP;
    if (l$requestOTP != lOther$requestOTP) {
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

extension UtilityExtension$Mutation$RequestOTP on Mutation$RequestOTP {
  CopyWith$Mutation$RequestOTP<Mutation$RequestOTP> get copyWith =>
      CopyWith$Mutation$RequestOTP(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$RequestOTP<TRes> {
  factory CopyWith$Mutation$RequestOTP(
    Mutation$RequestOTP instance,
    TRes Function(Mutation$RequestOTP) then,
  ) = _CopyWithImpl$Mutation$RequestOTP;

  factory CopyWith$Mutation$RequestOTP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RequestOTP;

  TRes call({
    Mutation$RequestOTP$requestOTP? requestOTP,
    String? $__typename,
  });
  CopyWith$Mutation$RequestOTP$requestOTP<TRes> get requestOTP;
}

class _CopyWithImpl$Mutation$RequestOTP<TRes>
    implements CopyWith$Mutation$RequestOTP<TRes> {
  _CopyWithImpl$Mutation$RequestOTP(
    this._instance,
    this._then,
  );

  final Mutation$RequestOTP _instance;

  final TRes Function(Mutation$RequestOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestOTP = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RequestOTP(
        requestOTP: requestOTP == _undefined
            ? _instance.requestOTP
            : (requestOTP as Mutation$RequestOTP$requestOTP?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RequestOTP$requestOTP<TRes> get requestOTP {
    final local$requestOTP = _instance.requestOTP;
    return local$requestOTP == null
        ? CopyWith$Mutation$RequestOTP$requestOTP.stub(_then(_instance))
        : CopyWith$Mutation$RequestOTP$requestOTP(
            local$requestOTP, (e) => call(requestOTP: e));
  }
}

class _CopyWithStubImpl$Mutation$RequestOTP<TRes>
    implements CopyWith$Mutation$RequestOTP<TRes> {
  _CopyWithStubImpl$Mutation$RequestOTP(this._res);

  TRes _res;

  call({
    Mutation$RequestOTP$requestOTP? requestOTP,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$RequestOTP$requestOTP<TRes> get requestOTP =>
      CopyWith$Mutation$RequestOTP$requestOTP.stub(_res);
}

const documentNodeMutationRequestOTP = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RequestOTP'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'requestOTP'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'phoneNumber'),
            value: VariableNode(name: NameNode(value: 'phoneNumber')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'message'),
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
Mutation$RequestOTP _parserFn$Mutation$RequestOTP(Map<String, dynamic> data) =>
    Mutation$RequestOTP.fromJson(data);
typedef OnMutationCompleted$Mutation$RequestOTP = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$RequestOTP?,
);

class Options$Mutation$RequestOTP
    extends graphql.MutationOptions<Mutation$RequestOTP> {
  Options$Mutation$RequestOTP({
    String? operationName,
    required Variables$Mutation$RequestOTP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestOTP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RequestOTP? onCompleted,
    graphql.OnMutationUpdate<Mutation$RequestOTP>? update,
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
                    data == null ? null : _parserFn$Mutation$RequestOTP(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRequestOTP,
          parserFn: _parserFn$Mutation$RequestOTP,
        );

  final OnMutationCompleted$Mutation$RequestOTP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RequestOTP
    extends graphql.WatchQueryOptions<Mutation$RequestOTP> {
  WatchOptions$Mutation$RequestOTP({
    String? operationName,
    required Variables$Mutation$RequestOTP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestOTP? typedOptimisticResult,
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
          document: documentNodeMutationRequestOTP,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RequestOTP,
        );
}

extension ClientExtension$Mutation$RequestOTP on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RequestOTP>> mutate$RequestOTP(
          Options$Mutation$RequestOTP options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$RequestOTP> watchMutation$RequestOTP(
          WatchOptions$Mutation$RequestOTP options) =>
      this.watchMutation(options);
}

class Mutation$RequestOTP$HookResult {
  Mutation$RequestOTP$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$RequestOTP runMutation;

  final graphql.QueryResult<Mutation$RequestOTP> result;
}

Mutation$RequestOTP$HookResult useMutation$RequestOTP(
    [WidgetOptions$Mutation$RequestOTP? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RequestOTP());
  return Mutation$RequestOTP$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RequestOTP> useWatchMutation$RequestOTP(
        WatchOptions$Mutation$RequestOTP options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RequestOTP
    extends graphql.MutationOptions<Mutation$RequestOTP> {
  WidgetOptions$Mutation$RequestOTP({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestOTP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RequestOTP? onCompleted,
    graphql.OnMutationUpdate<Mutation$RequestOTP>? update,
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
                    data == null ? null : _parserFn$Mutation$RequestOTP(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRequestOTP,
          parserFn: _parserFn$Mutation$RequestOTP,
        );

  final OnMutationCompleted$Mutation$RequestOTP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$RequestOTP
    = graphql.MultiSourceResult<Mutation$RequestOTP> Function(
  Variables$Mutation$RequestOTP, {
  Object? optimisticResult,
  Mutation$RequestOTP? typedOptimisticResult,
});
typedef Builder$Mutation$RequestOTP = widgets.Widget Function(
  RunMutation$Mutation$RequestOTP,
  graphql.QueryResult<Mutation$RequestOTP>?,
);

class Mutation$RequestOTP$Widget
    extends graphql_flutter.Mutation<Mutation$RequestOTP> {
  Mutation$RequestOTP$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RequestOTP? options,
    required Builder$Mutation$RequestOTP builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$RequestOTP(),
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

class Mutation$RequestOTP$requestOTP {
  Mutation$RequestOTP$requestOTP({
    required this.message,
    this.$__typename = 'RequestOTPResponse',
  });

  factory Mutation$RequestOTP$requestOTP.fromJson(Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$RequestOTP$requestOTP(
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RequestOTP$requestOTP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$RequestOTP$requestOTP
    on Mutation$RequestOTP$requestOTP {
  CopyWith$Mutation$RequestOTP$requestOTP<Mutation$RequestOTP$requestOTP>
      get copyWith => CopyWith$Mutation$RequestOTP$requestOTP(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RequestOTP$requestOTP<TRes> {
  factory CopyWith$Mutation$RequestOTP$requestOTP(
    Mutation$RequestOTP$requestOTP instance,
    TRes Function(Mutation$RequestOTP$requestOTP) then,
  ) = _CopyWithImpl$Mutation$RequestOTP$requestOTP;

  factory CopyWith$Mutation$RequestOTP$requestOTP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RequestOTP$requestOTP;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RequestOTP$requestOTP<TRes>
    implements CopyWith$Mutation$RequestOTP$requestOTP<TRes> {
  _CopyWithImpl$Mutation$RequestOTP$requestOTP(
    this._instance,
    this._then,
  );

  final Mutation$RequestOTP$requestOTP _instance;

  final TRes Function(Mutation$RequestOTP$requestOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RequestOTP$requestOTP(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RequestOTP$requestOTP<TRes>
    implements CopyWith$Mutation$RequestOTP$requestOTP<TRes> {
  _CopyWithStubImpl$Mutation$RequestOTP$requestOTP(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$LoginUserWithOTP {
  factory Variables$Mutation$LoginUserWithOTP({
    required String phoneNumber,
    required String otpCode,
  }) =>
      Variables$Mutation$LoginUserWithOTP._({
        r'phoneNumber': phoneNumber,
        r'otpCode': otpCode,
      });

  Variables$Mutation$LoginUserWithOTP._(this._$data);

  factory Variables$Mutation$LoginUserWithOTP.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$otpCode = data['otpCode'];
    result$data['otpCode'] = (l$otpCode as String);
    return Variables$Mutation$LoginUserWithOTP._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get otpCode => (_$data['otpCode'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    final l$otpCode = otpCode;
    result$data['otpCode'] = l$otpCode;
    return result$data;
  }

  CopyWith$Variables$Mutation$LoginUserWithOTP<
          Variables$Mutation$LoginUserWithOTP>
      get copyWith => CopyWith$Variables$Mutation$LoginUserWithOTP(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$LoginUserWithOTP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$otpCode = otpCode;
    final lOther$otpCode = other.otpCode;
    if (l$otpCode != lOther$otpCode) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    final l$otpCode = otpCode;
    return Object.hashAll([
      l$phoneNumber,
      l$otpCode,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$LoginUserWithOTP<TRes> {
  factory CopyWith$Variables$Mutation$LoginUserWithOTP(
    Variables$Mutation$LoginUserWithOTP instance,
    TRes Function(Variables$Mutation$LoginUserWithOTP) then,
  ) = _CopyWithImpl$Variables$Mutation$LoginUserWithOTP;

  factory CopyWith$Variables$Mutation$LoginUserWithOTP.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$LoginUserWithOTP;

  TRes call({
    String? phoneNumber,
    String? otpCode,
  });
}

class _CopyWithImpl$Variables$Mutation$LoginUserWithOTP<TRes>
    implements CopyWith$Variables$Mutation$LoginUserWithOTP<TRes> {
  _CopyWithImpl$Variables$Mutation$LoginUserWithOTP(
    this._instance,
    this._then,
  );

  final Variables$Mutation$LoginUserWithOTP _instance;

  final TRes Function(Variables$Mutation$LoginUserWithOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phoneNumber = _undefined,
    Object? otpCode = _undefined,
  }) =>
      _then(Variables$Mutation$LoginUserWithOTP._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
        if (otpCode != _undefined && otpCode != null)
          'otpCode': (otpCode as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$LoginUserWithOTP<TRes>
    implements CopyWith$Variables$Mutation$LoginUserWithOTP<TRes> {
  _CopyWithStubImpl$Variables$Mutation$LoginUserWithOTP(this._res);

  TRes _res;

  call({
    String? phoneNumber,
    String? otpCode,
  }) =>
      _res;
}

class Mutation$LoginUserWithOTP {
  Mutation$LoginUserWithOTP({
    this.loginUserWithOTP,
    this.$__typename = 'Mutation',
  });

  factory Mutation$LoginUserWithOTP.fromJson(Map<String, dynamic> json) {
    final l$loginUserWithOTP = json['loginUserWithOTP'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUserWithOTP(
      loginUserWithOTP: l$loginUserWithOTP == null
          ? null
          : Mutation$LoginUserWithOTP$loginUserWithOTP.fromJson(
              (l$loginUserWithOTP as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$LoginUserWithOTP$loginUserWithOTP? loginUserWithOTP;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$loginUserWithOTP = loginUserWithOTP;
    _resultData['loginUserWithOTP'] = l$loginUserWithOTP?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$loginUserWithOTP = loginUserWithOTP;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$loginUserWithOTP,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginUserWithOTP ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$loginUserWithOTP = loginUserWithOTP;
    final lOther$loginUserWithOTP = other.loginUserWithOTP;
    if (l$loginUserWithOTP != lOther$loginUserWithOTP) {
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

extension UtilityExtension$Mutation$LoginUserWithOTP
    on Mutation$LoginUserWithOTP {
  CopyWith$Mutation$LoginUserWithOTP<Mutation$LoginUserWithOTP> get copyWith =>
      CopyWith$Mutation$LoginUserWithOTP(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$LoginUserWithOTP<TRes> {
  factory CopyWith$Mutation$LoginUserWithOTP(
    Mutation$LoginUserWithOTP instance,
    TRes Function(Mutation$LoginUserWithOTP) then,
  ) = _CopyWithImpl$Mutation$LoginUserWithOTP;

  factory CopyWith$Mutation$LoginUserWithOTP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginUserWithOTP;

  TRes call({
    Mutation$LoginUserWithOTP$loginUserWithOTP? loginUserWithOTP,
    String? $__typename,
  });
  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes>
      get loginUserWithOTP;
}

class _CopyWithImpl$Mutation$LoginUserWithOTP<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP<TRes> {
  _CopyWithImpl$Mutation$LoginUserWithOTP(
    this._instance,
    this._then,
  );

  final Mutation$LoginUserWithOTP _instance;

  final TRes Function(Mutation$LoginUserWithOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? loginUserWithOTP = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUserWithOTP(
        loginUserWithOTP: loginUserWithOTP == _undefined
            ? _instance.loginUserWithOTP
            : (loginUserWithOTP as Mutation$LoginUserWithOTP$loginUserWithOTP?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes>
      get loginUserWithOTP {
    final local$loginUserWithOTP = _instance.loginUserWithOTP;
    return local$loginUserWithOTP == null
        ? CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP.stub(
            _then(_instance))
        : CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP(
            local$loginUserWithOTP, (e) => call(loginUserWithOTP: e));
  }
}

class _CopyWithStubImpl$Mutation$LoginUserWithOTP<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP<TRes> {
  _CopyWithStubImpl$Mutation$LoginUserWithOTP(this._res);

  TRes _res;

  call({
    Mutation$LoginUserWithOTP$loginUserWithOTP? loginUserWithOTP,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes>
      get loginUserWithOTP =>
          CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP.stub(_res);
}

const documentNodeMutationLoginUserWithOTP = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'LoginUserWithOTP'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'otpCode')),
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
        name: NameNode(value: 'loginUserWithOTP'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'phoneNumber'),
            value: VariableNode(name: NameNode(value: 'phoneNumber')),
          ),
          ArgumentNode(
            name: NameNode(value: 'otpCode'),
            value: VariableNode(name: NameNode(value: 'otpCode')),
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
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
                name: NameNode(value: 'device'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updatedAt'),
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
            name: NameNode(value: 'message'),
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
Mutation$LoginUserWithOTP _parserFn$Mutation$LoginUserWithOTP(
        Map<String, dynamic> data) =>
    Mutation$LoginUserWithOTP.fromJson(data);
typedef OnMutationCompleted$Mutation$LoginUserWithOTP = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$LoginUserWithOTP?,
);

class Options$Mutation$LoginUserWithOTP
    extends graphql.MutationOptions<Mutation$LoginUserWithOTP> {
  Options$Mutation$LoginUserWithOTP({
    String? operationName,
    required Variables$Mutation$LoginUserWithOTP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUserWithOTP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginUserWithOTP? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginUserWithOTP>? update,
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
                        : _parserFn$Mutation$LoginUserWithOTP(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginUserWithOTP,
          parserFn: _parserFn$Mutation$LoginUserWithOTP,
        );

  final OnMutationCompleted$Mutation$LoginUserWithOTP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$LoginUserWithOTP
    extends graphql.WatchQueryOptions<Mutation$LoginUserWithOTP> {
  WatchOptions$Mutation$LoginUserWithOTP({
    String? operationName,
    required Variables$Mutation$LoginUserWithOTP variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUserWithOTP? typedOptimisticResult,
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
          document: documentNodeMutationLoginUserWithOTP,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$LoginUserWithOTP,
        );
}

extension ClientExtension$Mutation$LoginUserWithOTP on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$LoginUserWithOTP>>
      mutate$LoginUserWithOTP(
              Options$Mutation$LoginUserWithOTP options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$LoginUserWithOTP>
      watchMutation$LoginUserWithOTP(
              WatchOptions$Mutation$LoginUserWithOTP options) =>
          this.watchMutation(options);
}

class Mutation$LoginUserWithOTP$HookResult {
  Mutation$LoginUserWithOTP$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$LoginUserWithOTP runMutation;

  final graphql.QueryResult<Mutation$LoginUserWithOTP> result;
}

Mutation$LoginUserWithOTP$HookResult useMutation$LoginUserWithOTP(
    [WidgetOptions$Mutation$LoginUserWithOTP? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$LoginUserWithOTP());
  return Mutation$LoginUserWithOTP$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$LoginUserWithOTP>
    useWatchMutation$LoginUserWithOTP(
            WatchOptions$Mutation$LoginUserWithOTP options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$LoginUserWithOTP
    extends graphql.MutationOptions<Mutation$LoginUserWithOTP> {
  WidgetOptions$Mutation$LoginUserWithOTP({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$LoginUserWithOTP? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$LoginUserWithOTP? onCompleted,
    graphql.OnMutationUpdate<Mutation$LoginUserWithOTP>? update,
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
                        : _parserFn$Mutation$LoginUserWithOTP(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationLoginUserWithOTP,
          parserFn: _parserFn$Mutation$LoginUserWithOTP,
        );

  final OnMutationCompleted$Mutation$LoginUserWithOTP? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$LoginUserWithOTP
    = graphql.MultiSourceResult<Mutation$LoginUserWithOTP> Function(
  Variables$Mutation$LoginUserWithOTP, {
  Object? optimisticResult,
  Mutation$LoginUserWithOTP? typedOptimisticResult,
});
typedef Builder$Mutation$LoginUserWithOTP = widgets.Widget Function(
  RunMutation$Mutation$LoginUserWithOTP,
  graphql.QueryResult<Mutation$LoginUserWithOTP>?,
);

class Mutation$LoginUserWithOTP$Widget
    extends graphql_flutter.Mutation<Mutation$LoginUserWithOTP> {
  Mutation$LoginUserWithOTP$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$LoginUserWithOTP? options,
    required Builder$Mutation$LoginUserWithOTP builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$LoginUserWithOTP(),
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

class Mutation$LoginUserWithOTP$loginUserWithOTP {
  Mutation$LoginUserWithOTP$loginUserWithOTP({
    required this.userId,
    required this.token,
    required this.message,
    this.$__typename = 'LoginUserResponse',
  });

  factory Mutation$LoginUserWithOTP$loginUserWithOTP.fromJson(
      Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$token = json['token'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUserWithOTP$loginUserWithOTP(
      userId: (l$userId as String),
      token: Mutation$LoginUserWithOTP$loginUserWithOTP$token.fromJson(
          (l$token as Map<String, dynamic>)),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final Mutation$LoginUserWithOTP$loginUserWithOTP$token token;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$token = token;
    _resultData['token'] = l$token.toJson();
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$token = token;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$token,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginUserWithOTP$loginUserWithOTP ||
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
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$LoginUserWithOTP$loginUserWithOTP
    on Mutation$LoginUserWithOTP$loginUserWithOTP {
  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<
          Mutation$LoginUserWithOTP$loginUserWithOTP>
      get copyWith => CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes> {
  factory CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP(
    Mutation$LoginUserWithOTP$loginUserWithOTP instance,
    TRes Function(Mutation$LoginUserWithOTP$loginUserWithOTP) then,
  ) = _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP;

  factory CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP.stub(TRes res) =
      _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP;

  TRes call({
    String? userId,
    Mutation$LoginUserWithOTP$loginUserWithOTP$token? token,
    String? message,
    String? $__typename,
  });
  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> get token;
}

class _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes> {
  _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP(
    this._instance,
    this._then,
  );

  final Mutation$LoginUserWithOTP$loginUserWithOTP _instance;

  final TRes Function(Mutation$LoginUserWithOTP$loginUserWithOTP) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? token = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUserWithOTP$loginUserWithOTP(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        token: token == _undefined || token == null
            ? _instance.token
            : (token as Mutation$LoginUserWithOTP$loginUserWithOTP$token),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> get token {
    final local$token = _instance.token;
    return CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token(
        local$token, (e) => call(token: e));
  }
}

class _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP<TRes> {
  _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP(this._res);

  TRes _res;

  call({
    String? userId,
    Mutation$LoginUserWithOTP$loginUserWithOTP$token? token,
    String? message,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> get token =>
      CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token.stub(_res);
}

class Mutation$LoginUserWithOTP$loginUserWithOTP$token {
  Mutation$LoginUserWithOTP$loginUserWithOTP$token({
    required this.id,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    required this.device,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Token',
  });

  factory Mutation$LoginUserWithOTP$loginUserWithOTP$token.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$device = json['device'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$LoginUserWithOTP$loginUserWithOTP$token(
      id: (l$id as String),
      user: (l$user as String),
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: dateTimeFromJson(l$accessTokenExpiry),
      refreshTokenExpiry: dateTimeFromJson(l$refreshTokenExpiry),
      device: (l$device as String),
      createdAt: dateTimeFromJson(l$createdAt),
      updatedAt: dateTimeFromJson(l$updatedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String user;

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String device;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user;
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    _resultData['accessTokenExpiry'] = dateTimeToJson(l$accessTokenExpiry);
    final l$refreshTokenExpiry = refreshTokenExpiry;
    _resultData['refreshTokenExpiry'] = dateTimeToJson(l$refreshTokenExpiry);
    final l$device = device;
    _resultData['device'] = l$device;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = dateTimeToJson(l$updatedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$device = device;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$accessToken,
      l$refreshToken,
      l$accessTokenExpiry,
      l$refreshTokenExpiry,
      l$device,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$LoginUserWithOTP$loginUserWithOTP$token ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$device = device;
    final lOther$device = other.device;
    if (l$device != lOther$device) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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

extension UtilityExtension$Mutation$LoginUserWithOTP$loginUserWithOTP$token
    on Mutation$LoginUserWithOTP$loginUserWithOTP$token {
  CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<
          Mutation$LoginUserWithOTP$loginUserWithOTP$token>
      get copyWith => CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> {
  factory CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token(
    Mutation$LoginUserWithOTP$loginUserWithOTP$token instance,
    TRes Function(Mutation$LoginUserWithOTP$loginUserWithOTP$token) then,
  ) = _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token;

  factory CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token;

  TRes call({
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> {
  _CopyWithImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token(
    this._instance,
    this._then,
  );

  final Mutation$LoginUserWithOTP$loginUserWithOTP$token _instance;

  final TRes Function(Mutation$LoginUserWithOTP$loginUserWithOTP$token) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? device = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$LoginUserWithOTP$loginUserWithOTP$token(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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
        device: device == _undefined || device == null
            ? _instance.device
            : (device as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes>
    implements CopyWith$Mutation$LoginUserWithOTP$loginUserWithOTP$token<TRes> {
  _CopyWithStubImpl$Mutation$LoginUserWithOTP$loginUserWithOTP$token(this._res);

  TRes _res;

  call({
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    if (other is! Variables$Mutation$RefreshToken ||
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
    if (other is! Mutation$RefreshToken || runtimeType != other.runtimeType) {
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
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
            name: NameNode(value: 'device'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
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
    required this.id,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry,
    required this.device,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Token',
  });

  factory Mutation$RefreshToken$refreshToken.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$user = json['user'];
    final l$accessToken = json['accessToken'];
    final l$refreshToken = json['refreshToken'];
    final l$accessTokenExpiry = json['accessTokenExpiry'];
    final l$refreshTokenExpiry = json['refreshTokenExpiry'];
    final l$device = json['device'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$RefreshToken$refreshToken(
      id: (l$id as String),
      user: (l$user as String),
      accessToken: (l$accessToken as String),
      refreshToken: (l$refreshToken as String),
      accessTokenExpiry: dateTimeFromJson(l$accessTokenExpiry),
      refreshTokenExpiry: dateTimeFromJson(l$refreshTokenExpiry),
      device: (l$device as String),
      createdAt: dateTimeFromJson(l$createdAt),
      updatedAt: dateTimeFromJson(l$updatedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String user;

  final String accessToken;

  final String refreshToken;

  final DateTime accessTokenExpiry;

  final DateTime refreshTokenExpiry;

  final String device;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$user = user;
    _resultData['user'] = l$user;
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$refreshToken = refreshToken;
    _resultData['refreshToken'] = l$refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    _resultData['accessTokenExpiry'] = dateTimeToJson(l$accessTokenExpiry);
    final l$refreshTokenExpiry = refreshTokenExpiry;
    _resultData['refreshTokenExpiry'] = dateTimeToJson(l$refreshTokenExpiry);
    final l$device = device;
    _resultData['device'] = l$device;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = dateTimeToJson(l$updatedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$accessToken = accessToken;
    final l$refreshToken = refreshToken;
    final l$accessTokenExpiry = accessTokenExpiry;
    final l$refreshTokenExpiry = refreshTokenExpiry;
    final l$device = device;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$user,
      l$accessToken,
      l$refreshToken,
      l$accessTokenExpiry,
      l$refreshTokenExpiry,
      l$device,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RefreshToken$refreshToken ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$device = device;
    final lOther$device = other.device;
    if (l$device != lOther$device) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
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
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    Object? id = _undefined,
    Object? user = _undefined,
    Object? accessToken = _undefined,
    Object? refreshToken = _undefined,
    Object? accessTokenExpiry = _undefined,
    Object? refreshTokenExpiry = _undefined,
    Object? device = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RefreshToken$refreshToken(
        id: id == _undefined || id == null ? _instance.id : (id as String),
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
        device: device == _undefined || device == null
            ? _instance.device
            : (device as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as DateTime),
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
    String? id,
    String? user,
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiry,
    DateTime? refreshTokenExpiry,
    String? device,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) =>
      _res;
}
