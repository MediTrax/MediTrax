import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Query$GetUser {
  Query$GetUser({
    this.getUser,
    this.$__typename = 'Query',
  });

  factory Query$GetUser.fromJson(Map<String, dynamic> json) {
    final l$getUser = json['getUser'];
    final l$$__typename = json['__typename'];
    return Query$GetUser(
      getUser: l$getUser == null
          ? null
          : Query$GetUser$getUser.fromJson((l$getUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUser$getUser? getUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUser = getUser;
    _resultData['getUser'] = l$getUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUser = getUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUser = getUser;
    final lOther$getUser = other.getUser;
    if (l$getUser != lOther$getUser) {
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

extension UtilityExtension$Query$GetUser on Query$GetUser {
  CopyWith$Query$GetUser<Query$GetUser> get copyWith => CopyWith$Query$GetUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUser<TRes> {
  factory CopyWith$Query$GetUser(
    Query$GetUser instance,
    TRes Function(Query$GetUser) then,
  ) = _CopyWithImpl$Query$GetUser;

  factory CopyWith$Query$GetUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUser;

  TRes call({
    Query$GetUser$getUser? getUser,
    String? $__typename,
  });
  CopyWith$Query$GetUser$getUser<TRes> get getUser;
}

class _CopyWithImpl$Query$GetUser<TRes>
    implements CopyWith$Query$GetUser<TRes> {
  _CopyWithImpl$Query$GetUser(
    this._instance,
    this._then,
  );

  final Query$GetUser _instance;

  final TRes Function(Query$GetUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUser(
        getUser: getUser == _undefined
            ? _instance.getUser
            : (getUser as Query$GetUser$getUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetUser$getUser<TRes> get getUser {
    final local$getUser = _instance.getUser;
    return local$getUser == null
        ? CopyWith$Query$GetUser$getUser.stub(_then(_instance))
        : CopyWith$Query$GetUser$getUser(
            local$getUser, (e) => call(getUser: e));
  }
}

class _CopyWithStubImpl$Query$GetUser<TRes>
    implements CopyWith$Query$GetUser<TRes> {
  _CopyWithStubImpl$Query$GetUser(this._res);

  TRes _res;

  call({
    Query$GetUser$getUser? getUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetUser$getUser<TRes> get getUser =>
      CopyWith$Query$GetUser$getUser.stub(_res);
}

const documentNodeQueryGetUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUser'),
        alias: null,
        arguments: [],
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
            name: NameNode(value: 'phoneNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'role'),
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
            name: NameNode(value: 'lastLogin'),
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
Query$GetUser _parserFn$Query$GetUser(Map<String, dynamic> data) =>
    Query$GetUser.fromJson(data);
typedef OnQueryComplete$Query$GetUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUser?,
);

class Options$Query$GetUser extends graphql.QueryOptions<Query$GetUser> {
  Options$Query$GetUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUser? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUser? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetUser(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUser,
          parserFn: _parserFn$Query$GetUser,
        );

  final OnQueryComplete$Query$GetUser? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUser
    extends graphql.WatchQueryOptions<Query$GetUser> {
  WatchOptions$Query$GetUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUser,
        );
}

class FetchMoreOptions$Query$GetUser extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUser({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetUser,
        );
}

extension ClientExtension$Query$GetUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUser>> query$GetUser(
          [Options$Query$GetUser? options]) async =>
      await this.query(options ?? Options$Query$GetUser());
  graphql.ObservableQuery<Query$GetUser> watchQuery$GetUser(
          [WatchOptions$Query$GetUser? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetUser());
  void writeQuery$GetUser({
    required Query$GetUser data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetUser)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUser? readQuery$GetUser({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetUser)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUser.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUser> useQuery$GetUser(
        [Options$Query$GetUser? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetUser());
graphql.ObservableQuery<Query$GetUser> useWatchQuery$GetUser(
        [WatchOptions$Query$GetUser? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetUser());

class Query$GetUser$Widget extends graphql_flutter.Query<Query$GetUser> {
  Query$GetUser$Widget({
    widgets.Key? key,
    Options$Query$GetUser? options,
    required graphql_flutter.QueryBuilder<Query$GetUser> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetUser(),
          builder: builder,
        );
}

class Query$GetUser$getUser {
  Query$GetUser$getUser({
    required this.userId,
    required this.phoneNumber,
    required this.name,
    required this.role,
    required this.createdAt,
    this.lastLogin,
    this.$__typename = 'UserDetailResponse',
  });

  factory Query$GetUser$getUser.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$phoneNumber = json['phoneNumber'];
    final l$name = json['name'];
    final l$role = json['role'];
    final l$createdAt = json['createdAt'];
    final l$lastLogin = json['lastLogin'];
    final l$$__typename = json['__typename'];
    return Query$GetUser$getUser(
      userId: (l$userId as String),
      phoneNumber: (l$phoneNumber as String),
      name: (l$name as String),
      role: (l$role as String),
      createdAt: dateTimeFromJson(l$createdAt),
      lastLogin: l$lastLogin == null ? null : dateTimeFromJson(l$lastLogin),
      $__typename: (l$$__typename as String),
    );
  }

  final String userId;

  final String phoneNumber;

  final String name;

  final String role;

  final DateTime createdAt;

  final DateTime? lastLogin;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$role = role;
    _resultData['role'] = l$role;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$lastLogin = lastLogin;
    _resultData['lastLogin'] =
        l$lastLogin == null ? null : dateTimeToJson(l$lastLogin);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$phoneNumber = phoneNumber;
    final l$name = name;
    final l$role = role;
    final l$createdAt = createdAt;
    final l$lastLogin = lastLogin;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userId,
      l$phoneNumber,
      l$name,
      l$role,
      l$createdAt,
      l$lastLogin,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUser$getUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$lastLogin = lastLogin;
    final lOther$lastLogin = other.lastLogin;
    if (l$lastLogin != lOther$lastLogin) {
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

extension UtilityExtension$Query$GetUser$getUser on Query$GetUser$getUser {
  CopyWith$Query$GetUser$getUser<Query$GetUser$getUser> get copyWith =>
      CopyWith$Query$GetUser$getUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUser$getUser<TRes> {
  factory CopyWith$Query$GetUser$getUser(
    Query$GetUser$getUser instance,
    TRes Function(Query$GetUser$getUser) then,
  ) = _CopyWithImpl$Query$GetUser$getUser;

  factory CopyWith$Query$GetUser$getUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUser$getUser;

  TRes call({
    String? userId,
    String? phoneNumber,
    String? name,
    String? role,
    DateTime? createdAt,
    DateTime? lastLogin,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUser$getUser<TRes>
    implements CopyWith$Query$GetUser$getUser<TRes> {
  _CopyWithImpl$Query$GetUser$getUser(
    this._instance,
    this._then,
  );

  final Query$GetUser$getUser _instance;

  final TRes Function(Query$GetUser$getUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? phoneNumber = _undefined,
    Object? name = _undefined,
    Object? role = _undefined,
    Object? createdAt = _undefined,
    Object? lastLogin = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUser$getUser(
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        phoneNumber: phoneNumber == _undefined || phoneNumber == null
            ? _instance.phoneNumber
            : (phoneNumber as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        role: role == _undefined || role == null
            ? _instance.role
            : (role as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        lastLogin: lastLogin == _undefined
            ? _instance.lastLogin
            : (lastLogin as DateTime?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUser$getUser<TRes>
    implements CopyWith$Query$GetUser$getUser<TRes> {
  _CopyWithStubImpl$Query$GetUser$getUser(this._res);

  TRes _res;

  call({
    String? userId,
    String? phoneNumber,
    String? name,
    String? role,
    DateTime? createdAt,
    DateTime? lastLogin,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetUserAchievements {
  Query$GetUserAchievements({
    this.getUserAchievements,
    this.$__typename = 'Query',
  });

  factory Query$GetUserAchievements.fromJson(Map<String, dynamic> json) {
    final l$getUserAchievements = json['getUserAchievements'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAchievements(
      getUserAchievements: (l$getUserAchievements as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetUserAchievements$getUserAchievements.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUserAchievements$getUserAchievements?>?
      getUserAchievements;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUserAchievements = getUserAchievements;
    _resultData['getUserAchievements'] =
        l$getUserAchievements?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUserAchievements = getUserAchievements;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUserAchievements == null
          ? null
          : Object.hashAll(l$getUserAchievements.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUserAchievements) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUserAchievements = getUserAchievements;
    final lOther$getUserAchievements = other.getUserAchievements;
    if (l$getUserAchievements != null && lOther$getUserAchievements != null) {
      if (l$getUserAchievements.length != lOther$getUserAchievements.length) {
        return false;
      }
      for (int i = 0; i < l$getUserAchievements.length; i++) {
        final l$getUserAchievements$entry = l$getUserAchievements[i];
        final lOther$getUserAchievements$entry = lOther$getUserAchievements[i];
        if (l$getUserAchievements$entry != lOther$getUserAchievements$entry) {
          return false;
        }
      }
    } else if (l$getUserAchievements != lOther$getUserAchievements) {
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

extension UtilityExtension$Query$GetUserAchievements
    on Query$GetUserAchievements {
  CopyWith$Query$GetUserAchievements<Query$GetUserAchievements> get copyWith =>
      CopyWith$Query$GetUserAchievements(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserAchievements<TRes> {
  factory CopyWith$Query$GetUserAchievements(
    Query$GetUserAchievements instance,
    TRes Function(Query$GetUserAchievements) then,
  ) = _CopyWithImpl$Query$GetUserAchievements;

  factory CopyWith$Query$GetUserAchievements.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserAchievements;

  TRes call({
    List<Query$GetUserAchievements$getUserAchievements?>? getUserAchievements,
    String? $__typename,
  });
  TRes getUserAchievements(
      Iterable<Query$GetUserAchievements$getUserAchievements?>? Function(
              Iterable<
                  CopyWith$Query$GetUserAchievements$getUserAchievements<
                      Query$GetUserAchievements$getUserAchievements>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetUserAchievements<TRes>
    implements CopyWith$Query$GetUserAchievements<TRes> {
  _CopyWithImpl$Query$GetUserAchievements(
    this._instance,
    this._then,
  );

  final Query$GetUserAchievements _instance;

  final TRes Function(Query$GetUserAchievements) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUserAchievements = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserAchievements(
        getUserAchievements: getUserAchievements == _undefined
            ? _instance.getUserAchievements
            : (getUserAchievements
                as List<Query$GetUserAchievements$getUserAchievements?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getUserAchievements(
          Iterable<Query$GetUserAchievements$getUserAchievements?>? Function(
                  Iterable<
                      CopyWith$Query$GetUserAchievements$getUserAchievements<
                          Query$GetUserAchievements$getUserAchievements>?>?)
              _fn) =>
      call(
          getUserAchievements:
              _fn(_instance.getUserAchievements?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetUserAchievements$getUserAchievements(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetUserAchievements<TRes>
    implements CopyWith$Query$GetUserAchievements<TRes> {
  _CopyWithStubImpl$Query$GetUserAchievements(this._res);

  TRes _res;

  call({
    List<Query$GetUserAchievements$getUserAchievements?>? getUserAchievements,
    String? $__typename,
  }) =>
      _res;

  getUserAchievements(_fn) => _res;
}

const documentNodeQueryGetUserAchievements = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUserAchievements'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserAchievements'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'userAchievementId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'badgeId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'earnedAt'),
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
Query$GetUserAchievements _parserFn$Query$GetUserAchievements(
        Map<String, dynamic> data) =>
    Query$GetUserAchievements.fromJson(data);
typedef OnQueryComplete$Query$GetUserAchievements = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUserAchievements?,
);

class Options$Query$GetUserAchievements
    extends graphql.QueryOptions<Query$GetUserAchievements> {
  Options$Query$GetUserAchievements({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserAchievements? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserAchievements? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetUserAchievements(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUserAchievements,
          parserFn: _parserFn$Query$GetUserAchievements,
        );

  final OnQueryComplete$Query$GetUserAchievements? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUserAchievements
    extends graphql.WatchQueryOptions<Query$GetUserAchievements> {
  WatchOptions$Query$GetUserAchievements({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserAchievements? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetUserAchievements,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUserAchievements,
        );
}

class FetchMoreOptions$Query$GetUserAchievements
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserAchievements(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetUserAchievements,
        );
}

extension ClientExtension$Query$GetUserAchievements on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserAchievements>>
      query$GetUserAchievements(
              [Options$Query$GetUserAchievements? options]) async =>
          await this.query(options ?? Options$Query$GetUserAchievements());
  graphql.ObservableQuery<Query$GetUserAchievements>
      watchQuery$GetUserAchievements(
              [WatchOptions$Query$GetUserAchievements? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetUserAchievements());
  void writeQuery$GetUserAchievements({
    required Query$GetUserAchievements data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetUserAchievements)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUserAchievements? readQuery$GetUserAchievements(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetUserAchievements)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserAchievements.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserAchievements>
    useQuery$GetUserAchievements(
            [Options$Query$GetUserAchievements? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetUserAchievements());
graphql.ObservableQuery<Query$GetUserAchievements>
    useWatchQuery$GetUserAchievements(
            [WatchOptions$Query$GetUserAchievements? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetUserAchievements());

class Query$GetUserAchievements$Widget
    extends graphql_flutter.Query<Query$GetUserAchievements> {
  Query$GetUserAchievements$Widget({
    widgets.Key? key,
    Options$Query$GetUserAchievements? options,
    required graphql_flutter.QueryBuilder<Query$GetUserAchievements> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetUserAchievements(),
          builder: builder,
        );
}

class Query$GetUserAchievements$getUserAchievements {
  Query$GetUserAchievements$getUserAchievements({
    required this.userAchievementId,
    required this.badgeId,
    required this.earnedAt,
    this.$__typename = 'UserAchievementDetail',
  });

  factory Query$GetUserAchievements$getUserAchievements.fromJson(
      Map<String, dynamic> json) {
    final l$userAchievementId = json['userAchievementId'];
    final l$badgeId = json['badgeId'];
    final l$earnedAt = json['earnedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAchievements$getUserAchievements(
      userAchievementId: (l$userAchievementId as String),
      badgeId: (l$badgeId as String),
      earnedAt: dateTimeFromJson(l$earnedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String userAchievementId;

  final String badgeId;

  final DateTime earnedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$userAchievementId = userAchievementId;
    _resultData['userAchievementId'] = l$userAchievementId;
    final l$badgeId = badgeId;
    _resultData['badgeId'] = l$badgeId;
    final l$earnedAt = earnedAt;
    _resultData['earnedAt'] = dateTimeToJson(l$earnedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$userAchievementId = userAchievementId;
    final l$badgeId = badgeId;
    final l$earnedAt = earnedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$userAchievementId,
      l$badgeId,
      l$earnedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetUserAchievements$getUserAchievements) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userAchievementId = userAchievementId;
    final lOther$userAchievementId = other.userAchievementId;
    if (l$userAchievementId != lOther$userAchievementId) {
      return false;
    }
    final l$badgeId = badgeId;
    final lOther$badgeId = other.badgeId;
    if (l$badgeId != lOther$badgeId) {
      return false;
    }
    final l$earnedAt = earnedAt;
    final lOther$earnedAt = other.earnedAt;
    if (l$earnedAt != lOther$earnedAt) {
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

extension UtilityExtension$Query$GetUserAchievements$getUserAchievements
    on Query$GetUserAchievements$getUserAchievements {
  CopyWith$Query$GetUserAchievements$getUserAchievements<
          Query$GetUserAchievements$getUserAchievements>
      get copyWith => CopyWith$Query$GetUserAchievements$getUserAchievements(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetUserAchievements$getUserAchievements<TRes> {
  factory CopyWith$Query$GetUserAchievements$getUserAchievements(
    Query$GetUserAchievements$getUserAchievements instance,
    TRes Function(Query$GetUserAchievements$getUserAchievements) then,
  ) = _CopyWithImpl$Query$GetUserAchievements$getUserAchievements;

  factory CopyWith$Query$GetUserAchievements$getUserAchievements.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetUserAchievements$getUserAchievements;

  TRes call({
    String? userAchievementId,
    String? badgeId,
    DateTime? earnedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserAchievements$getUserAchievements<TRes>
    implements CopyWith$Query$GetUserAchievements$getUserAchievements<TRes> {
  _CopyWithImpl$Query$GetUserAchievements$getUserAchievements(
    this._instance,
    this._then,
  );

  final Query$GetUserAchievements$getUserAchievements _instance;

  final TRes Function(Query$GetUserAchievements$getUserAchievements) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userAchievementId = _undefined,
    Object? badgeId = _undefined,
    Object? earnedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserAchievements$getUserAchievements(
        userAchievementId:
            userAchievementId == _undefined || userAchievementId == null
                ? _instance.userAchievementId
                : (userAchievementId as String),
        badgeId: badgeId == _undefined || badgeId == null
            ? _instance.badgeId
            : (badgeId as String),
        earnedAt: earnedAt == _undefined || earnedAt == null
            ? _instance.earnedAt
            : (earnedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUserAchievements$getUserAchievements<TRes>
    implements CopyWith$Query$GetUserAchievements$getUserAchievements<TRes> {
  _CopyWithStubImpl$Query$GetUserAchievements$getUserAchievements(this._res);

  TRes _res;

  call({
    String? userAchievementId,
    String? badgeId,
    DateTime? earnedAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetFamilyMembers {
  Query$GetFamilyMembers({
    this.getFamilyMembers,
    this.$__typename = 'Query',
  });

  factory Query$GetFamilyMembers.fromJson(Map<String, dynamic> json) {
    final l$getFamilyMembers = json['getFamilyMembers'];
    final l$$__typename = json['__typename'];
    return Query$GetFamilyMembers(
      getFamilyMembers: (l$getFamilyMembers as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetFamilyMembers$getFamilyMembers.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetFamilyMembers$getFamilyMembers?>? getFamilyMembers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getFamilyMembers = getFamilyMembers;
    _resultData['getFamilyMembers'] =
        l$getFamilyMembers?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getFamilyMembers = getFamilyMembers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getFamilyMembers == null
          ? null
          : Object.hashAll(l$getFamilyMembers.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetFamilyMembers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getFamilyMembers = getFamilyMembers;
    final lOther$getFamilyMembers = other.getFamilyMembers;
    if (l$getFamilyMembers != null && lOther$getFamilyMembers != null) {
      if (l$getFamilyMembers.length != lOther$getFamilyMembers.length) {
        return false;
      }
      for (int i = 0; i < l$getFamilyMembers.length; i++) {
        final l$getFamilyMembers$entry = l$getFamilyMembers[i];
        final lOther$getFamilyMembers$entry = lOther$getFamilyMembers[i];
        if (l$getFamilyMembers$entry != lOther$getFamilyMembers$entry) {
          return false;
        }
      }
    } else if (l$getFamilyMembers != lOther$getFamilyMembers) {
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

extension UtilityExtension$Query$GetFamilyMembers on Query$GetFamilyMembers {
  CopyWith$Query$GetFamilyMembers<Query$GetFamilyMembers> get copyWith =>
      CopyWith$Query$GetFamilyMembers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetFamilyMembers<TRes> {
  factory CopyWith$Query$GetFamilyMembers(
    Query$GetFamilyMembers instance,
    TRes Function(Query$GetFamilyMembers) then,
  ) = _CopyWithImpl$Query$GetFamilyMembers;

  factory CopyWith$Query$GetFamilyMembers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetFamilyMembers;

  TRes call({
    List<Query$GetFamilyMembers$getFamilyMembers?>? getFamilyMembers,
    String? $__typename,
  });
  TRes getFamilyMembers(
      Iterable<Query$GetFamilyMembers$getFamilyMembers?>? Function(
              Iterable<
                  CopyWith$Query$GetFamilyMembers$getFamilyMembers<
                      Query$GetFamilyMembers$getFamilyMembers>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetFamilyMembers<TRes>
    implements CopyWith$Query$GetFamilyMembers<TRes> {
  _CopyWithImpl$Query$GetFamilyMembers(
    this._instance,
    this._then,
  );

  final Query$GetFamilyMembers _instance;

  final TRes Function(Query$GetFamilyMembers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getFamilyMembers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetFamilyMembers(
        getFamilyMembers: getFamilyMembers == _undefined
            ? _instance.getFamilyMembers
            : (getFamilyMembers
                as List<Query$GetFamilyMembers$getFamilyMembers?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getFamilyMembers(
          Iterable<Query$GetFamilyMembers$getFamilyMembers?>? Function(
                  Iterable<
                      CopyWith$Query$GetFamilyMembers$getFamilyMembers<
                          Query$GetFamilyMembers$getFamilyMembers>?>?)
              _fn) =>
      call(
          getFamilyMembers: _fn(_instance.getFamilyMembers?.map((e) => e == null
              ? null
              : CopyWith$Query$GetFamilyMembers$getFamilyMembers(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetFamilyMembers<TRes>
    implements CopyWith$Query$GetFamilyMembers<TRes> {
  _CopyWithStubImpl$Query$GetFamilyMembers(this._res);

  TRes _res;

  call({
    List<Query$GetFamilyMembers$getFamilyMembers?>? getFamilyMembers,
    String? $__typename,
  }) =>
      _res;

  getFamilyMembers(_fn) => _res;
}

const documentNodeQueryGetFamilyMembers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetFamilyMembers'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getFamilyMembers'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'memberId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'relatedUserId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'relationship'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accessLevel'),
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
Query$GetFamilyMembers _parserFn$Query$GetFamilyMembers(
        Map<String, dynamic> data) =>
    Query$GetFamilyMembers.fromJson(data);
typedef OnQueryComplete$Query$GetFamilyMembers = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetFamilyMembers?,
);

class Options$Query$GetFamilyMembers
    extends graphql.QueryOptions<Query$GetFamilyMembers> {
  Options$Query$GetFamilyMembers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetFamilyMembers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetFamilyMembers? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$GetFamilyMembers(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetFamilyMembers,
          parserFn: _parserFn$Query$GetFamilyMembers,
        );

  final OnQueryComplete$Query$GetFamilyMembers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetFamilyMembers
    extends graphql.WatchQueryOptions<Query$GetFamilyMembers> {
  WatchOptions$Query$GetFamilyMembers({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetFamilyMembers? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetFamilyMembers,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetFamilyMembers,
        );
}

class FetchMoreOptions$Query$GetFamilyMembers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetFamilyMembers(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetFamilyMembers,
        );
}

extension ClientExtension$Query$GetFamilyMembers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetFamilyMembers>> query$GetFamilyMembers(
          [Options$Query$GetFamilyMembers? options]) async =>
      await this.query(options ?? Options$Query$GetFamilyMembers());
  graphql.ObservableQuery<Query$GetFamilyMembers> watchQuery$GetFamilyMembers(
          [WatchOptions$Query$GetFamilyMembers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetFamilyMembers());
  void writeQuery$GetFamilyMembers({
    required Query$GetFamilyMembers data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetFamilyMembers)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetFamilyMembers? readQuery$GetFamilyMembers({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetFamilyMembers)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetFamilyMembers.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetFamilyMembers>
    useQuery$GetFamilyMembers([Options$Query$GetFamilyMembers? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetFamilyMembers());
graphql.ObservableQuery<Query$GetFamilyMembers> useWatchQuery$GetFamilyMembers(
        [WatchOptions$Query$GetFamilyMembers? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetFamilyMembers());

class Query$GetFamilyMembers$Widget
    extends graphql_flutter.Query<Query$GetFamilyMembers> {
  Query$GetFamilyMembers$Widget({
    widgets.Key? key,
    Options$Query$GetFamilyMembers? options,
    required graphql_flutter.QueryBuilder<Query$GetFamilyMembers> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetFamilyMembers(),
          builder: builder,
        );
}

class Query$GetFamilyMembers$getFamilyMembers {
  Query$GetFamilyMembers$getFamilyMembers({
    required this.memberId,
    required this.relatedUserId,
    required this.relationship,
    required this.accessLevel,
    this.$__typename = 'FamilyMemberDetail',
  });

  factory Query$GetFamilyMembers$getFamilyMembers.fromJson(
      Map<String, dynamic> json) {
    final l$memberId = json['memberId'];
    final l$relatedUserId = json['relatedUserId'];
    final l$relationship = json['relationship'];
    final l$accessLevel = json['accessLevel'];
    final l$$__typename = json['__typename'];
    return Query$GetFamilyMembers$getFamilyMembers(
      memberId: (l$memberId as String),
      relatedUserId: (l$relatedUserId as String),
      relationship: (l$relationship as String),
      accessLevel: (l$accessLevel as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String memberId;

  final String relatedUserId;

  final String relationship;

  final int accessLevel;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$relatedUserId = relatedUserId;
    _resultData['relatedUserId'] = l$relatedUserId;
    final l$relationship = relationship;
    _resultData['relationship'] = l$relationship;
    final l$accessLevel = accessLevel;
    _resultData['accessLevel'] = l$accessLevel;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    final l$relatedUserId = relatedUserId;
    final l$relationship = relationship;
    final l$accessLevel = accessLevel;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$memberId,
      l$relatedUserId,
      l$relationship,
      l$accessLevel,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetFamilyMembers$getFamilyMembers) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$relatedUserId = relatedUserId;
    final lOther$relatedUserId = other.relatedUserId;
    if (l$relatedUserId != lOther$relatedUserId) {
      return false;
    }
    final l$relationship = relationship;
    final lOther$relationship = other.relationship;
    if (l$relationship != lOther$relationship) {
      return false;
    }
    final l$accessLevel = accessLevel;
    final lOther$accessLevel = other.accessLevel;
    if (l$accessLevel != lOther$accessLevel) {
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

extension UtilityExtension$Query$GetFamilyMembers$getFamilyMembers
    on Query$GetFamilyMembers$getFamilyMembers {
  CopyWith$Query$GetFamilyMembers$getFamilyMembers<
          Query$GetFamilyMembers$getFamilyMembers>
      get copyWith => CopyWith$Query$GetFamilyMembers$getFamilyMembers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetFamilyMembers$getFamilyMembers<TRes> {
  factory CopyWith$Query$GetFamilyMembers$getFamilyMembers(
    Query$GetFamilyMembers$getFamilyMembers instance,
    TRes Function(Query$GetFamilyMembers$getFamilyMembers) then,
  ) = _CopyWithImpl$Query$GetFamilyMembers$getFamilyMembers;

  factory CopyWith$Query$GetFamilyMembers$getFamilyMembers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetFamilyMembers$getFamilyMembers;

  TRes call({
    String? memberId,
    String? relatedUserId,
    String? relationship,
    int? accessLevel,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetFamilyMembers$getFamilyMembers<TRes>
    implements CopyWith$Query$GetFamilyMembers$getFamilyMembers<TRes> {
  _CopyWithImpl$Query$GetFamilyMembers$getFamilyMembers(
    this._instance,
    this._then,
  );

  final Query$GetFamilyMembers$getFamilyMembers _instance;

  final TRes Function(Query$GetFamilyMembers$getFamilyMembers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? relatedUserId = _undefined,
    Object? relationship = _undefined,
    Object? accessLevel = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetFamilyMembers$getFamilyMembers(
        memberId: memberId == _undefined || memberId == null
            ? _instance.memberId
            : (memberId as String),
        relatedUserId: relatedUserId == _undefined || relatedUserId == null
            ? _instance.relatedUserId
            : (relatedUserId as String),
        relationship: relationship == _undefined || relationship == null
            ? _instance.relationship
            : (relationship as String),
        accessLevel: accessLevel == _undefined || accessLevel == null
            ? _instance.accessLevel
            : (accessLevel as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetFamilyMembers$getFamilyMembers<TRes>
    implements CopyWith$Query$GetFamilyMembers$getFamilyMembers<TRes> {
  _CopyWithStubImpl$Query$GetFamilyMembers$getFamilyMembers(this._res);

  TRes _res;

  call({
    String? memberId,
    String? relatedUserId,
    String? relationship,
    int? accessLevel,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateUser {
  factory Variables$Mutation$UpdateUser({
    String? name,
    String? phoneNumber,
    String? password,
  }) =>
      Variables$Mutation$UpdateUser._({
        if (name != null) r'name': name,
        if (phoneNumber != null) r'phoneNumber': phoneNumber,
        if (password != null) r'password': password,
      });

  Variables$Mutation$UpdateUser._(this._$data);

  factory Variables$Mutation$UpdateUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('password')) {
      final l$password = data['password'];
      result$data['password'] = (l$password as String?);
    }
    return Variables$Mutation$UpdateUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String? get password => (_$data['password'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('password')) {
      final l$password = password;
      result$data['password'] = l$password;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateUser<Variables$Mutation$UpdateUser>
      get copyWith => CopyWith$Variables$Mutation$UpdateUser(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateUser) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (_$data.containsKey('password') !=
        other._$data.containsKey('password')) {
      return false;
    }
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$phoneNumber = phoneNumber;
    final l$password = password;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('password') ? l$password : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateUser<TRes> {
  factory CopyWith$Variables$Mutation$UpdateUser(
    Variables$Mutation$UpdateUser instance,
    TRes Function(Variables$Mutation$UpdateUser) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateUser;

  factory CopyWith$Variables$Mutation$UpdateUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateUser;

  TRes call({
    String? name,
    String? phoneNumber,
    String? password,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateUser<TRes>
    implements CopyWith$Variables$Mutation$UpdateUser<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateUser(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateUser _instance;

  final TRes Function(Variables$Mutation$UpdateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? phoneNumber = _undefined,
    Object? password = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateUser._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
        if (password != _undefined) 'password': (password as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateUser<TRes>
    implements CopyWith$Variables$Mutation$UpdateUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateUser(this._res);

  TRes _res;

  call({
    String? name,
    String? phoneNumber,
    String? password,
  }) =>
      _res;
}

class Mutation$UpdateUser {
  Mutation$UpdateUser({
    this.updateUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateUser.fromJson(Map<String, dynamic> json) {
    final l$updateUser = json['updateUser'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateUser(
      updateUser: l$updateUser == null
          ? null
          : Mutation$UpdateUser$updateUser.fromJson(
              (l$updateUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateUser$updateUser? updateUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUser = updateUser;
    _resultData['updateUser'] = l$updateUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUser = updateUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUser = updateUser;
    final lOther$updateUser = other.updateUser;
    if (l$updateUser != lOther$updateUser) {
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

extension UtilityExtension$Mutation$UpdateUser on Mutation$UpdateUser {
  CopyWith$Mutation$UpdateUser<Mutation$UpdateUser> get copyWith =>
      CopyWith$Mutation$UpdateUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateUser<TRes> {
  factory CopyWith$Mutation$UpdateUser(
    Mutation$UpdateUser instance,
    TRes Function(Mutation$UpdateUser) then,
  ) = _CopyWithImpl$Mutation$UpdateUser;

  factory CopyWith$Mutation$UpdateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateUser;

  TRes call({
    Mutation$UpdateUser$updateUser? updateUser,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser;
}

class _CopyWithImpl$Mutation$UpdateUser<TRes>
    implements CopyWith$Mutation$UpdateUser<TRes> {
  _CopyWithImpl$Mutation$UpdateUser(
    this._instance,
    this._then,
  );

  final Mutation$UpdateUser _instance;

  final TRes Function(Mutation$UpdateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateUser(
        updateUser: updateUser == _undefined
            ? _instance.updateUser
            : (updateUser as Mutation$UpdateUser$updateUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser {
    final local$updateUser = _instance.updateUser;
    return local$updateUser == null
        ? CopyWith$Mutation$UpdateUser$updateUser.stub(_then(_instance))
        : CopyWith$Mutation$UpdateUser$updateUser(
            local$updateUser, (e) => call(updateUser: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateUser<TRes>
    implements CopyWith$Mutation$UpdateUser<TRes> {
  _CopyWithStubImpl$Mutation$UpdateUser(this._res);

  TRes _res;

  call({
    Mutation$UpdateUser$updateUser? updateUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser =>
      CopyWith$Mutation$UpdateUser$updateUser.stub(_res);
}

const documentNodeMutationUpdateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phoneNumber')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
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
Mutation$UpdateUser _parserFn$Mutation$UpdateUser(Map<String, dynamic> data) =>
    Mutation$UpdateUser.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateUser?,
);

class Options$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  Options$Mutation$UpdateUser({
    String? operationName,
    Variables$Mutation$UpdateUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Mutation$UpdateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateUser,
          parserFn: _parserFn$Mutation$UpdateUser,
        );

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateUser
    extends graphql.WatchQueryOptions<Mutation$UpdateUser> {
  WatchOptions$Mutation$UpdateUser({
    String? operationName,
    Variables$Mutation$UpdateUser? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationUpdateUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateUser,
        );
}

extension ClientExtension$Mutation$UpdateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateUser>> mutate$UpdateUser(
          [Options$Mutation$UpdateUser? options]) async =>
      await this.mutate(options ?? Options$Mutation$UpdateUser());
  graphql.ObservableQuery<Mutation$UpdateUser> watchMutation$UpdateUser(
          [WatchOptions$Mutation$UpdateUser? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$UpdateUser());
}

class Mutation$UpdateUser$HookResult {
  Mutation$UpdateUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateUser runMutation;

  final graphql.QueryResult<Mutation$UpdateUser> result;
}

Mutation$UpdateUser$HookResult useMutation$UpdateUser(
    [WidgetOptions$Mutation$UpdateUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateUser());
  return Mutation$UpdateUser$HookResult(
    ({variables, optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables?.toJson() ?? const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateUser> useWatchMutation$UpdateUser(
        [WatchOptions$Mutation$UpdateUser? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$UpdateUser());

class WidgetOptions$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  WidgetOptions$Mutation$UpdateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
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
                    data == null ? null : _parserFn$Mutation$UpdateUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateUser,
          parserFn: _parserFn$Mutation$UpdateUser,
        );

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateUser
    = graphql.MultiSourceResult<Mutation$UpdateUser> Function({
  Variables$Mutation$UpdateUser? variables,
  Object? optimisticResult,
  Mutation$UpdateUser? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateUser = widgets.Widget Function(
  RunMutation$Mutation$UpdateUser,
  graphql.QueryResult<Mutation$UpdateUser>?,
);

class Mutation$UpdateUser$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateUser> {
  Mutation$UpdateUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateUser? options,
    required Builder$Mutation$UpdateUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateUser(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              variables,
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables?.toJson() ?? const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$UpdateUser$updateUser {
  Mutation$UpdateUser$updateUser({
    required this.userId,
    required this.message,
    this.$__typename = 'UpdateUserResponse',
  });

  factory Mutation$UpdateUser$updateUser.fromJson(Map<String, dynamic> json) {
    final l$userId = json['userId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateUser$updateUser(
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
    if (!(other is Mutation$UpdateUser$updateUser) ||
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

extension UtilityExtension$Mutation$UpdateUser$updateUser
    on Mutation$UpdateUser$updateUser {
  CopyWith$Mutation$UpdateUser$updateUser<Mutation$UpdateUser$updateUser>
      get copyWith => CopyWith$Mutation$UpdateUser$updateUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  factory CopyWith$Mutation$UpdateUser$updateUser(
    Mutation$UpdateUser$updateUser instance,
    TRes Function(Mutation$UpdateUser$updateUser) then,
  ) = _CopyWithImpl$Mutation$UpdateUser$updateUser;

  factory CopyWith$Mutation$UpdateUser$updateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateUser$updateUser;

  TRes call({
    String? userId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateUser$updateUser<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  _CopyWithImpl$Mutation$UpdateUser$updateUser(
    this._instance,
    this._then,
  );

  final Mutation$UpdateUser$updateUser _instance;

  final TRes Function(Mutation$UpdateUser$updateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateUser$updateUser(
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

class _CopyWithStubImpl$Mutation$UpdateUser$updateUser<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  _CopyWithStubImpl$Mutation$UpdateUser$updateUser(this._res);

  TRes _res;

  call({
    String? userId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$DeleteUser {
  Mutation$DeleteUser({
    this.deleteUser,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteUser.fromJson(Map<String, dynamic> json) {
    final l$deleteUser = json['deleteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteUser(
      deleteUser: l$deleteUser == null
          ? null
          : Mutation$DeleteUser$deleteUser.fromJson(
              (l$deleteUser as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteUser$deleteUser? deleteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteUser = deleteUser;
    _resultData['deleteUser'] = l$deleteUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteUser = deleteUser;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteUser,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteUser) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteUser = deleteUser;
    final lOther$deleteUser = other.deleteUser;
    if (l$deleteUser != lOther$deleteUser) {
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

extension UtilityExtension$Mutation$DeleteUser on Mutation$DeleteUser {
  CopyWith$Mutation$DeleteUser<Mutation$DeleteUser> get copyWith =>
      CopyWith$Mutation$DeleteUser(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteUser<TRes> {
  factory CopyWith$Mutation$DeleteUser(
    Mutation$DeleteUser instance,
    TRes Function(Mutation$DeleteUser) then,
  ) = _CopyWithImpl$Mutation$DeleteUser;

  factory CopyWith$Mutation$DeleteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteUser;

  TRes call({
    Mutation$DeleteUser$deleteUser? deleteUser,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser;
}

class _CopyWithImpl$Mutation$DeleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser<TRes> {
  _CopyWithImpl$Mutation$DeleteUser(
    this._instance,
    this._then,
  );

  final Mutation$DeleteUser _instance;

  final TRes Function(Mutation$DeleteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteUser = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteUser(
        deleteUser: deleteUser == _undefined
            ? _instance.deleteUser
            : (deleteUser as Mutation$DeleteUser$deleteUser?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser {
    final local$deleteUser = _instance.deleteUser;
    return local$deleteUser == null
        ? CopyWith$Mutation$DeleteUser$deleteUser.stub(_then(_instance))
        : CopyWith$Mutation$DeleteUser$deleteUser(
            local$deleteUser, (e) => call(deleteUser: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser<TRes> {
  _CopyWithStubImpl$Mutation$DeleteUser(this._res);

  TRes _res;

  call({
    Mutation$DeleteUser$deleteUser? deleteUser,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser =>
      CopyWith$Mutation$DeleteUser$deleteUser.stub(_res);
}

const documentNodeMutationDeleteUser = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteUser'),
        alias: null,
        arguments: [],
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
Mutation$DeleteUser _parserFn$Mutation$DeleteUser(Map<String, dynamic> data) =>
    Mutation$DeleteUser.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteUser = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteUser?,
);

class Options$Mutation$DeleteUser
    extends graphql.MutationOptions<Mutation$DeleteUser> {
  Options$Mutation$DeleteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteUser,
          parserFn: _parserFn$Mutation$DeleteUser,
        );

  final OnMutationCompleted$Mutation$DeleteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteUser
    extends graphql.WatchQueryOptions<Mutation$DeleteUser> {
  WatchOptions$Mutation$DeleteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeMutationDeleteUser,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteUser,
        );
}

extension ClientExtension$Mutation$DeleteUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteUser>> mutate$DeleteUser(
          [Options$Mutation$DeleteUser? options]) async =>
      await this.mutate(options ?? Options$Mutation$DeleteUser());
  graphql.ObservableQuery<Mutation$DeleteUser> watchMutation$DeleteUser(
          [WatchOptions$Mutation$DeleteUser? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$DeleteUser());
}

class Mutation$DeleteUser$HookResult {
  Mutation$DeleteUser$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteUser runMutation;

  final graphql.QueryResult<Mutation$DeleteUser> result;
}

Mutation$DeleteUser$HookResult useMutation$DeleteUser(
    [WidgetOptions$Mutation$DeleteUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteUser());
  return Mutation$DeleteUser$HookResult(
    ({optimisticResult, typedOptimisticResult}) => result.runMutation(
      const {},
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteUser> useWatchMutation$DeleteUser(
        [WatchOptions$Mutation$DeleteUser? options]) =>
    graphql_flutter
        .useWatchMutation(options ?? WatchOptions$Mutation$DeleteUser());

class WidgetOptions$Mutation$DeleteUser
    extends graphql.MutationOptions<Mutation$DeleteUser> {
  WidgetOptions$Mutation$DeleteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteUser>? update,
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
                    data == null ? null : _parserFn$Mutation$DeleteUser(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteUser,
          parserFn: _parserFn$Mutation$DeleteUser,
        );

  final OnMutationCompleted$Mutation$DeleteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteUser
    = graphql.MultiSourceResult<Mutation$DeleteUser> Function({
  Object? optimisticResult,
  Mutation$DeleteUser? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteUser = widgets.Widget Function(
  RunMutation$Mutation$DeleteUser,
  graphql.QueryResult<Mutation$DeleteUser>?,
);

class Mutation$DeleteUser$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteUser> {
  Mutation$DeleteUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteUser? options,
    required Builder$Mutation$DeleteUser builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteUser(),
          builder: (
            run,
            result,
          ) =>
              builder(
            ({
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              const {},
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$DeleteUser$deleteUser {
  Mutation$DeleteUser$deleteUser({
    required this.message,
    this.$__typename = 'DeleteUserResponse',
  });

  factory Mutation$DeleteUser$deleteUser.fromJson(Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteUser$deleteUser(
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
    if (!(other is Mutation$DeleteUser$deleteUser) ||
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

extension UtilityExtension$Mutation$DeleteUser$deleteUser
    on Mutation$DeleteUser$deleteUser {
  CopyWith$Mutation$DeleteUser$deleteUser<Mutation$DeleteUser$deleteUser>
      get copyWith => CopyWith$Mutation$DeleteUser$deleteUser(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  factory CopyWith$Mutation$DeleteUser$deleteUser(
    Mutation$DeleteUser$deleteUser instance,
    TRes Function(Mutation$DeleteUser$deleteUser) then,
  ) = _CopyWithImpl$Mutation$DeleteUser$deleteUser;

  factory CopyWith$Mutation$DeleteUser$deleteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteUser$deleteUser;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteUser$deleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  _CopyWithImpl$Mutation$DeleteUser$deleteUser(
    this._instance,
    this._then,
  );

  final Mutation$DeleteUser$deleteUser _instance;

  final TRes Function(Mutation$DeleteUser$deleteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteUser$deleteUser(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteUser$deleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  _CopyWithStubImpl$Mutation$DeleteUser$deleteUser(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$RequestPasswordReset {
  factory Variables$Mutation$RequestPasswordReset(
          {required String phoneNumber}) =>
      Variables$Mutation$RequestPasswordReset._({
        r'phoneNumber': phoneNumber,
      });

  Variables$Mutation$RequestPasswordReset._(this._$data);

  factory Variables$Mutation$RequestPasswordReset.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    return Variables$Mutation$RequestPasswordReset._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    return result$data;
  }

  CopyWith$Variables$Mutation$RequestPasswordReset<
          Variables$Mutation$RequestPasswordReset>
      get copyWith => CopyWith$Variables$Mutation$RequestPasswordReset(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$RequestPasswordReset) ||
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

abstract class CopyWith$Variables$Mutation$RequestPasswordReset<TRes> {
  factory CopyWith$Variables$Mutation$RequestPasswordReset(
    Variables$Mutation$RequestPasswordReset instance,
    TRes Function(Variables$Mutation$RequestPasswordReset) then,
  ) = _CopyWithImpl$Variables$Mutation$RequestPasswordReset;

  factory CopyWith$Variables$Mutation$RequestPasswordReset.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RequestPasswordReset;

  TRes call({String? phoneNumber});
}

class _CopyWithImpl$Variables$Mutation$RequestPasswordReset<TRes>
    implements CopyWith$Variables$Mutation$RequestPasswordReset<TRes> {
  _CopyWithImpl$Variables$Mutation$RequestPasswordReset(
    this._instance,
    this._then,
  );

  final Variables$Mutation$RequestPasswordReset _instance;

  final TRes Function(Variables$Mutation$RequestPasswordReset) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? phoneNumber = _undefined}) =>
      _then(Variables$Mutation$RequestPasswordReset._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$RequestPasswordReset<TRes>
    implements CopyWith$Variables$Mutation$RequestPasswordReset<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RequestPasswordReset(this._res);

  TRes _res;

  call({String? phoneNumber}) => _res;
}

class Mutation$RequestPasswordReset {
  Mutation$RequestPasswordReset({
    this.requestPasswordReset,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RequestPasswordReset.fromJson(Map<String, dynamic> json) {
    final l$requestPasswordReset = json['requestPasswordReset'];
    final l$$__typename = json['__typename'];
    return Mutation$RequestPasswordReset(
      requestPasswordReset: l$requestPasswordReset == null
          ? null
          : Mutation$RequestPasswordReset$requestPasswordReset.fromJson(
              (l$requestPasswordReset as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$RequestPasswordReset$requestPasswordReset?
      requestPasswordReset;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$requestPasswordReset = requestPasswordReset;
    _resultData['requestPasswordReset'] = l$requestPasswordReset?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$requestPasswordReset = requestPasswordReset;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$requestPasswordReset,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$RequestPasswordReset) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$requestPasswordReset = requestPasswordReset;
    final lOther$requestPasswordReset = other.requestPasswordReset;
    if (l$requestPasswordReset != lOther$requestPasswordReset) {
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

extension UtilityExtension$Mutation$RequestPasswordReset
    on Mutation$RequestPasswordReset {
  CopyWith$Mutation$RequestPasswordReset<Mutation$RequestPasswordReset>
      get copyWith => CopyWith$Mutation$RequestPasswordReset(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RequestPasswordReset<TRes> {
  factory CopyWith$Mutation$RequestPasswordReset(
    Mutation$RequestPasswordReset instance,
    TRes Function(Mutation$RequestPasswordReset) then,
  ) = _CopyWithImpl$Mutation$RequestPasswordReset;

  factory CopyWith$Mutation$RequestPasswordReset.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RequestPasswordReset;

  TRes call({
    Mutation$RequestPasswordReset$requestPasswordReset? requestPasswordReset,
    String? $__typename,
  });
  CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<TRes>
      get requestPasswordReset;
}

class _CopyWithImpl$Mutation$RequestPasswordReset<TRes>
    implements CopyWith$Mutation$RequestPasswordReset<TRes> {
  _CopyWithImpl$Mutation$RequestPasswordReset(
    this._instance,
    this._then,
  );

  final Mutation$RequestPasswordReset _instance;

  final TRes Function(Mutation$RequestPasswordReset) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? requestPasswordReset = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RequestPasswordReset(
        requestPasswordReset: requestPasswordReset == _undefined
            ? _instance.requestPasswordReset
            : (requestPasswordReset
                as Mutation$RequestPasswordReset$requestPasswordReset?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<TRes>
      get requestPasswordReset {
    final local$requestPasswordReset = _instance.requestPasswordReset;
    return local$requestPasswordReset == null
        ? CopyWith$Mutation$RequestPasswordReset$requestPasswordReset.stub(
            _then(_instance))
        : CopyWith$Mutation$RequestPasswordReset$requestPasswordReset(
            local$requestPasswordReset, (e) => call(requestPasswordReset: e));
  }
}

class _CopyWithStubImpl$Mutation$RequestPasswordReset<TRes>
    implements CopyWith$Mutation$RequestPasswordReset<TRes> {
  _CopyWithStubImpl$Mutation$RequestPasswordReset(this._res);

  TRes _res;

  call({
    Mutation$RequestPasswordReset$requestPasswordReset? requestPasswordReset,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<TRes>
      get requestPasswordReset =>
          CopyWith$Mutation$RequestPasswordReset$requestPasswordReset.stub(
              _res);
}

const documentNodeMutationRequestPasswordReset = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'RequestPasswordReset'),
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
        name: NameNode(value: 'requestPasswordReset'),
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
Mutation$RequestPasswordReset _parserFn$Mutation$RequestPasswordReset(
        Map<String, dynamic> data) =>
    Mutation$RequestPasswordReset.fromJson(data);
typedef OnMutationCompleted$Mutation$RequestPasswordReset = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$RequestPasswordReset?,
);

class Options$Mutation$RequestPasswordReset
    extends graphql.MutationOptions<Mutation$RequestPasswordReset> {
  Options$Mutation$RequestPasswordReset({
    String? operationName,
    required Variables$Mutation$RequestPasswordReset variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestPasswordReset? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RequestPasswordReset? onCompleted,
    graphql.OnMutationUpdate<Mutation$RequestPasswordReset>? update,
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
                        : _parserFn$Mutation$RequestPasswordReset(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRequestPasswordReset,
          parserFn: _parserFn$Mutation$RequestPasswordReset,
        );

  final OnMutationCompleted$Mutation$RequestPasswordReset?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$RequestPasswordReset
    extends graphql.WatchQueryOptions<Mutation$RequestPasswordReset> {
  WatchOptions$Mutation$RequestPasswordReset({
    String? operationName,
    required Variables$Mutation$RequestPasswordReset variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestPasswordReset? typedOptimisticResult,
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
          document: documentNodeMutationRequestPasswordReset,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$RequestPasswordReset,
        );
}

extension ClientExtension$Mutation$RequestPasswordReset
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RequestPasswordReset>>
      mutate$RequestPasswordReset(
              Options$Mutation$RequestPasswordReset options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$RequestPasswordReset>
      watchMutation$RequestPasswordReset(
              WatchOptions$Mutation$RequestPasswordReset options) =>
          this.watchMutation(options);
}

class Mutation$RequestPasswordReset$HookResult {
  Mutation$RequestPasswordReset$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$RequestPasswordReset runMutation;

  final graphql.QueryResult<Mutation$RequestPasswordReset> result;
}

Mutation$RequestPasswordReset$HookResult useMutation$RequestPasswordReset(
    [WidgetOptions$Mutation$RequestPasswordReset? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$RequestPasswordReset());
  return Mutation$RequestPasswordReset$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RequestPasswordReset>
    useWatchMutation$RequestPasswordReset(
            WatchOptions$Mutation$RequestPasswordReset options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RequestPasswordReset
    extends graphql.MutationOptions<Mutation$RequestPasswordReset> {
  WidgetOptions$Mutation$RequestPasswordReset({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RequestPasswordReset? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RequestPasswordReset? onCompleted,
    graphql.OnMutationUpdate<Mutation$RequestPasswordReset>? update,
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
                        : _parserFn$Mutation$RequestPasswordReset(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationRequestPasswordReset,
          parserFn: _parserFn$Mutation$RequestPasswordReset,
        );

  final OnMutationCompleted$Mutation$RequestPasswordReset?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$RequestPasswordReset
    = graphql.MultiSourceResult<Mutation$RequestPasswordReset> Function(
  Variables$Mutation$RequestPasswordReset, {
  Object? optimisticResult,
  Mutation$RequestPasswordReset? typedOptimisticResult,
});
typedef Builder$Mutation$RequestPasswordReset = widgets.Widget Function(
  RunMutation$Mutation$RequestPasswordReset,
  graphql.QueryResult<Mutation$RequestPasswordReset>?,
);

class Mutation$RequestPasswordReset$Widget
    extends graphql_flutter.Mutation<Mutation$RequestPasswordReset> {
  Mutation$RequestPasswordReset$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RequestPasswordReset? options,
    required Builder$Mutation$RequestPasswordReset builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$RequestPasswordReset(),
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

class Mutation$RequestPasswordReset$requestPasswordReset {
  Mutation$RequestPasswordReset$requestPasswordReset({
    required this.message,
    this.$__typename = 'RequestPasswordResetResponse',
  });

  factory Mutation$RequestPasswordReset$requestPasswordReset.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$RequestPasswordReset$requestPasswordReset(
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
    if (!(other is Mutation$RequestPasswordReset$requestPasswordReset) ||
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

extension UtilityExtension$Mutation$RequestPasswordReset$requestPasswordReset
    on Mutation$RequestPasswordReset$requestPasswordReset {
  CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<
          Mutation$RequestPasswordReset$requestPasswordReset>
      get copyWith =>
          CopyWith$Mutation$RequestPasswordReset$requestPasswordReset(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<
    TRes> {
  factory CopyWith$Mutation$RequestPasswordReset$requestPasswordReset(
    Mutation$RequestPasswordReset$requestPasswordReset instance,
    TRes Function(Mutation$RequestPasswordReset$requestPasswordReset) then,
  ) = _CopyWithImpl$Mutation$RequestPasswordReset$requestPasswordReset;

  factory CopyWith$Mutation$RequestPasswordReset$requestPasswordReset.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$RequestPasswordReset$requestPasswordReset;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$RequestPasswordReset$requestPasswordReset<TRes>
    implements
        CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<TRes> {
  _CopyWithImpl$Mutation$RequestPasswordReset$requestPasswordReset(
    this._instance,
    this._then,
  );

  final Mutation$RequestPasswordReset$requestPasswordReset _instance;

  final TRes Function(Mutation$RequestPasswordReset$requestPasswordReset) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$RequestPasswordReset$requestPasswordReset(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$RequestPasswordReset$requestPasswordReset<TRes>
    implements
        CopyWith$Mutation$RequestPasswordReset$requestPasswordReset<TRes> {
  _CopyWithStubImpl$Mutation$RequestPasswordReset$requestPasswordReset(
      this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ResetPassword {
  factory Variables$Mutation$ResetPassword({
    required String token,
    required String newPassword,
  }) =>
      Variables$Mutation$ResetPassword._({
        r'token': token,
        r'newPassword': newPassword,
      });

  Variables$Mutation$ResetPassword._(this._$data);

  factory Variables$Mutation$ResetPassword.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$token = data['token'];
    result$data['token'] = (l$token as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    return Variables$Mutation$ResetPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get token => (_$data['token'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$token = token;
    result$data['token'] = l$token;
    final l$newPassword = newPassword;
    result$data['newPassword'] = l$newPassword;
    return result$data;
  }

  CopyWith$Variables$Mutation$ResetPassword<Variables$Mutation$ResetPassword>
      get copyWith => CopyWith$Variables$Mutation$ResetPassword(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$ResetPassword) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) {
      return false;
    }
    final l$newPassword = newPassword;
    final lOther$newPassword = other.newPassword;
    if (l$newPassword != lOther$newPassword) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$token = token;
    final l$newPassword = newPassword;
    return Object.hashAll([
      l$token,
      l$newPassword,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ResetPassword<TRes> {
  factory CopyWith$Variables$Mutation$ResetPassword(
    Variables$Mutation$ResetPassword instance,
    TRes Function(Variables$Mutation$ResetPassword) then,
  ) = _CopyWithImpl$Variables$Mutation$ResetPassword;

  factory CopyWith$Variables$Mutation$ResetPassword.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ResetPassword;

  TRes call({
    String? token,
    String? newPassword,
  });
}

class _CopyWithImpl$Variables$Mutation$ResetPassword<TRes>
    implements CopyWith$Variables$Mutation$ResetPassword<TRes> {
  _CopyWithImpl$Variables$Mutation$ResetPassword(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ResetPassword _instance;

  final TRes Function(Variables$Mutation$ResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? token = _undefined,
    Object? newPassword = _undefined,
  }) =>
      _then(Variables$Mutation$ResetPassword._({
        ..._instance._$data,
        if (token != _undefined && token != null) 'token': (token as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ResetPassword<TRes>
    implements CopyWith$Variables$Mutation$ResetPassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ResetPassword(this._res);

  TRes _res;

  call({
    String? token,
    String? newPassword,
  }) =>
      _res;
}

class Mutation$ResetPassword {
  Mutation$ResetPassword({
    this.resetPassword,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ResetPassword.fromJson(Map<String, dynamic> json) {
    final l$resetPassword = json['resetPassword'];
    final l$$__typename = json['__typename'];
    return Mutation$ResetPassword(
      resetPassword: l$resetPassword == null
          ? null
          : Mutation$ResetPassword$resetPassword.fromJson(
              (l$resetPassword as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ResetPassword$resetPassword? resetPassword;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$resetPassword = resetPassword;
    _resultData['resetPassword'] = l$resetPassword?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$resetPassword = resetPassword;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$resetPassword,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ResetPassword) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$resetPassword = resetPassword;
    final lOther$resetPassword = other.resetPassword;
    if (l$resetPassword != lOther$resetPassword) {
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

extension UtilityExtension$Mutation$ResetPassword on Mutation$ResetPassword {
  CopyWith$Mutation$ResetPassword<Mutation$ResetPassword> get copyWith =>
      CopyWith$Mutation$ResetPassword(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ResetPassword<TRes> {
  factory CopyWith$Mutation$ResetPassword(
    Mutation$ResetPassword instance,
    TRes Function(Mutation$ResetPassword) then,
  ) = _CopyWithImpl$Mutation$ResetPassword;

  factory CopyWith$Mutation$ResetPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ResetPassword;

  TRes call({
    Mutation$ResetPassword$resetPassword? resetPassword,
    String? $__typename,
  });
  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword;
}

class _CopyWithImpl$Mutation$ResetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword<TRes> {
  _CopyWithImpl$Mutation$ResetPassword(
    this._instance,
    this._then,
  );

  final Mutation$ResetPassword _instance;

  final TRes Function(Mutation$ResetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? resetPassword = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ResetPassword(
        resetPassword: resetPassword == _undefined
            ? _instance.resetPassword
            : (resetPassword as Mutation$ResetPassword$resetPassword?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword {
    final local$resetPassword = _instance.resetPassword;
    return local$resetPassword == null
        ? CopyWith$Mutation$ResetPassword$resetPassword.stub(_then(_instance))
        : CopyWith$Mutation$ResetPassword$resetPassword(
            local$resetPassword, (e) => call(resetPassword: e));
  }
}

class _CopyWithStubImpl$Mutation$ResetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword<TRes> {
  _CopyWithStubImpl$Mutation$ResetPassword(this._res);

  TRes _res;

  call({
    Mutation$ResetPassword$resetPassword? resetPassword,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ResetPassword$resetPassword<TRes> get resetPassword =>
      CopyWith$Mutation$ResetPassword$resetPassword.stub(_res);
}

const documentNodeMutationResetPassword = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ResetPassword'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'newPassword')),
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
        name: NameNode(value: 'resetPassword'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          ),
          ArgumentNode(
            name: NameNode(value: 'newPassword'),
            value: VariableNode(name: NameNode(value: 'newPassword')),
          ),
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
Mutation$ResetPassword _parserFn$Mutation$ResetPassword(
        Map<String, dynamic> data) =>
    Mutation$ResetPassword.fromJson(data);
typedef OnMutationCompleted$Mutation$ResetPassword = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ResetPassword?,
);

class Options$Mutation$ResetPassword
    extends graphql.MutationOptions<Mutation$ResetPassword> {
  Options$Mutation$ResetPassword({
    String? operationName,
    required Variables$Mutation$ResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ResetPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ResetPassword>? update,
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
                        : _parserFn$Mutation$ResetPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationResetPassword,
          parserFn: _parserFn$Mutation$ResetPassword,
        );

  final OnMutationCompleted$Mutation$ResetPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ResetPassword
    extends graphql.WatchQueryOptions<Mutation$ResetPassword> {
  WatchOptions$Mutation$ResetPassword({
    String? operationName,
    required Variables$Mutation$ResetPassword variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
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
          document: documentNodeMutationResetPassword,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ResetPassword,
        );
}

extension ClientExtension$Mutation$ResetPassword on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ResetPassword>> mutate$ResetPassword(
          Options$Mutation$ResetPassword options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ResetPassword> watchMutation$ResetPassword(
          WatchOptions$Mutation$ResetPassword options) =>
      this.watchMutation(options);
}

class Mutation$ResetPassword$HookResult {
  Mutation$ResetPassword$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ResetPassword runMutation;

  final graphql.QueryResult<Mutation$ResetPassword> result;
}

Mutation$ResetPassword$HookResult useMutation$ResetPassword(
    [WidgetOptions$Mutation$ResetPassword? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ResetPassword());
  return Mutation$ResetPassword$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ResetPassword> useWatchMutation$ResetPassword(
        WatchOptions$Mutation$ResetPassword options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ResetPassword
    extends graphql.MutationOptions<Mutation$ResetPassword> {
  WidgetOptions$Mutation$ResetPassword({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ResetPassword? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ResetPassword? onCompleted,
    graphql.OnMutationUpdate<Mutation$ResetPassword>? update,
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
                        : _parserFn$Mutation$ResetPassword(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationResetPassword,
          parserFn: _parserFn$Mutation$ResetPassword,
        );

  final OnMutationCompleted$Mutation$ResetPassword? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ResetPassword
    = graphql.MultiSourceResult<Mutation$ResetPassword> Function(
  Variables$Mutation$ResetPassword, {
  Object? optimisticResult,
  Mutation$ResetPassword? typedOptimisticResult,
});
typedef Builder$Mutation$ResetPassword = widgets.Widget Function(
  RunMutation$Mutation$ResetPassword,
  graphql.QueryResult<Mutation$ResetPassword>?,
);

class Mutation$ResetPassword$Widget
    extends graphql_flutter.Mutation<Mutation$ResetPassword> {
  Mutation$ResetPassword$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ResetPassword? options,
    required Builder$Mutation$ResetPassword builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ResetPassword(),
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

class Mutation$ResetPassword$resetPassword {
  Mutation$ResetPassword$resetPassword({
    required this.message,
    this.$__typename = 'ResetPasswordResponse',
  });

  factory Mutation$ResetPassword$resetPassword.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ResetPassword$resetPassword(
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
    if (!(other is Mutation$ResetPassword$resetPassword) ||
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

extension UtilityExtension$Mutation$ResetPassword$resetPassword
    on Mutation$ResetPassword$resetPassword {
  CopyWith$Mutation$ResetPassword$resetPassword<
          Mutation$ResetPassword$resetPassword>
      get copyWith => CopyWith$Mutation$ResetPassword$resetPassword(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  factory CopyWith$Mutation$ResetPassword$resetPassword(
    Mutation$ResetPassword$resetPassword instance,
    TRes Function(Mutation$ResetPassword$resetPassword) then,
  ) = _CopyWithImpl$Mutation$ResetPassword$resetPassword;

  factory CopyWith$Mutation$ResetPassword$resetPassword.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ResetPassword$resetPassword;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ResetPassword$resetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  _CopyWithImpl$Mutation$ResetPassword$resetPassword(
    this._instance,
    this._then,
  );

  final Mutation$ResetPassword$resetPassword _instance;

  final TRes Function(Mutation$ResetPassword$resetPassword) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ResetPassword$resetPassword(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ResetPassword$resetPassword<TRes>
    implements CopyWith$Mutation$ResetPassword$resetPassword<TRes> {
  _CopyWithStubImpl$Mutation$ResetPassword$resetPassword(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddFamilyMember {
  factory Variables$Mutation$AddFamilyMember({
    required String relatedUserId,
    required String relationship,
    required String accessLevel,
  }) =>
      Variables$Mutation$AddFamilyMember._({
        r'relatedUserId': relatedUserId,
        r'relationship': relationship,
        r'accessLevel': accessLevel,
      });

  Variables$Mutation$AddFamilyMember._(this._$data);

  factory Variables$Mutation$AddFamilyMember.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$relatedUserId = data['relatedUserId'];
    result$data['relatedUserId'] = (l$relatedUserId as String);
    final l$relationship = data['relationship'];
    result$data['relationship'] = (l$relationship as String);
    final l$accessLevel = data['accessLevel'];
    result$data['accessLevel'] = (l$accessLevel as String);
    return Variables$Mutation$AddFamilyMember._(result$data);
  }

  Map<String, dynamic> _$data;

  String get relatedUserId => (_$data['relatedUserId'] as String);

  String get relationship => (_$data['relationship'] as String);

  String get accessLevel => (_$data['accessLevel'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$relatedUserId = relatedUserId;
    result$data['relatedUserId'] = l$relatedUserId;
    final l$relationship = relationship;
    result$data['relationship'] = l$relationship;
    final l$accessLevel = accessLevel;
    result$data['accessLevel'] = l$accessLevel;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddFamilyMember<
          Variables$Mutation$AddFamilyMember>
      get copyWith => CopyWith$Variables$Mutation$AddFamilyMember(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$relatedUserId = relatedUserId;
    final lOther$relatedUserId = other.relatedUserId;
    if (l$relatedUserId != lOther$relatedUserId) {
      return false;
    }
    final l$relationship = relationship;
    final lOther$relationship = other.relationship;
    if (l$relationship != lOther$relationship) {
      return false;
    }
    final l$accessLevel = accessLevel;
    final lOther$accessLevel = other.accessLevel;
    if (l$accessLevel != lOther$accessLevel) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$relatedUserId = relatedUserId;
    final l$relationship = relationship;
    final l$accessLevel = accessLevel;
    return Object.hashAll([
      l$relatedUserId,
      l$relationship,
      l$accessLevel,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddFamilyMember<TRes> {
  factory CopyWith$Variables$Mutation$AddFamilyMember(
    Variables$Mutation$AddFamilyMember instance,
    TRes Function(Variables$Mutation$AddFamilyMember) then,
  ) = _CopyWithImpl$Variables$Mutation$AddFamilyMember;

  factory CopyWith$Variables$Mutation$AddFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddFamilyMember;

  TRes call({
    String? relatedUserId,
    String? relationship,
    String? accessLevel,
  });
}

class _CopyWithImpl$Variables$Mutation$AddFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$AddFamilyMember<TRes> {
  _CopyWithImpl$Variables$Mutation$AddFamilyMember(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddFamilyMember _instance;

  final TRes Function(Variables$Mutation$AddFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? relatedUserId = _undefined,
    Object? relationship = _undefined,
    Object? accessLevel = _undefined,
  }) =>
      _then(Variables$Mutation$AddFamilyMember._({
        ..._instance._$data,
        if (relatedUserId != _undefined && relatedUserId != null)
          'relatedUserId': (relatedUserId as String),
        if (relationship != _undefined && relationship != null)
          'relationship': (relationship as String),
        if (accessLevel != _undefined && accessLevel != null)
          'accessLevel': (accessLevel as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$AddFamilyMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddFamilyMember(this._res);

  TRes _res;

  call({
    String? relatedUserId,
    String? relationship,
    String? accessLevel,
  }) =>
      _res;
}

class Mutation$AddFamilyMember {
  Mutation$AddFamilyMember({
    this.addFamilyMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddFamilyMember.fromJson(Map<String, dynamic> json) {
    final l$addFamilyMember = json['addFamilyMember'];
    final l$$__typename = json['__typename'];
    return Mutation$AddFamilyMember(
      addFamilyMember: l$addFamilyMember == null
          ? null
          : Mutation$AddFamilyMember$addFamilyMember.fromJson(
              (l$addFamilyMember as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddFamilyMember$addFamilyMember? addFamilyMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addFamilyMember = addFamilyMember;
    _resultData['addFamilyMember'] = l$addFamilyMember?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addFamilyMember = addFamilyMember;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addFamilyMember,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addFamilyMember = addFamilyMember;
    final lOther$addFamilyMember = other.addFamilyMember;
    if (l$addFamilyMember != lOther$addFamilyMember) {
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

extension UtilityExtension$Mutation$AddFamilyMember
    on Mutation$AddFamilyMember {
  CopyWith$Mutation$AddFamilyMember<Mutation$AddFamilyMember> get copyWith =>
      CopyWith$Mutation$AddFamilyMember(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddFamilyMember<TRes> {
  factory CopyWith$Mutation$AddFamilyMember(
    Mutation$AddFamilyMember instance,
    TRes Function(Mutation$AddFamilyMember) then,
  ) = _CopyWithImpl$Mutation$AddFamilyMember;

  factory CopyWith$Mutation$AddFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddFamilyMember;

  TRes call({
    Mutation$AddFamilyMember$addFamilyMember? addFamilyMember,
    String? $__typename,
  });
  CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> get addFamilyMember;
}

class _CopyWithImpl$Mutation$AddFamilyMember<TRes>
    implements CopyWith$Mutation$AddFamilyMember<TRes> {
  _CopyWithImpl$Mutation$AddFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$AddFamilyMember _instance;

  final TRes Function(Mutation$AddFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addFamilyMember = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddFamilyMember(
        addFamilyMember: addFamilyMember == _undefined
            ? _instance.addFamilyMember
            : (addFamilyMember as Mutation$AddFamilyMember$addFamilyMember?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> get addFamilyMember {
    final local$addFamilyMember = _instance.addFamilyMember;
    return local$addFamilyMember == null
        ? CopyWith$Mutation$AddFamilyMember$addFamilyMember.stub(
            _then(_instance))
        : CopyWith$Mutation$AddFamilyMember$addFamilyMember(
            local$addFamilyMember, (e) => call(addFamilyMember: e));
  }
}

class _CopyWithStubImpl$Mutation$AddFamilyMember<TRes>
    implements CopyWith$Mutation$AddFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$AddFamilyMember(this._res);

  TRes _res;

  call({
    Mutation$AddFamilyMember$addFamilyMember? addFamilyMember,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> get addFamilyMember =>
      CopyWith$Mutation$AddFamilyMember$addFamilyMember.stub(_res);
}

const documentNodeMutationAddFamilyMember = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddFamilyMember'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'relatedUserId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'relationship')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'accessLevel')),
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
        name: NameNode(value: 'addFamilyMember'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'relatedUserId'),
            value: VariableNode(name: NameNode(value: 'relatedUserId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'relationship'),
            value: VariableNode(name: NameNode(value: 'relationship')),
          ),
          ArgumentNode(
            name: NameNode(value: 'accessLevel'),
            value: VariableNode(name: NameNode(value: 'accessLevel')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'memberId'),
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
Mutation$AddFamilyMember _parserFn$Mutation$AddFamilyMember(
        Map<String, dynamic> data) =>
    Mutation$AddFamilyMember.fromJson(data);
typedef OnMutationCompleted$Mutation$AddFamilyMember = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddFamilyMember?,
);

class Options$Mutation$AddFamilyMember
    extends graphql.MutationOptions<Mutation$AddFamilyMember> {
  Options$Mutation$AddFamilyMember({
    String? operationName,
    required Variables$Mutation$AddFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddFamilyMember>? update,
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
                        : _parserFn$Mutation$AddFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddFamilyMember,
          parserFn: _parserFn$Mutation$AddFamilyMember,
        );

  final OnMutationCompleted$Mutation$AddFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddFamilyMember
    extends graphql.WatchQueryOptions<Mutation$AddFamilyMember> {
  WatchOptions$Mutation$AddFamilyMember({
    String? operationName,
    required Variables$Mutation$AddFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddFamilyMember? typedOptimisticResult,
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
          document: documentNodeMutationAddFamilyMember,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddFamilyMember,
        );
}

extension ClientExtension$Mutation$AddFamilyMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddFamilyMember>> mutate$AddFamilyMember(
          Options$Mutation$AddFamilyMember options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddFamilyMember>
      watchMutation$AddFamilyMember(
              WatchOptions$Mutation$AddFamilyMember options) =>
          this.watchMutation(options);
}

class Mutation$AddFamilyMember$HookResult {
  Mutation$AddFamilyMember$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddFamilyMember runMutation;

  final graphql.QueryResult<Mutation$AddFamilyMember> result;
}

Mutation$AddFamilyMember$HookResult useMutation$AddFamilyMember(
    [WidgetOptions$Mutation$AddFamilyMember? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddFamilyMember());
  return Mutation$AddFamilyMember$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddFamilyMember>
    useWatchMutation$AddFamilyMember(
            WatchOptions$Mutation$AddFamilyMember options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddFamilyMember
    extends graphql.MutationOptions<Mutation$AddFamilyMember> {
  WidgetOptions$Mutation$AddFamilyMember({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddFamilyMember>? update,
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
                        : _parserFn$Mutation$AddFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddFamilyMember,
          parserFn: _parserFn$Mutation$AddFamilyMember,
        );

  final OnMutationCompleted$Mutation$AddFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddFamilyMember
    = graphql.MultiSourceResult<Mutation$AddFamilyMember> Function(
  Variables$Mutation$AddFamilyMember, {
  Object? optimisticResult,
  Mutation$AddFamilyMember? typedOptimisticResult,
});
typedef Builder$Mutation$AddFamilyMember = widgets.Widget Function(
  RunMutation$Mutation$AddFamilyMember,
  graphql.QueryResult<Mutation$AddFamilyMember>?,
);

class Mutation$AddFamilyMember$Widget
    extends graphql_flutter.Mutation<Mutation$AddFamilyMember> {
  Mutation$AddFamilyMember$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddFamilyMember? options,
    required Builder$Mutation$AddFamilyMember builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddFamilyMember(),
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

class Mutation$AddFamilyMember$addFamilyMember {
  Mutation$AddFamilyMember$addFamilyMember({
    required this.memberId,
    required this.message,
    this.$__typename = 'AddFamilyMemberResponse',
  });

  factory Mutation$AddFamilyMember$addFamilyMember.fromJson(
      Map<String, dynamic> json) {
    final l$memberId = json['memberId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$AddFamilyMember$addFamilyMember(
      memberId: (l$memberId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String memberId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$memberId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddFamilyMember$addFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
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

extension UtilityExtension$Mutation$AddFamilyMember$addFamilyMember
    on Mutation$AddFamilyMember$addFamilyMember {
  CopyWith$Mutation$AddFamilyMember$addFamilyMember<
          Mutation$AddFamilyMember$addFamilyMember>
      get copyWith => CopyWith$Mutation$AddFamilyMember$addFamilyMember(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> {
  factory CopyWith$Mutation$AddFamilyMember$addFamilyMember(
    Mutation$AddFamilyMember$addFamilyMember instance,
    TRes Function(Mutation$AddFamilyMember$addFamilyMember) then,
  ) = _CopyWithImpl$Mutation$AddFamilyMember$addFamilyMember;

  factory CopyWith$Mutation$AddFamilyMember$addFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddFamilyMember$addFamilyMember;

  TRes call({
    String? memberId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddFamilyMember$addFamilyMember<TRes>
    implements CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> {
  _CopyWithImpl$Mutation$AddFamilyMember$addFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$AddFamilyMember$addFamilyMember _instance;

  final TRes Function(Mutation$AddFamilyMember$addFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddFamilyMember$addFamilyMember(
        memberId: memberId == _undefined || memberId == null
            ? _instance.memberId
            : (memberId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddFamilyMember$addFamilyMember<TRes>
    implements CopyWith$Mutation$AddFamilyMember$addFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$AddFamilyMember$addFamilyMember(this._res);

  TRes _res;

  call({
    String? memberId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateFamilyMember {
  factory Variables$Mutation$UpdateFamilyMember({
    required String memberId,
    String? relationship,
    String? accessLevel,
  }) =>
      Variables$Mutation$UpdateFamilyMember._({
        r'memberId': memberId,
        if (relationship != null) r'relationship': relationship,
        if (accessLevel != null) r'accessLevel': accessLevel,
      });

  Variables$Mutation$UpdateFamilyMember._(this._$data);

  factory Variables$Mutation$UpdateFamilyMember.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$memberId = data['memberId'];
    result$data['memberId'] = (l$memberId as String);
    if (data.containsKey('relationship')) {
      final l$relationship = data['relationship'];
      result$data['relationship'] = (l$relationship as String?);
    }
    if (data.containsKey('accessLevel')) {
      final l$accessLevel = data['accessLevel'];
      result$data['accessLevel'] = (l$accessLevel as String?);
    }
    return Variables$Mutation$UpdateFamilyMember._(result$data);
  }

  Map<String, dynamic> _$data;

  String get memberId => (_$data['memberId'] as String);

  String? get relationship => (_$data['relationship'] as String?);

  String? get accessLevel => (_$data['accessLevel'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    if (_$data.containsKey('relationship')) {
      final l$relationship = relationship;
      result$data['relationship'] = l$relationship;
    }
    if (_$data.containsKey('accessLevel')) {
      final l$accessLevel = accessLevel;
      result$data['accessLevel'] = l$accessLevel;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateFamilyMember<
          Variables$Mutation$UpdateFamilyMember>
      get copyWith => CopyWith$Variables$Mutation$UpdateFamilyMember(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    final l$relationship = relationship;
    final lOther$relationship = other.relationship;
    if (_$data.containsKey('relationship') !=
        other._$data.containsKey('relationship')) {
      return false;
    }
    if (l$relationship != lOther$relationship) {
      return false;
    }
    final l$accessLevel = accessLevel;
    final lOther$accessLevel = other.accessLevel;
    if (_$data.containsKey('accessLevel') !=
        other._$data.containsKey('accessLevel')) {
      return false;
    }
    if (l$accessLevel != lOther$accessLevel) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    final l$relationship = relationship;
    final l$accessLevel = accessLevel;
    return Object.hashAll([
      l$memberId,
      _$data.containsKey('relationship') ? l$relationship : const {},
      _$data.containsKey('accessLevel') ? l$accessLevel : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateFamilyMember<TRes> {
  factory CopyWith$Variables$Mutation$UpdateFamilyMember(
    Variables$Mutation$UpdateFamilyMember instance,
    TRes Function(Variables$Mutation$UpdateFamilyMember) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateFamilyMember;

  factory CopyWith$Variables$Mutation$UpdateFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateFamilyMember;

  TRes call({
    String? memberId,
    String? relationship,
    String? accessLevel,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$UpdateFamilyMember<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateFamilyMember(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateFamilyMember _instance;

  final TRes Function(Variables$Mutation$UpdateFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? relationship = _undefined,
    Object? accessLevel = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateFamilyMember._({
        ..._instance._$data,
        if (memberId != _undefined && memberId != null)
          'memberId': (memberId as String),
        if (relationship != _undefined)
          'relationship': (relationship as String?),
        if (accessLevel != _undefined) 'accessLevel': (accessLevel as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$UpdateFamilyMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateFamilyMember(this._res);

  TRes _res;

  call({
    String? memberId,
    String? relationship,
    String? accessLevel,
  }) =>
      _res;
}

class Mutation$UpdateFamilyMember {
  Mutation$UpdateFamilyMember({
    this.updateFamilyMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateFamilyMember.fromJson(Map<String, dynamic> json) {
    final l$updateFamilyMember = json['updateFamilyMember'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateFamilyMember(
      updateFamilyMember: l$updateFamilyMember == null
          ? null
          : Mutation$UpdateFamilyMember$updateFamilyMember.fromJson(
              (l$updateFamilyMember as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateFamilyMember$updateFamilyMember? updateFamilyMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateFamilyMember = updateFamilyMember;
    _resultData['updateFamilyMember'] = l$updateFamilyMember?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateFamilyMember = updateFamilyMember;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateFamilyMember,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateFamilyMember = updateFamilyMember;
    final lOther$updateFamilyMember = other.updateFamilyMember;
    if (l$updateFamilyMember != lOther$updateFamilyMember) {
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

extension UtilityExtension$Mutation$UpdateFamilyMember
    on Mutation$UpdateFamilyMember {
  CopyWith$Mutation$UpdateFamilyMember<Mutation$UpdateFamilyMember>
      get copyWith => CopyWith$Mutation$UpdateFamilyMember(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateFamilyMember<TRes> {
  factory CopyWith$Mutation$UpdateFamilyMember(
    Mutation$UpdateFamilyMember instance,
    TRes Function(Mutation$UpdateFamilyMember) then,
  ) = _CopyWithImpl$Mutation$UpdateFamilyMember;

  factory CopyWith$Mutation$UpdateFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateFamilyMember;

  TRes call({
    Mutation$UpdateFamilyMember$updateFamilyMember? updateFamilyMember,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes>
      get updateFamilyMember;
}

class _CopyWithImpl$Mutation$UpdateFamilyMember<TRes>
    implements CopyWith$Mutation$UpdateFamilyMember<TRes> {
  _CopyWithImpl$Mutation$UpdateFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$UpdateFamilyMember _instance;

  final TRes Function(Mutation$UpdateFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateFamilyMember = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateFamilyMember(
        updateFamilyMember: updateFamilyMember == _undefined
            ? _instance.updateFamilyMember
            : (updateFamilyMember
                as Mutation$UpdateFamilyMember$updateFamilyMember?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes>
      get updateFamilyMember {
    final local$updateFamilyMember = _instance.updateFamilyMember;
    return local$updateFamilyMember == null
        ? CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember(
            local$updateFamilyMember, (e) => call(updateFamilyMember: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateFamilyMember<TRes>
    implements CopyWith$Mutation$UpdateFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$UpdateFamilyMember(this._res);

  TRes _res;

  call({
    Mutation$UpdateFamilyMember$updateFamilyMember? updateFamilyMember,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes>
      get updateFamilyMember =>
          CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember.stub(_res);
}

const documentNodeMutationUpdateFamilyMember = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateFamilyMember'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'memberId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'relationship')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'accessLevel')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateFamilyMember'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'memberId'),
            value: VariableNode(name: NameNode(value: 'memberId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'relationship'),
            value: VariableNode(name: NameNode(value: 'relationship')),
          ),
          ArgumentNode(
            name: NameNode(value: 'accessLevel'),
            value: VariableNode(name: NameNode(value: 'accessLevel')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'memberId'),
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
Mutation$UpdateFamilyMember _parserFn$Mutation$UpdateFamilyMember(
        Map<String, dynamic> data) =>
    Mutation$UpdateFamilyMember.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateFamilyMember = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateFamilyMember?,
);

class Options$Mutation$UpdateFamilyMember
    extends graphql.MutationOptions<Mutation$UpdateFamilyMember> {
  Options$Mutation$UpdateFamilyMember({
    String? operationName,
    required Variables$Mutation$UpdateFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateFamilyMember>? update,
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
                        : _parserFn$Mutation$UpdateFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateFamilyMember,
          parserFn: _parserFn$Mutation$UpdateFamilyMember,
        );

  final OnMutationCompleted$Mutation$UpdateFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateFamilyMember
    extends graphql.WatchQueryOptions<Mutation$UpdateFamilyMember> {
  WatchOptions$Mutation$UpdateFamilyMember({
    String? operationName,
    required Variables$Mutation$UpdateFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateFamilyMember? typedOptimisticResult,
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
          document: documentNodeMutationUpdateFamilyMember,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateFamilyMember,
        );
}

extension ClientExtension$Mutation$UpdateFamilyMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateFamilyMember>>
      mutate$UpdateFamilyMember(
              Options$Mutation$UpdateFamilyMember options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateFamilyMember>
      watchMutation$UpdateFamilyMember(
              WatchOptions$Mutation$UpdateFamilyMember options) =>
          this.watchMutation(options);
}

class Mutation$UpdateFamilyMember$HookResult {
  Mutation$UpdateFamilyMember$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateFamilyMember runMutation;

  final graphql.QueryResult<Mutation$UpdateFamilyMember> result;
}

Mutation$UpdateFamilyMember$HookResult useMutation$UpdateFamilyMember(
    [WidgetOptions$Mutation$UpdateFamilyMember? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateFamilyMember());
  return Mutation$UpdateFamilyMember$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateFamilyMember>
    useWatchMutation$UpdateFamilyMember(
            WatchOptions$Mutation$UpdateFamilyMember options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateFamilyMember
    extends graphql.MutationOptions<Mutation$UpdateFamilyMember> {
  WidgetOptions$Mutation$UpdateFamilyMember({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateFamilyMember>? update,
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
                        : _parserFn$Mutation$UpdateFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateFamilyMember,
          parserFn: _parserFn$Mutation$UpdateFamilyMember,
        );

  final OnMutationCompleted$Mutation$UpdateFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateFamilyMember
    = graphql.MultiSourceResult<Mutation$UpdateFamilyMember> Function(
  Variables$Mutation$UpdateFamilyMember, {
  Object? optimisticResult,
  Mutation$UpdateFamilyMember? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateFamilyMember = widgets.Widget Function(
  RunMutation$Mutation$UpdateFamilyMember,
  graphql.QueryResult<Mutation$UpdateFamilyMember>?,
);

class Mutation$UpdateFamilyMember$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateFamilyMember> {
  Mutation$UpdateFamilyMember$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateFamilyMember? options,
    required Builder$Mutation$UpdateFamilyMember builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateFamilyMember(),
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

class Mutation$UpdateFamilyMember$updateFamilyMember {
  Mutation$UpdateFamilyMember$updateFamilyMember({
    required this.memberId,
    required this.message,
    this.$__typename = 'UpdateFamilyMemberResponse',
  });

  factory Mutation$UpdateFamilyMember$updateFamilyMember.fromJson(
      Map<String, dynamic> json) {
    final l$memberId = json['memberId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateFamilyMember$updateFamilyMember(
      memberId: (l$memberId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String memberId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$memberId = memberId;
    _resultData['memberId'] = l$memberId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$memberId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateFamilyMember$updateFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
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

extension UtilityExtension$Mutation$UpdateFamilyMember$updateFamilyMember
    on Mutation$UpdateFamilyMember$updateFamilyMember {
  CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<
          Mutation$UpdateFamilyMember$updateFamilyMember>
      get copyWith => CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes> {
  factory CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember(
    Mutation$UpdateFamilyMember$updateFamilyMember instance,
    TRes Function(Mutation$UpdateFamilyMember$updateFamilyMember) then,
  ) = _CopyWithImpl$Mutation$UpdateFamilyMember$updateFamilyMember;

  factory CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateFamilyMember$updateFamilyMember;

  TRes call({
    String? memberId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateFamilyMember$updateFamilyMember<TRes>
    implements CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes> {
  _CopyWithImpl$Mutation$UpdateFamilyMember$updateFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$UpdateFamilyMember$updateFamilyMember _instance;

  final TRes Function(Mutation$UpdateFamilyMember$updateFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? memberId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateFamilyMember$updateFamilyMember(
        memberId: memberId == _undefined || memberId == null
            ? _instance.memberId
            : (memberId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateFamilyMember$updateFamilyMember<TRes>
    implements CopyWith$Mutation$UpdateFamilyMember$updateFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$UpdateFamilyMember$updateFamilyMember(this._res);

  TRes _res;

  call({
    String? memberId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteFamilyMember {
  factory Variables$Mutation$DeleteFamilyMember({required String memberId}) =>
      Variables$Mutation$DeleteFamilyMember._({
        r'memberId': memberId,
      });

  Variables$Mutation$DeleteFamilyMember._(this._$data);

  factory Variables$Mutation$DeleteFamilyMember.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$memberId = data['memberId'];
    result$data['memberId'] = (l$memberId as String);
    return Variables$Mutation$DeleteFamilyMember._(result$data);
  }

  Map<String, dynamic> _$data;

  String get memberId => (_$data['memberId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$memberId = memberId;
    result$data['memberId'] = l$memberId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteFamilyMember<
          Variables$Mutation$DeleteFamilyMember>
      get copyWith => CopyWith$Variables$Mutation$DeleteFamilyMember(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$memberId = memberId;
    final lOther$memberId = other.memberId;
    if (l$memberId != lOther$memberId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$memberId = memberId;
    return Object.hashAll([l$memberId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteFamilyMember<TRes> {
  factory CopyWith$Variables$Mutation$DeleteFamilyMember(
    Variables$Mutation$DeleteFamilyMember instance,
    TRes Function(Variables$Mutation$DeleteFamilyMember) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteFamilyMember;

  factory CopyWith$Variables$Mutation$DeleteFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteFamilyMember;

  TRes call({String? memberId});
}

class _CopyWithImpl$Variables$Mutation$DeleteFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$DeleteFamilyMember<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteFamilyMember(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteFamilyMember _instance;

  final TRes Function(Variables$Mutation$DeleteFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? memberId = _undefined}) =>
      _then(Variables$Mutation$DeleteFamilyMember._({
        ..._instance._$data,
        if (memberId != _undefined && memberId != null)
          'memberId': (memberId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteFamilyMember<TRes>
    implements CopyWith$Variables$Mutation$DeleteFamilyMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteFamilyMember(this._res);

  TRes _res;

  call({String? memberId}) => _res;
}

class Mutation$DeleteFamilyMember {
  Mutation$DeleteFamilyMember({
    this.deleteFamilyMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteFamilyMember.fromJson(Map<String, dynamic> json) {
    final l$deleteFamilyMember = json['deleteFamilyMember'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteFamilyMember(
      deleteFamilyMember: l$deleteFamilyMember == null
          ? null
          : Mutation$DeleteFamilyMember$deleteFamilyMember.fromJson(
              (l$deleteFamilyMember as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteFamilyMember$deleteFamilyMember? deleteFamilyMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteFamilyMember = deleteFamilyMember;
    _resultData['deleteFamilyMember'] = l$deleteFamilyMember?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteFamilyMember = deleteFamilyMember;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteFamilyMember,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteFamilyMember) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteFamilyMember = deleteFamilyMember;
    final lOther$deleteFamilyMember = other.deleteFamilyMember;
    if (l$deleteFamilyMember != lOther$deleteFamilyMember) {
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

extension UtilityExtension$Mutation$DeleteFamilyMember
    on Mutation$DeleteFamilyMember {
  CopyWith$Mutation$DeleteFamilyMember<Mutation$DeleteFamilyMember>
      get copyWith => CopyWith$Mutation$DeleteFamilyMember(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteFamilyMember<TRes> {
  factory CopyWith$Mutation$DeleteFamilyMember(
    Mutation$DeleteFamilyMember instance,
    TRes Function(Mutation$DeleteFamilyMember) then,
  ) = _CopyWithImpl$Mutation$DeleteFamilyMember;

  factory CopyWith$Mutation$DeleteFamilyMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteFamilyMember;

  TRes call({
    Mutation$DeleteFamilyMember$deleteFamilyMember? deleteFamilyMember,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes>
      get deleteFamilyMember;
}

class _CopyWithImpl$Mutation$DeleteFamilyMember<TRes>
    implements CopyWith$Mutation$DeleteFamilyMember<TRes> {
  _CopyWithImpl$Mutation$DeleteFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$DeleteFamilyMember _instance;

  final TRes Function(Mutation$DeleteFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteFamilyMember = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteFamilyMember(
        deleteFamilyMember: deleteFamilyMember == _undefined
            ? _instance.deleteFamilyMember
            : (deleteFamilyMember
                as Mutation$DeleteFamilyMember$deleteFamilyMember?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes>
      get deleteFamilyMember {
    final local$deleteFamilyMember = _instance.deleteFamilyMember;
    return local$deleteFamilyMember == null
        ? CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember(
            local$deleteFamilyMember, (e) => call(deleteFamilyMember: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteFamilyMember<TRes>
    implements CopyWith$Mutation$DeleteFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$DeleteFamilyMember(this._res);

  TRes _res;

  call({
    Mutation$DeleteFamilyMember$deleteFamilyMember? deleteFamilyMember,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes>
      get deleteFamilyMember =>
          CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember.stub(_res);
}

const documentNodeMutationDeleteFamilyMember = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteFamilyMember'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'memberId')),
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
        name: NameNode(value: 'deleteFamilyMember'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'memberId'),
            value: VariableNode(name: NameNode(value: 'memberId')),
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
Mutation$DeleteFamilyMember _parserFn$Mutation$DeleteFamilyMember(
        Map<String, dynamic> data) =>
    Mutation$DeleteFamilyMember.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteFamilyMember = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteFamilyMember?,
);

class Options$Mutation$DeleteFamilyMember
    extends graphql.MutationOptions<Mutation$DeleteFamilyMember> {
  Options$Mutation$DeleteFamilyMember({
    String? operationName,
    required Variables$Mutation$DeleteFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteFamilyMember>? update,
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
                        : _parserFn$Mutation$DeleteFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteFamilyMember,
          parserFn: _parserFn$Mutation$DeleteFamilyMember,
        );

  final OnMutationCompleted$Mutation$DeleteFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteFamilyMember
    extends graphql.WatchQueryOptions<Mutation$DeleteFamilyMember> {
  WatchOptions$Mutation$DeleteFamilyMember({
    String? operationName,
    required Variables$Mutation$DeleteFamilyMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteFamilyMember? typedOptimisticResult,
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
          document: documentNodeMutationDeleteFamilyMember,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteFamilyMember,
        );
}

extension ClientExtension$Mutation$DeleteFamilyMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteFamilyMember>>
      mutate$DeleteFamilyMember(
              Options$Mutation$DeleteFamilyMember options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteFamilyMember>
      watchMutation$DeleteFamilyMember(
              WatchOptions$Mutation$DeleteFamilyMember options) =>
          this.watchMutation(options);
}

class Mutation$DeleteFamilyMember$HookResult {
  Mutation$DeleteFamilyMember$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteFamilyMember runMutation;

  final graphql.QueryResult<Mutation$DeleteFamilyMember> result;
}

Mutation$DeleteFamilyMember$HookResult useMutation$DeleteFamilyMember(
    [WidgetOptions$Mutation$DeleteFamilyMember? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteFamilyMember());
  return Mutation$DeleteFamilyMember$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteFamilyMember>
    useWatchMutation$DeleteFamilyMember(
            WatchOptions$Mutation$DeleteFamilyMember options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteFamilyMember
    extends graphql.MutationOptions<Mutation$DeleteFamilyMember> {
  WidgetOptions$Mutation$DeleteFamilyMember({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteFamilyMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteFamilyMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteFamilyMember>? update,
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
                        : _parserFn$Mutation$DeleteFamilyMember(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteFamilyMember,
          parserFn: _parserFn$Mutation$DeleteFamilyMember,
        );

  final OnMutationCompleted$Mutation$DeleteFamilyMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteFamilyMember
    = graphql.MultiSourceResult<Mutation$DeleteFamilyMember> Function(
  Variables$Mutation$DeleteFamilyMember, {
  Object? optimisticResult,
  Mutation$DeleteFamilyMember? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteFamilyMember = widgets.Widget Function(
  RunMutation$Mutation$DeleteFamilyMember,
  graphql.QueryResult<Mutation$DeleteFamilyMember>?,
);

class Mutation$DeleteFamilyMember$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteFamilyMember> {
  Mutation$DeleteFamilyMember$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteFamilyMember? options,
    required Builder$Mutation$DeleteFamilyMember builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteFamilyMember(),
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

class Mutation$DeleteFamilyMember$deleteFamilyMember {
  Mutation$DeleteFamilyMember$deleteFamilyMember({
    required this.message,
    this.$__typename = 'DeleteFamilyMemberResponse',
  });

  factory Mutation$DeleteFamilyMember$deleteFamilyMember.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteFamilyMember$deleteFamilyMember(
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
    if (!(other is Mutation$DeleteFamilyMember$deleteFamilyMember) ||
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

extension UtilityExtension$Mutation$DeleteFamilyMember$deleteFamilyMember
    on Mutation$DeleteFamilyMember$deleteFamilyMember {
  CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<
          Mutation$DeleteFamilyMember$deleteFamilyMember>
      get copyWith => CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes> {
  factory CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember(
    Mutation$DeleteFamilyMember$deleteFamilyMember instance,
    TRes Function(Mutation$DeleteFamilyMember$deleteFamilyMember) then,
  ) = _CopyWithImpl$Mutation$DeleteFamilyMember$deleteFamilyMember;

  factory CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeleteFamilyMember$deleteFamilyMember;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes>
    implements CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes> {
  _CopyWithImpl$Mutation$DeleteFamilyMember$deleteFamilyMember(
    this._instance,
    this._then,
  );

  final Mutation$DeleteFamilyMember$deleteFamilyMember _instance;

  final TRes Function(Mutation$DeleteFamilyMember$deleteFamilyMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteFamilyMember$deleteFamilyMember(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes>
    implements CopyWith$Mutation$DeleteFamilyMember$deleteFamilyMember<TRes> {
  _CopyWithStubImpl$Mutation$DeleteFamilyMember$deleteFamilyMember(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
