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
    if (other is! Query$GetUser || runtimeType != other.runtimeType) {
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
    if (other is! Query$GetUser$getUser || runtimeType != other.runtimeType) {
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
    if (other is! Query$GetUserAchievements ||
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
    if (other is! Query$GetUserAchievements$getUserAchievements ||
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
    if (other is! Variables$Mutation$UpdateUser ||
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
    if (other is! Mutation$UpdateUser || runtimeType != other.runtimeType) {
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
    if (other is! Mutation$UpdateUser$updateUser ||
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
    if (other is! Mutation$DeleteUser || runtimeType != other.runtimeType) {
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
    if (other is! Mutation$DeleteUser$deleteUser ||
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
    if (other is! Variables$Mutation$RequestPasswordReset ||
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
    if (other is! Mutation$RequestPasswordReset ||
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
    if (other is! Mutation$RequestPasswordReset$requestPasswordReset ||
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
    required String resetCode,
    required String newPassword,
  }) =>
      Variables$Mutation$ResetPassword._({
        r'resetCode': resetCode,
        r'newPassword': newPassword,
      });

  Variables$Mutation$ResetPassword._(this._$data);

  factory Variables$Mutation$ResetPassword.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$resetCode = data['resetCode'];
    result$data['resetCode'] = (l$resetCode as String);
    final l$newPassword = data['newPassword'];
    result$data['newPassword'] = (l$newPassword as String);
    return Variables$Mutation$ResetPassword._(result$data);
  }

  Map<String, dynamic> _$data;

  String get resetCode => (_$data['resetCode'] as String);

  String get newPassword => (_$data['newPassword'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$resetCode = resetCode;
    result$data['resetCode'] = l$resetCode;
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
    if (other is! Variables$Mutation$ResetPassword ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$resetCode = resetCode;
    final lOther$resetCode = other.resetCode;
    if (l$resetCode != lOther$resetCode) {
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
    final l$resetCode = resetCode;
    final l$newPassword = newPassword;
    return Object.hashAll([
      l$resetCode,
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
    String? resetCode,
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
    Object? resetCode = _undefined,
    Object? newPassword = _undefined,
  }) =>
      _then(Variables$Mutation$ResetPassword._({
        ..._instance._$data,
        if (resetCode != _undefined && resetCode != null)
          'resetCode': (resetCode as String),
        if (newPassword != _undefined && newPassword != null)
          'newPassword': (newPassword as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ResetPassword<TRes>
    implements CopyWith$Variables$Mutation$ResetPassword<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ResetPassword(this._res);

  TRes _res;

  call({
    String? resetCode,
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
    if (other is! Mutation$ResetPassword || runtimeType != other.runtimeType) {
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
        variable: VariableNode(name: NameNode(value: 'resetCode')),
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
            name: NameNode(value: 'resetCode'),
            value: VariableNode(name: NameNode(value: 'resetCode')),
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
    if (other is! Mutation$ResetPassword$resetPassword ||
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

class Query$GetProfiles {
  Query$GetProfiles({
    this.getProfiles,
    this.$__typename = 'Query',
  });

  factory Query$GetProfiles.fromJson(Map<String, dynamic> json) {
    final l$getProfiles = json['getProfiles'];
    final l$$__typename = json['__typename'];
    return Query$GetProfiles(
      getProfiles: (l$getProfiles as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetProfiles$getProfiles.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProfiles$getProfiles?>? getProfiles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getProfiles = getProfiles;
    _resultData['getProfiles'] =
        l$getProfiles?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getProfiles = getProfiles;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getProfiles == null
          ? null
          : Object.hashAll(l$getProfiles.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProfiles || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getProfiles = getProfiles;
    final lOther$getProfiles = other.getProfiles;
    if (l$getProfiles != null && lOther$getProfiles != null) {
      if (l$getProfiles.length != lOther$getProfiles.length) {
        return false;
      }
      for (int i = 0; i < l$getProfiles.length; i++) {
        final l$getProfiles$entry = l$getProfiles[i];
        final lOther$getProfiles$entry = lOther$getProfiles[i];
        if (l$getProfiles$entry != lOther$getProfiles$entry) {
          return false;
        }
      }
    } else if (l$getProfiles != lOther$getProfiles) {
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

extension UtilityExtension$Query$GetProfiles on Query$GetProfiles {
  CopyWith$Query$GetProfiles<Query$GetProfiles> get copyWith =>
      CopyWith$Query$GetProfiles(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProfiles<TRes> {
  factory CopyWith$Query$GetProfiles(
    Query$GetProfiles instance,
    TRes Function(Query$GetProfiles) then,
  ) = _CopyWithImpl$Query$GetProfiles;

  factory CopyWith$Query$GetProfiles.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProfiles;

  TRes call({
    List<Query$GetProfiles$getProfiles?>? getProfiles,
    String? $__typename,
  });
  TRes getProfiles(
      Iterable<Query$GetProfiles$getProfiles?>? Function(
              Iterable<
                  CopyWith$Query$GetProfiles$getProfiles<
                      Query$GetProfiles$getProfiles>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetProfiles<TRes>
    implements CopyWith$Query$GetProfiles<TRes> {
  _CopyWithImpl$Query$GetProfiles(
    this._instance,
    this._then,
  );

  final Query$GetProfiles _instance;

  final TRes Function(Query$GetProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getProfiles = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProfiles(
        getProfiles: getProfiles == _undefined
            ? _instance.getProfiles
            : (getProfiles as List<Query$GetProfiles$getProfiles?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getProfiles(
          Iterable<Query$GetProfiles$getProfiles?>? Function(
                  Iterable<
                      CopyWith$Query$GetProfiles$getProfiles<
                          Query$GetProfiles$getProfiles>?>?)
              _fn) =>
      call(
          getProfiles: _fn(_instance.getProfiles?.map((e) => e == null
              ? null
              : CopyWith$Query$GetProfiles$getProfiles(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetProfiles<TRes>
    implements CopyWith$Query$GetProfiles<TRes> {
  _CopyWithStubImpl$Query$GetProfiles(this._res);

  TRes _res;

  call({
    List<Query$GetProfiles$getProfiles?>? getProfiles,
    String? $__typename,
  }) =>
      _res;

  getProfiles(_fn) => _res;
}

const documentNodeQueryGetProfiles = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProfiles'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getProfiles'),
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
            name: NameNode(value: 'name'),
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
Query$GetProfiles _parserFn$Query$GetProfiles(Map<String, dynamic> data) =>
    Query$GetProfiles.fromJson(data);
typedef OnQueryComplete$Query$GetProfiles = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetProfiles?,
);

class Options$Query$GetProfiles
    extends graphql.QueryOptions<Query$GetProfiles> {
  Options$Query$GetProfiles({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProfiles? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetProfiles? onComplete,
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
                    data == null ? null : _parserFn$Query$GetProfiles(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetProfiles,
          parserFn: _parserFn$Query$GetProfiles,
        );

  final OnQueryComplete$Query$GetProfiles? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetProfiles
    extends graphql.WatchQueryOptions<Query$GetProfiles> {
  WatchOptions$Query$GetProfiles({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetProfiles? typedOptimisticResult,
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
          document: documentNodeQueryGetProfiles,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetProfiles,
        );
}

class FetchMoreOptions$Query$GetProfiles extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetProfiles({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetProfiles,
        );
}

extension ClientExtension$Query$GetProfiles on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetProfiles>> query$GetProfiles(
          [Options$Query$GetProfiles? options]) async =>
      await this.query(options ?? Options$Query$GetProfiles());
  graphql.ObservableQuery<Query$GetProfiles> watchQuery$GetProfiles(
          [WatchOptions$Query$GetProfiles? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetProfiles());
  void writeQuery$GetProfiles({
    required Query$GetProfiles data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetProfiles)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetProfiles? readQuery$GetProfiles({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetProfiles)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetProfiles.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetProfiles> useQuery$GetProfiles(
        [Options$Query$GetProfiles? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetProfiles());
graphql.ObservableQuery<Query$GetProfiles> useWatchQuery$GetProfiles(
        [WatchOptions$Query$GetProfiles? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetProfiles());

class Query$GetProfiles$Widget
    extends graphql_flutter.Query<Query$GetProfiles> {
  Query$GetProfiles$Widget({
    widgets.Key? key,
    Options$Query$GetProfiles? options,
    required graphql_flutter.QueryBuilder<Query$GetProfiles> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetProfiles(),
          builder: builder,
        );
}

class Query$GetProfiles$getProfiles {
  Query$GetProfiles$getProfiles({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.createdAt,
    this.$__typename = 'ProfileDetail',
  });

  factory Query$GetProfiles$getProfiles.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$phoneNumber = json['phoneNumber'];
    final l$role = json['role'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetProfiles$getProfiles(
      id: (l$id as String),
      name: (l$name as String),
      phoneNumber: (l$phoneNumber as String),
      role: (l$role as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String phoneNumber;

  final String role;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$role = role;
    _resultData['role'] = l$role;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phoneNumber = phoneNumber;
    final l$role = role;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phoneNumber,
      l$role,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProfiles$getProfiles ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProfiles$getProfiles
    on Query$GetProfiles$getProfiles {
  CopyWith$Query$GetProfiles$getProfiles<Query$GetProfiles$getProfiles>
      get copyWith => CopyWith$Query$GetProfiles$getProfiles(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProfiles$getProfiles<TRes> {
  factory CopyWith$Query$GetProfiles$getProfiles(
    Query$GetProfiles$getProfiles instance,
    TRes Function(Query$GetProfiles$getProfiles) then,
  ) = _CopyWithImpl$Query$GetProfiles$getProfiles;

  factory CopyWith$Query$GetProfiles$getProfiles.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProfiles$getProfiles;

  TRes call({
    String? id,
    String? name,
    String? phoneNumber,
    String? role,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProfiles$getProfiles<TRes>
    implements CopyWith$Query$GetProfiles$getProfiles<TRes> {
  _CopyWithImpl$Query$GetProfiles$getProfiles(
    this._instance,
    this._then,
  );

  final Query$GetProfiles$getProfiles _instance;

  final TRes Function(Query$GetProfiles$getProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phoneNumber = _undefined,
    Object? role = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProfiles$getProfiles(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phoneNumber: phoneNumber == _undefined || phoneNumber == null
            ? _instance.phoneNumber
            : (phoneNumber as String),
        role: role == _undefined || role == null
            ? _instance.role
            : (role as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProfiles$getProfiles<TRes>
    implements CopyWith$Query$GetProfiles$getProfiles<TRes> {
  _CopyWithStubImpl$Query$GetProfiles$getProfiles(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phoneNumber,
    String? role,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSharedProfiles {
  Query$GetSharedProfiles({
    this.getSharedProfiles,
    this.$__typename = 'Query',
  });

  factory Query$GetSharedProfiles.fromJson(Map<String, dynamic> json) {
    final l$getSharedProfiles = json['getSharedProfiles'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedProfiles(
      getSharedProfiles: (l$getSharedProfiles as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetSharedProfiles$getSharedProfiles.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSharedProfiles$getSharedProfiles?>? getSharedProfiles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSharedProfiles = getSharedProfiles;
    _resultData['getSharedProfiles'] =
        l$getSharedProfiles?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSharedProfiles = getSharedProfiles;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSharedProfiles == null
          ? null
          : Object.hashAll(l$getSharedProfiles.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSharedProfiles || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSharedProfiles = getSharedProfiles;
    final lOther$getSharedProfiles = other.getSharedProfiles;
    if (l$getSharedProfiles != null && lOther$getSharedProfiles != null) {
      if (l$getSharedProfiles.length != lOther$getSharedProfiles.length) {
        return false;
      }
      for (int i = 0; i < l$getSharedProfiles.length; i++) {
        final l$getSharedProfiles$entry = l$getSharedProfiles[i];
        final lOther$getSharedProfiles$entry = lOther$getSharedProfiles[i];
        if (l$getSharedProfiles$entry != lOther$getSharedProfiles$entry) {
          return false;
        }
      }
    } else if (l$getSharedProfiles != lOther$getSharedProfiles) {
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

extension UtilityExtension$Query$GetSharedProfiles on Query$GetSharedProfiles {
  CopyWith$Query$GetSharedProfiles<Query$GetSharedProfiles> get copyWith =>
      CopyWith$Query$GetSharedProfiles(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetSharedProfiles<TRes> {
  factory CopyWith$Query$GetSharedProfiles(
    Query$GetSharedProfiles instance,
    TRes Function(Query$GetSharedProfiles) then,
  ) = _CopyWithImpl$Query$GetSharedProfiles;

  factory CopyWith$Query$GetSharedProfiles.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSharedProfiles;

  TRes call({
    List<Query$GetSharedProfiles$getSharedProfiles?>? getSharedProfiles,
    String? $__typename,
  });
  TRes getSharedProfiles(
      Iterable<Query$GetSharedProfiles$getSharedProfiles?>? Function(
              Iterable<
                  CopyWith$Query$GetSharedProfiles$getSharedProfiles<
                      Query$GetSharedProfiles$getSharedProfiles>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetSharedProfiles<TRes>
    implements CopyWith$Query$GetSharedProfiles<TRes> {
  _CopyWithImpl$Query$GetSharedProfiles(
    this._instance,
    this._then,
  );

  final Query$GetSharedProfiles _instance;

  final TRes Function(Query$GetSharedProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSharedProfiles = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedProfiles(
        getSharedProfiles: getSharedProfiles == _undefined
            ? _instance.getSharedProfiles
            : (getSharedProfiles
                as List<Query$GetSharedProfiles$getSharedProfiles?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getSharedProfiles(
          Iterable<Query$GetSharedProfiles$getSharedProfiles?>? Function(
                  Iterable<
                      CopyWith$Query$GetSharedProfiles$getSharedProfiles<
                          Query$GetSharedProfiles$getSharedProfiles>?>?)
              _fn) =>
      call(
          getSharedProfiles:
              _fn(_instance.getSharedProfiles?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetSharedProfiles$getSharedProfiles(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetSharedProfiles<TRes>
    implements CopyWith$Query$GetSharedProfiles<TRes> {
  _CopyWithStubImpl$Query$GetSharedProfiles(this._res);

  TRes _res;

  call({
    List<Query$GetSharedProfiles$getSharedProfiles?>? getSharedProfiles,
    String? $__typename,
  }) =>
      _res;

  getSharedProfiles(_fn) => _res;
}

const documentNodeQueryGetSharedProfiles = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSharedProfiles'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getSharedProfiles'),
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
            name: NameNode(value: 'name'),
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
Query$GetSharedProfiles _parserFn$Query$GetSharedProfiles(
        Map<String, dynamic> data) =>
    Query$GetSharedProfiles.fromJson(data);
typedef OnQueryComplete$Query$GetSharedProfiles = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSharedProfiles?,
);

class Options$Query$GetSharedProfiles
    extends graphql.QueryOptions<Query$GetSharedProfiles> {
  Options$Query$GetSharedProfiles({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedProfiles? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSharedProfiles? onComplete,
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
                        : _parserFn$Query$GetSharedProfiles(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSharedProfiles,
          parserFn: _parserFn$Query$GetSharedProfiles,
        );

  final OnQueryComplete$Query$GetSharedProfiles? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSharedProfiles
    extends graphql.WatchQueryOptions<Query$GetSharedProfiles> {
  WatchOptions$Query$GetSharedProfiles({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedProfiles? typedOptimisticResult,
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
          document: documentNodeQueryGetSharedProfiles,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSharedProfiles,
        );
}

class FetchMoreOptions$Query$GetSharedProfiles
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSharedProfiles(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetSharedProfiles,
        );
}

extension ClientExtension$Query$GetSharedProfiles on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSharedProfiles>> query$GetSharedProfiles(
          [Options$Query$GetSharedProfiles? options]) async =>
      await this.query(options ?? Options$Query$GetSharedProfiles());
  graphql.ObservableQuery<Query$GetSharedProfiles> watchQuery$GetSharedProfiles(
          [WatchOptions$Query$GetSharedProfiles? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetSharedProfiles());
  void writeQuery$GetSharedProfiles({
    required Query$GetSharedProfiles data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetSharedProfiles)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSharedProfiles? readQuery$GetSharedProfiles(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetSharedProfiles)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSharedProfiles.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSharedProfiles>
    useQuery$GetSharedProfiles([Options$Query$GetSharedProfiles? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetSharedProfiles());
graphql.ObservableQuery<Query$GetSharedProfiles>
    useWatchQuery$GetSharedProfiles(
            [WatchOptions$Query$GetSharedProfiles? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetSharedProfiles());

class Query$GetSharedProfiles$Widget
    extends graphql_flutter.Query<Query$GetSharedProfiles> {
  Query$GetSharedProfiles$Widget({
    widgets.Key? key,
    Options$Query$GetSharedProfiles? options,
    required graphql_flutter.QueryBuilder<Query$GetSharedProfiles> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetSharedProfiles(),
          builder: builder,
        );
}

class Query$GetSharedProfiles$getSharedProfiles {
  Query$GetSharedProfiles$getSharedProfiles({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.createdAt,
    this.$__typename = 'ProfileDetail',
  });

  factory Query$GetSharedProfiles$getSharedProfiles.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$phoneNumber = json['phoneNumber'];
    final l$role = json['role'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedProfiles$getSharedProfiles(
      id: (l$id as String),
      name: (l$name as String),
      phoneNumber: (l$phoneNumber as String),
      role: (l$role as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String phoneNumber;

  final String role;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$role = role;
    _resultData['role'] = l$role;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$phoneNumber = phoneNumber;
    final l$role = role;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$phoneNumber,
      l$role,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetSharedProfiles$getSharedProfiles ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSharedProfiles$getSharedProfiles
    on Query$GetSharedProfiles$getSharedProfiles {
  CopyWith$Query$GetSharedProfiles$getSharedProfiles<
          Query$GetSharedProfiles$getSharedProfiles>
      get copyWith => CopyWith$Query$GetSharedProfiles$getSharedProfiles(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedProfiles$getSharedProfiles<TRes> {
  factory CopyWith$Query$GetSharedProfiles$getSharedProfiles(
    Query$GetSharedProfiles$getSharedProfiles instance,
    TRes Function(Query$GetSharedProfiles$getSharedProfiles) then,
  ) = _CopyWithImpl$Query$GetSharedProfiles$getSharedProfiles;

  factory CopyWith$Query$GetSharedProfiles$getSharedProfiles.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSharedProfiles$getSharedProfiles;

  TRes call({
    String? id,
    String? name,
    String? phoneNumber,
    String? role,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSharedProfiles$getSharedProfiles<TRes>
    implements CopyWith$Query$GetSharedProfiles$getSharedProfiles<TRes> {
  _CopyWithImpl$Query$GetSharedProfiles$getSharedProfiles(
    this._instance,
    this._then,
  );

  final Query$GetSharedProfiles$getSharedProfiles _instance;

  final TRes Function(Query$GetSharedProfiles$getSharedProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? phoneNumber = _undefined,
    Object? role = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedProfiles$getSharedProfiles(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        phoneNumber: phoneNumber == _undefined || phoneNumber == null
            ? _instance.phoneNumber
            : (phoneNumber as String),
        role: role == _undefined || role == null
            ? _instance.role
            : (role as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSharedProfiles$getSharedProfiles<TRes>
    implements CopyWith$Query$GetSharedProfiles$getSharedProfiles<TRes> {
  _CopyWithStubImpl$Query$GetSharedProfiles$getSharedProfiles(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? phoneNumber,
    String? role,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ShareProfile {
  factory Variables$Mutation$ShareProfile({
    required String phoneNumber,
    required String accessLevel,
    required String remarks,
  }) =>
      Variables$Mutation$ShareProfile._({
        r'phoneNumber': phoneNumber,
        r'accessLevel': accessLevel,
        r'remarks': remarks,
      });

  Variables$Mutation$ShareProfile._(this._$data);

  factory Variables$Mutation$ShareProfile.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$accessLevel = data['accessLevel'];
    result$data['accessLevel'] = (l$accessLevel as String);
    final l$remarks = data['remarks'];
    result$data['remarks'] = (l$remarks as String);
    return Variables$Mutation$ShareProfile._(result$data);
  }

  Map<String, dynamic> _$data;

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get accessLevel => (_$data['accessLevel'] as String);

  String get remarks => (_$data['remarks'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    final l$accessLevel = accessLevel;
    result$data['accessLevel'] = l$accessLevel;
    final l$remarks = remarks;
    result$data['remarks'] = l$remarks;
    return result$data;
  }

  CopyWith$Variables$Mutation$ShareProfile<Variables$Mutation$ShareProfile>
      get copyWith => CopyWith$Variables$Mutation$ShareProfile(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$ShareProfile ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$accessLevel = accessLevel;
    final lOther$accessLevel = other.accessLevel;
    if (l$accessLevel != lOther$accessLevel) {
      return false;
    }
    final l$remarks = remarks;
    final lOther$remarks = other.remarks;
    if (l$remarks != lOther$remarks) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$phoneNumber = phoneNumber;
    final l$accessLevel = accessLevel;
    final l$remarks = remarks;
    return Object.hashAll([
      l$phoneNumber,
      l$accessLevel,
      l$remarks,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ShareProfile<TRes> {
  factory CopyWith$Variables$Mutation$ShareProfile(
    Variables$Mutation$ShareProfile instance,
    TRes Function(Variables$Mutation$ShareProfile) then,
  ) = _CopyWithImpl$Variables$Mutation$ShareProfile;

  factory CopyWith$Variables$Mutation$ShareProfile.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ShareProfile;

  TRes call({
    String? phoneNumber,
    String? accessLevel,
    String? remarks,
  });
}

class _CopyWithImpl$Variables$Mutation$ShareProfile<TRes>
    implements CopyWith$Variables$Mutation$ShareProfile<TRes> {
  _CopyWithImpl$Variables$Mutation$ShareProfile(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ShareProfile _instance;

  final TRes Function(Variables$Mutation$ShareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? phoneNumber = _undefined,
    Object? accessLevel = _undefined,
    Object? remarks = _undefined,
  }) =>
      _then(Variables$Mutation$ShareProfile._({
        ..._instance._$data,
        if (phoneNumber != _undefined && phoneNumber != null)
          'phoneNumber': (phoneNumber as String),
        if (accessLevel != _undefined && accessLevel != null)
          'accessLevel': (accessLevel as String),
        if (remarks != _undefined && remarks != null)
          'remarks': (remarks as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ShareProfile<TRes>
    implements CopyWith$Variables$Mutation$ShareProfile<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ShareProfile(this._res);

  TRes _res;

  call({
    String? phoneNumber,
    String? accessLevel,
    String? remarks,
  }) =>
      _res;
}

class Mutation$ShareProfile {
  Mutation$ShareProfile({
    required this.shareProfile,
    this.$__typename = 'Mutation',
  });

  factory Mutation$ShareProfile.fromJson(Map<String, dynamic> json) {
    final l$shareProfile = json['shareProfile'];
    final l$$__typename = json['__typename'];
    return Mutation$ShareProfile(
      shareProfile: Mutation$ShareProfile$shareProfile.fromJson(
          (l$shareProfile as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ShareProfile$shareProfile shareProfile;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$shareProfile = shareProfile;
    _resultData['shareProfile'] = l$shareProfile.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$shareProfile = shareProfile;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$shareProfile,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$ShareProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$shareProfile = shareProfile;
    final lOther$shareProfile = other.shareProfile;
    if (l$shareProfile != lOther$shareProfile) {
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

extension UtilityExtension$Mutation$ShareProfile on Mutation$ShareProfile {
  CopyWith$Mutation$ShareProfile<Mutation$ShareProfile> get copyWith =>
      CopyWith$Mutation$ShareProfile(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ShareProfile<TRes> {
  factory CopyWith$Mutation$ShareProfile(
    Mutation$ShareProfile instance,
    TRes Function(Mutation$ShareProfile) then,
  ) = _CopyWithImpl$Mutation$ShareProfile;

  factory CopyWith$Mutation$ShareProfile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ShareProfile;

  TRes call({
    Mutation$ShareProfile$shareProfile? shareProfile,
    String? $__typename,
  });
  CopyWith$Mutation$ShareProfile$shareProfile<TRes> get shareProfile;
}

class _CopyWithImpl$Mutation$ShareProfile<TRes>
    implements CopyWith$Mutation$ShareProfile<TRes> {
  _CopyWithImpl$Mutation$ShareProfile(
    this._instance,
    this._then,
  );

  final Mutation$ShareProfile _instance;

  final TRes Function(Mutation$ShareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? shareProfile = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ShareProfile(
        shareProfile: shareProfile == _undefined || shareProfile == null
            ? _instance.shareProfile
            : (shareProfile as Mutation$ShareProfile$shareProfile),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$ShareProfile$shareProfile<TRes> get shareProfile {
    final local$shareProfile = _instance.shareProfile;
    return CopyWith$Mutation$ShareProfile$shareProfile(
        local$shareProfile, (e) => call(shareProfile: e));
  }
}

class _CopyWithStubImpl$Mutation$ShareProfile<TRes>
    implements CopyWith$Mutation$ShareProfile<TRes> {
  _CopyWithStubImpl$Mutation$ShareProfile(this._res);

  TRes _res;

  call({
    Mutation$ShareProfile$shareProfile? shareProfile,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$ShareProfile$shareProfile<TRes> get shareProfile =>
      CopyWith$Mutation$ShareProfile$shareProfile.stub(_res);
}

const documentNodeMutationShareProfile = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ShareProfile'),
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
        variable: VariableNode(name: NameNode(value: 'accessLevel')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'remarks')),
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
        name: NameNode(value: 'shareProfile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'phoneNumber'),
            value: VariableNode(name: NameNode(value: 'phoneNumber')),
          ),
          ArgumentNode(
            name: NameNode(value: 'accessLevel'),
            value: VariableNode(name: NameNode(value: 'accessLevel')),
          ),
          ArgumentNode(
            name: NameNode(value: 'remarks'),
            value: VariableNode(name: NameNode(value: 'remarks')),
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
Mutation$ShareProfile _parserFn$Mutation$ShareProfile(
        Map<String, dynamic> data) =>
    Mutation$ShareProfile.fromJson(data);
typedef OnMutationCompleted$Mutation$ShareProfile = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ShareProfile?,
);

class Options$Mutation$ShareProfile
    extends graphql.MutationOptions<Mutation$ShareProfile> {
  Options$Mutation$ShareProfile({
    String? operationName,
    required Variables$Mutation$ShareProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ShareProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ShareProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$ShareProfile>? update,
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
                    data == null ? null : _parserFn$Mutation$ShareProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationShareProfile,
          parserFn: _parserFn$Mutation$ShareProfile,
        );

  final OnMutationCompleted$Mutation$ShareProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ShareProfile
    extends graphql.WatchQueryOptions<Mutation$ShareProfile> {
  WatchOptions$Mutation$ShareProfile({
    String? operationName,
    required Variables$Mutation$ShareProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ShareProfile? typedOptimisticResult,
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
          document: documentNodeMutationShareProfile,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ShareProfile,
        );
}

extension ClientExtension$Mutation$ShareProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ShareProfile>> mutate$ShareProfile(
          Options$Mutation$ShareProfile options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ShareProfile> watchMutation$ShareProfile(
          WatchOptions$Mutation$ShareProfile options) =>
      this.watchMutation(options);
}

class Mutation$ShareProfile$HookResult {
  Mutation$ShareProfile$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ShareProfile runMutation;

  final graphql.QueryResult<Mutation$ShareProfile> result;
}

Mutation$ShareProfile$HookResult useMutation$ShareProfile(
    [WidgetOptions$Mutation$ShareProfile? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ShareProfile());
  return Mutation$ShareProfile$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ShareProfile> useWatchMutation$ShareProfile(
        WatchOptions$Mutation$ShareProfile options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ShareProfile
    extends graphql.MutationOptions<Mutation$ShareProfile> {
  WidgetOptions$Mutation$ShareProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ShareProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ShareProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$ShareProfile>? update,
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
                    data == null ? null : _parserFn$Mutation$ShareProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationShareProfile,
          parserFn: _parserFn$Mutation$ShareProfile,
        );

  final OnMutationCompleted$Mutation$ShareProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ShareProfile
    = graphql.MultiSourceResult<Mutation$ShareProfile> Function(
  Variables$Mutation$ShareProfile, {
  Object? optimisticResult,
  Mutation$ShareProfile? typedOptimisticResult,
});
typedef Builder$Mutation$ShareProfile = widgets.Widget Function(
  RunMutation$Mutation$ShareProfile,
  graphql.QueryResult<Mutation$ShareProfile>?,
);

class Mutation$ShareProfile$Widget
    extends graphql_flutter.Mutation<Mutation$ShareProfile> {
  Mutation$ShareProfile$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ShareProfile? options,
    required Builder$Mutation$ShareProfile builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ShareProfile(),
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

class Mutation$ShareProfile$shareProfile {
  Mutation$ShareProfile$shareProfile({
    required this.message,
    this.$__typename = 'ShareProfileResponse',
  });

  factory Mutation$ShareProfile$shareProfile.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ShareProfile$shareProfile(
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
    if (other is! Mutation$ShareProfile$shareProfile ||
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

extension UtilityExtension$Mutation$ShareProfile$shareProfile
    on Mutation$ShareProfile$shareProfile {
  CopyWith$Mutation$ShareProfile$shareProfile<
          Mutation$ShareProfile$shareProfile>
      get copyWith => CopyWith$Mutation$ShareProfile$shareProfile(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ShareProfile$shareProfile<TRes> {
  factory CopyWith$Mutation$ShareProfile$shareProfile(
    Mutation$ShareProfile$shareProfile instance,
    TRes Function(Mutation$ShareProfile$shareProfile) then,
  ) = _CopyWithImpl$Mutation$ShareProfile$shareProfile;

  factory CopyWith$Mutation$ShareProfile$shareProfile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ShareProfile$shareProfile;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ShareProfile$shareProfile<TRes>
    implements CopyWith$Mutation$ShareProfile$shareProfile<TRes> {
  _CopyWithImpl$Mutation$ShareProfile$shareProfile(
    this._instance,
    this._then,
  );

  final Mutation$ShareProfile$shareProfile _instance;

  final TRes Function(Mutation$ShareProfile$shareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ShareProfile$shareProfile(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ShareProfile$shareProfile<TRes>
    implements CopyWith$Mutation$ShareProfile$shareProfile<TRes> {
  _CopyWithStubImpl$Mutation$ShareProfile$shareProfile(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UnshareProfile {
  factory Variables$Mutation$UnshareProfile({required String targetUserId}) =>
      Variables$Mutation$UnshareProfile._({
        r'targetUserId': targetUserId,
      });

  Variables$Mutation$UnshareProfile._(this._$data);

  factory Variables$Mutation$UnshareProfile.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$targetUserId = data['targetUserId'];
    result$data['targetUserId'] = (l$targetUserId as String);
    return Variables$Mutation$UnshareProfile._(result$data);
  }

  Map<String, dynamic> _$data;

  String get targetUserId => (_$data['targetUserId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$targetUserId = targetUserId;
    result$data['targetUserId'] = l$targetUserId;
    return result$data;
  }

  CopyWith$Variables$Mutation$UnshareProfile<Variables$Mutation$UnshareProfile>
      get copyWith => CopyWith$Variables$Mutation$UnshareProfile(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UnshareProfile ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$targetUserId = targetUserId;
    final lOther$targetUserId = other.targetUserId;
    if (l$targetUserId != lOther$targetUserId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$targetUserId = targetUserId;
    return Object.hashAll([l$targetUserId]);
  }
}

abstract class CopyWith$Variables$Mutation$UnshareProfile<TRes> {
  factory CopyWith$Variables$Mutation$UnshareProfile(
    Variables$Mutation$UnshareProfile instance,
    TRes Function(Variables$Mutation$UnshareProfile) then,
  ) = _CopyWithImpl$Variables$Mutation$UnshareProfile;

  factory CopyWith$Variables$Mutation$UnshareProfile.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UnshareProfile;

  TRes call({String? targetUserId});
}

class _CopyWithImpl$Variables$Mutation$UnshareProfile<TRes>
    implements CopyWith$Variables$Mutation$UnshareProfile<TRes> {
  _CopyWithImpl$Variables$Mutation$UnshareProfile(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UnshareProfile _instance;

  final TRes Function(Variables$Mutation$UnshareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? targetUserId = _undefined}) =>
      _then(Variables$Mutation$UnshareProfile._({
        ..._instance._$data,
        if (targetUserId != _undefined && targetUserId != null)
          'targetUserId': (targetUserId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UnshareProfile<TRes>
    implements CopyWith$Variables$Mutation$UnshareProfile<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UnshareProfile(this._res);

  TRes _res;

  call({String? targetUserId}) => _res;
}

class Mutation$UnshareProfile {
  Mutation$UnshareProfile({
    required this.unshareProfile,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UnshareProfile.fromJson(Map<String, dynamic> json) {
    final l$unshareProfile = json['unshareProfile'];
    final l$$__typename = json['__typename'];
    return Mutation$UnshareProfile(
      unshareProfile: Mutation$UnshareProfile$unshareProfile.fromJson(
          (l$unshareProfile as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UnshareProfile$unshareProfile unshareProfile;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unshareProfile = unshareProfile;
    _resultData['unshareProfile'] = l$unshareProfile.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unshareProfile = unshareProfile;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$unshareProfile,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UnshareProfile || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unshareProfile = unshareProfile;
    final lOther$unshareProfile = other.unshareProfile;
    if (l$unshareProfile != lOther$unshareProfile) {
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

extension UtilityExtension$Mutation$UnshareProfile on Mutation$UnshareProfile {
  CopyWith$Mutation$UnshareProfile<Mutation$UnshareProfile> get copyWith =>
      CopyWith$Mutation$UnshareProfile(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UnshareProfile<TRes> {
  factory CopyWith$Mutation$UnshareProfile(
    Mutation$UnshareProfile instance,
    TRes Function(Mutation$UnshareProfile) then,
  ) = _CopyWithImpl$Mutation$UnshareProfile;

  factory CopyWith$Mutation$UnshareProfile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UnshareProfile;

  TRes call({
    Mutation$UnshareProfile$unshareProfile? unshareProfile,
    String? $__typename,
  });
  CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> get unshareProfile;
}

class _CopyWithImpl$Mutation$UnshareProfile<TRes>
    implements CopyWith$Mutation$UnshareProfile<TRes> {
  _CopyWithImpl$Mutation$UnshareProfile(
    this._instance,
    this._then,
  );

  final Mutation$UnshareProfile _instance;

  final TRes Function(Mutation$UnshareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? unshareProfile = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UnshareProfile(
        unshareProfile: unshareProfile == _undefined || unshareProfile == null
            ? _instance.unshareProfile
            : (unshareProfile as Mutation$UnshareProfile$unshareProfile),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> get unshareProfile {
    final local$unshareProfile = _instance.unshareProfile;
    return CopyWith$Mutation$UnshareProfile$unshareProfile(
        local$unshareProfile, (e) => call(unshareProfile: e));
  }
}

class _CopyWithStubImpl$Mutation$UnshareProfile<TRes>
    implements CopyWith$Mutation$UnshareProfile<TRes> {
  _CopyWithStubImpl$Mutation$UnshareProfile(this._res);

  TRes _res;

  call({
    Mutation$UnshareProfile$unshareProfile? unshareProfile,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> get unshareProfile =>
      CopyWith$Mutation$UnshareProfile$unshareProfile.stub(_res);
}

const documentNodeMutationUnshareProfile = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UnshareProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'targetUserId')),
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
        name: NameNode(value: 'unshareProfile'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'targetUserId'),
            value: VariableNode(name: NameNode(value: 'targetUserId')),
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
Mutation$UnshareProfile _parserFn$Mutation$UnshareProfile(
        Map<String, dynamic> data) =>
    Mutation$UnshareProfile.fromJson(data);
typedef OnMutationCompleted$Mutation$UnshareProfile = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UnshareProfile?,
);

class Options$Mutation$UnshareProfile
    extends graphql.MutationOptions<Mutation$UnshareProfile> {
  Options$Mutation$UnshareProfile({
    String? operationName,
    required Variables$Mutation$UnshareProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UnshareProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UnshareProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$UnshareProfile>? update,
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
                        : _parserFn$Mutation$UnshareProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUnshareProfile,
          parserFn: _parserFn$Mutation$UnshareProfile,
        );

  final OnMutationCompleted$Mutation$UnshareProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UnshareProfile
    extends graphql.WatchQueryOptions<Mutation$UnshareProfile> {
  WatchOptions$Mutation$UnshareProfile({
    String? operationName,
    required Variables$Mutation$UnshareProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UnshareProfile? typedOptimisticResult,
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
          document: documentNodeMutationUnshareProfile,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UnshareProfile,
        );
}

extension ClientExtension$Mutation$UnshareProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UnshareProfile>> mutate$UnshareProfile(
          Options$Mutation$UnshareProfile options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UnshareProfile> watchMutation$UnshareProfile(
          WatchOptions$Mutation$UnshareProfile options) =>
      this.watchMutation(options);
}

class Mutation$UnshareProfile$HookResult {
  Mutation$UnshareProfile$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UnshareProfile runMutation;

  final graphql.QueryResult<Mutation$UnshareProfile> result;
}

Mutation$UnshareProfile$HookResult useMutation$UnshareProfile(
    [WidgetOptions$Mutation$UnshareProfile? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UnshareProfile());
  return Mutation$UnshareProfile$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UnshareProfile>
    useWatchMutation$UnshareProfile(
            WatchOptions$Mutation$UnshareProfile options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UnshareProfile
    extends graphql.MutationOptions<Mutation$UnshareProfile> {
  WidgetOptions$Mutation$UnshareProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UnshareProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UnshareProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$UnshareProfile>? update,
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
                        : _parserFn$Mutation$UnshareProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUnshareProfile,
          parserFn: _parserFn$Mutation$UnshareProfile,
        );

  final OnMutationCompleted$Mutation$UnshareProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UnshareProfile
    = graphql.MultiSourceResult<Mutation$UnshareProfile> Function(
  Variables$Mutation$UnshareProfile, {
  Object? optimisticResult,
  Mutation$UnshareProfile? typedOptimisticResult,
});
typedef Builder$Mutation$UnshareProfile = widgets.Widget Function(
  RunMutation$Mutation$UnshareProfile,
  graphql.QueryResult<Mutation$UnshareProfile>?,
);

class Mutation$UnshareProfile$Widget
    extends graphql_flutter.Mutation<Mutation$UnshareProfile> {
  Mutation$UnshareProfile$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UnshareProfile? options,
    required Builder$Mutation$UnshareProfile builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UnshareProfile(),
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

class Mutation$UnshareProfile$unshareProfile {
  Mutation$UnshareProfile$unshareProfile({
    required this.message,
    this.$__typename = 'UnshareProfileResponse',
  });

  factory Mutation$UnshareProfile$unshareProfile.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UnshareProfile$unshareProfile(
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
    if (other is! Mutation$UnshareProfile$unshareProfile ||
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

extension UtilityExtension$Mutation$UnshareProfile$unshareProfile
    on Mutation$UnshareProfile$unshareProfile {
  CopyWith$Mutation$UnshareProfile$unshareProfile<
          Mutation$UnshareProfile$unshareProfile>
      get copyWith => CopyWith$Mutation$UnshareProfile$unshareProfile(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> {
  factory CopyWith$Mutation$UnshareProfile$unshareProfile(
    Mutation$UnshareProfile$unshareProfile instance,
    TRes Function(Mutation$UnshareProfile$unshareProfile) then,
  ) = _CopyWithImpl$Mutation$UnshareProfile$unshareProfile;

  factory CopyWith$Mutation$UnshareProfile$unshareProfile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UnshareProfile$unshareProfile;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UnshareProfile$unshareProfile<TRes>
    implements CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> {
  _CopyWithImpl$Mutation$UnshareProfile$unshareProfile(
    this._instance,
    this._then,
  );

  final Mutation$UnshareProfile$unshareProfile _instance;

  final TRes Function(Mutation$UnshareProfile$unshareProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UnshareProfile$unshareProfile(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UnshareProfile$unshareProfile<TRes>
    implements CopyWith$Mutation$UnshareProfile$unshareProfile<TRes> {
  _CopyWithStubImpl$Mutation$UnshareProfile$unshareProfile(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetUserPointRecords {
  Query$GetUserPointRecords({
    this.getUserPointRecords,
    this.$__typename = 'Query',
  });

  factory Query$GetUserPointRecords.fromJson(Map<String, dynamic> json) {
    final l$getUserPointRecords = json['getUserPointRecords'];
    final l$$__typename = json['__typename'];
    return Query$GetUserPointRecords(
      getUserPointRecords: (l$getUserPointRecords as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetUserPointRecords$getUserPointRecords.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUserPointRecords$getUserPointRecords?>?
      getUserPointRecords;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getUserPointRecords = getUserPointRecords;
    _resultData['getUserPointRecords'] =
        l$getUserPointRecords?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getUserPointRecords = getUserPointRecords;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getUserPointRecords == null
          ? null
          : Object.hashAll(l$getUserPointRecords.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserPointRecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getUserPointRecords = getUserPointRecords;
    final lOther$getUserPointRecords = other.getUserPointRecords;
    if (l$getUserPointRecords != null && lOther$getUserPointRecords != null) {
      if (l$getUserPointRecords.length != lOther$getUserPointRecords.length) {
        return false;
      }
      for (int i = 0; i < l$getUserPointRecords.length; i++) {
        final l$getUserPointRecords$entry = l$getUserPointRecords[i];
        final lOther$getUserPointRecords$entry = lOther$getUserPointRecords[i];
        if (l$getUserPointRecords$entry != lOther$getUserPointRecords$entry) {
          return false;
        }
      }
    } else if (l$getUserPointRecords != lOther$getUserPointRecords) {
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

extension UtilityExtension$Query$GetUserPointRecords
    on Query$GetUserPointRecords {
  CopyWith$Query$GetUserPointRecords<Query$GetUserPointRecords> get copyWith =>
      CopyWith$Query$GetUserPointRecords(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetUserPointRecords<TRes> {
  factory CopyWith$Query$GetUserPointRecords(
    Query$GetUserPointRecords instance,
    TRes Function(Query$GetUserPointRecords) then,
  ) = _CopyWithImpl$Query$GetUserPointRecords;

  factory CopyWith$Query$GetUserPointRecords.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserPointRecords;

  TRes call({
    List<Query$GetUserPointRecords$getUserPointRecords?>? getUserPointRecords,
    String? $__typename,
  });
  TRes getUserPointRecords(
      Iterable<Query$GetUserPointRecords$getUserPointRecords?>? Function(
              Iterable<
                  CopyWith$Query$GetUserPointRecords$getUserPointRecords<
                      Query$GetUserPointRecords$getUserPointRecords>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetUserPointRecords<TRes>
    implements CopyWith$Query$GetUserPointRecords<TRes> {
  _CopyWithImpl$Query$GetUserPointRecords(
    this._instance,
    this._then,
  );

  final Query$GetUserPointRecords _instance;

  final TRes Function(Query$GetUserPointRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getUserPointRecords = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserPointRecords(
        getUserPointRecords: getUserPointRecords == _undefined
            ? _instance.getUserPointRecords
            : (getUserPointRecords
                as List<Query$GetUserPointRecords$getUserPointRecords?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getUserPointRecords(
          Iterable<Query$GetUserPointRecords$getUserPointRecords?>? Function(
                  Iterable<
                      CopyWith$Query$GetUserPointRecords$getUserPointRecords<
                          Query$GetUserPointRecords$getUserPointRecords>?>?)
              _fn) =>
      call(
          getUserPointRecords:
              _fn(_instance.getUserPointRecords?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetUserPointRecords$getUserPointRecords(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetUserPointRecords<TRes>
    implements CopyWith$Query$GetUserPointRecords<TRes> {
  _CopyWithStubImpl$Query$GetUserPointRecords(this._res);

  TRes _res;

  call({
    List<Query$GetUserPointRecords$getUserPointRecords?>? getUserPointRecords,
    String? $__typename,
  }) =>
      _res;

  getUserPointRecords(_fn) => _res;
}

const documentNodeQueryGetUserPointRecords = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetUserPointRecords'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserPointRecords'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'recordId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pointsEarned'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reason'),
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
Query$GetUserPointRecords _parserFn$Query$GetUserPointRecords(
        Map<String, dynamic> data) =>
    Query$GetUserPointRecords.fromJson(data);
typedef OnQueryComplete$Query$GetUserPointRecords = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetUserPointRecords?,
);

class Options$Query$GetUserPointRecords
    extends graphql.QueryOptions<Query$GetUserPointRecords> {
  Options$Query$GetUserPointRecords({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserPointRecords? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserPointRecords? onComplete,
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
                        : _parserFn$Query$GetUserPointRecords(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetUserPointRecords,
          parserFn: _parserFn$Query$GetUserPointRecords,
        );

  final OnQueryComplete$Query$GetUserPointRecords? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetUserPointRecords
    extends graphql.WatchQueryOptions<Query$GetUserPointRecords> {
  WatchOptions$Query$GetUserPointRecords({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserPointRecords? typedOptimisticResult,
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
          document: documentNodeQueryGetUserPointRecords,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetUserPointRecords,
        );
}

class FetchMoreOptions$Query$GetUserPointRecords
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserPointRecords(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetUserPointRecords,
        );
}

extension ClientExtension$Query$GetUserPointRecords on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserPointRecords>>
      query$GetUserPointRecords(
              [Options$Query$GetUserPointRecords? options]) async =>
          await this.query(options ?? Options$Query$GetUserPointRecords());
  graphql.ObservableQuery<Query$GetUserPointRecords>
      watchQuery$GetUserPointRecords(
              [WatchOptions$Query$GetUserPointRecords? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$GetUserPointRecords());
  void writeQuery$GetUserPointRecords({
    required Query$GetUserPointRecords data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetUserPointRecords)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetUserPointRecords? readQuery$GetUserPointRecords(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetUserPointRecords)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserPointRecords.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserPointRecords>
    useQuery$GetUserPointRecords(
            [Options$Query$GetUserPointRecords? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetUserPointRecords());
graphql.ObservableQuery<Query$GetUserPointRecords>
    useWatchQuery$GetUserPointRecords(
            [WatchOptions$Query$GetUserPointRecords? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetUserPointRecords());

class Query$GetUserPointRecords$Widget
    extends graphql_flutter.Query<Query$GetUserPointRecords> {
  Query$GetUserPointRecords$Widget({
    widgets.Key? key,
    Options$Query$GetUserPointRecords? options,
    required graphql_flutter.QueryBuilder<Query$GetUserPointRecords> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetUserPointRecords(),
          builder: builder,
        );
}

class Query$GetUserPointRecords$getUserPointRecords {
  Query$GetUserPointRecords$getUserPointRecords({
    required this.recordId,
    required this.pointsEarned,
    required this.reason,
    required this.earnedAt,
    this.$__typename = 'UserPointRecordDetail',
  });

  factory Query$GetUserPointRecords$getUserPointRecords.fromJson(
      Map<String, dynamic> json) {
    final l$recordId = json['recordId'];
    final l$pointsEarned = json['pointsEarned'];
    final l$reason = json['reason'];
    final l$earnedAt = json['earnedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetUserPointRecords$getUserPointRecords(
      recordId: (l$recordId as String),
      pointsEarned: (l$pointsEarned as num).toDouble(),
      reason: (l$reason as String),
      earnedAt: dateTimeFromJson(l$earnedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String recordId;

  final double pointsEarned;

  final String reason;

  final DateTime earnedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordId = recordId;
    _resultData['recordId'] = l$recordId;
    final l$pointsEarned = pointsEarned;
    _resultData['pointsEarned'] = l$pointsEarned;
    final l$reason = reason;
    _resultData['reason'] = l$reason;
    final l$earnedAt = earnedAt;
    _resultData['earnedAt'] = dateTimeToJson(l$earnedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$pointsEarned = pointsEarned;
    final l$reason = reason;
    final l$earnedAt = earnedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$recordId,
      l$pointsEarned,
      l$reason,
      l$earnedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserPointRecords$getUserPointRecords ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
      return false;
    }
    final l$pointsEarned = pointsEarned;
    final lOther$pointsEarned = other.pointsEarned;
    if (l$pointsEarned != lOther$pointsEarned) {
      return false;
    }
    final l$reason = reason;
    final lOther$reason = other.reason;
    if (l$reason != lOther$reason) {
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

extension UtilityExtension$Query$GetUserPointRecords$getUserPointRecords
    on Query$GetUserPointRecords$getUserPointRecords {
  CopyWith$Query$GetUserPointRecords$getUserPointRecords<
          Query$GetUserPointRecords$getUserPointRecords>
      get copyWith => CopyWith$Query$GetUserPointRecords$getUserPointRecords(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetUserPointRecords$getUserPointRecords<TRes> {
  factory CopyWith$Query$GetUserPointRecords$getUserPointRecords(
    Query$GetUserPointRecords$getUserPointRecords instance,
    TRes Function(Query$GetUserPointRecords$getUserPointRecords) then,
  ) = _CopyWithImpl$Query$GetUserPointRecords$getUserPointRecords;

  factory CopyWith$Query$GetUserPointRecords$getUserPointRecords.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetUserPointRecords$getUserPointRecords;

  TRes call({
    String? recordId,
    double? pointsEarned,
    String? reason,
    DateTime? earnedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserPointRecords$getUserPointRecords<TRes>
    implements CopyWith$Query$GetUserPointRecords$getUserPointRecords<TRes> {
  _CopyWithImpl$Query$GetUserPointRecords$getUserPointRecords(
    this._instance,
    this._then,
  );

  final Query$GetUserPointRecords$getUserPointRecords _instance;

  final TRes Function(Query$GetUserPointRecords$getUserPointRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? pointsEarned = _undefined,
    Object? reason = _undefined,
    Object? earnedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetUserPointRecords$getUserPointRecords(
        recordId: recordId == _undefined || recordId == null
            ? _instance.recordId
            : (recordId as String),
        pointsEarned: pointsEarned == _undefined || pointsEarned == null
            ? _instance.pointsEarned
            : (pointsEarned as double),
        reason: reason == _undefined || reason == null
            ? _instance.reason
            : (reason as String),
        earnedAt: earnedAt == _undefined || earnedAt == null
            ? _instance.earnedAt
            : (earnedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetUserPointRecords$getUserPointRecords<TRes>
    implements CopyWith$Query$GetUserPointRecords$getUserPointRecords<TRes> {
  _CopyWithStubImpl$Query$GetUserPointRecords$getUserPointRecords(this._res);

  TRes _res;

  call({
    String? recordId,
    double? pointsEarned,
    String? reason,
    DateTime? earnedAt,
    String? $__typename,
  }) =>
      _res;
}
