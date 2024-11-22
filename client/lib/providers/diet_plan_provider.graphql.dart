import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$getDietPlans {
  factory Variables$Query$getDietPlans({required String userId}) =>
      Variables$Query$getDietPlans._({
        r'userId': userId,
      });

  Variables$Query$getDietPlans._(this._$data);

  factory Variables$Query$getDietPlans.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Variables$Query$getDietPlans._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Variables$Query$getDietPlans<Variables$Query$getDietPlans>
      get copyWith => CopyWith$Variables$Query$getDietPlans(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$getDietPlans) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }
}

abstract class CopyWith$Variables$Query$getDietPlans<TRes> {
  factory CopyWith$Variables$Query$getDietPlans(
    Variables$Query$getDietPlans instance,
    TRes Function(Variables$Query$getDietPlans) then,
  ) = _CopyWithImpl$Variables$Query$getDietPlans;

  factory CopyWith$Variables$Query$getDietPlans.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$getDietPlans;

  TRes call({String? userId});
}

class _CopyWithImpl$Variables$Query$getDietPlans<TRes>
    implements CopyWith$Variables$Query$getDietPlans<TRes> {
  _CopyWithImpl$Variables$Query$getDietPlans(
    this._instance,
    this._then,
  );

  final Variables$Query$getDietPlans _instance;

  final TRes Function(Variables$Query$getDietPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? userId = _undefined}) =>
      _then(Variables$Query$getDietPlans._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$getDietPlans<TRes>
    implements CopyWith$Variables$Query$getDietPlans<TRes> {
  _CopyWithStubImpl$Variables$Query$getDietPlans(this._res);

  TRes _res;

  call({String? userId}) => _res;
}

class Query$getDietPlans {
  Query$getDietPlans({
    this.getDietPlans,
    this.$__typename = 'Query',
  });

  factory Query$getDietPlans.fromJson(Map<String, dynamic> json) {
    final l$getDietPlans = json['getDietPlans'];
    final l$$__typename = json['__typename'];
    return Query$getDietPlans(
      getDietPlans: (l$getDietPlans as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$getDietPlans$getDietPlans.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$getDietPlans$getDietPlans?>? getDietPlans;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getDietPlans = getDietPlans;
    _resultData['getDietPlans'] =
        l$getDietPlans?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getDietPlans = getDietPlans;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getDietPlans == null
          ? null
          : Object.hashAll(l$getDietPlans.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDietPlans) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getDietPlans = getDietPlans;
    final lOther$getDietPlans = other.getDietPlans;
    if (l$getDietPlans != null && lOther$getDietPlans != null) {
      if (l$getDietPlans.length != lOther$getDietPlans.length) {
        return false;
      }
      for (int i = 0; i < l$getDietPlans.length; i++) {
        final l$getDietPlans$entry = l$getDietPlans[i];
        final lOther$getDietPlans$entry = lOther$getDietPlans[i];
        if (l$getDietPlans$entry != lOther$getDietPlans$entry) {
          return false;
        }
      }
    } else if (l$getDietPlans != lOther$getDietPlans) {
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

extension UtilityExtension$Query$getDietPlans on Query$getDietPlans {
  CopyWith$Query$getDietPlans<Query$getDietPlans> get copyWith =>
      CopyWith$Query$getDietPlans(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$getDietPlans<TRes> {
  factory CopyWith$Query$getDietPlans(
    Query$getDietPlans instance,
    TRes Function(Query$getDietPlans) then,
  ) = _CopyWithImpl$Query$getDietPlans;

  factory CopyWith$Query$getDietPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$getDietPlans;

  TRes call({
    List<Query$getDietPlans$getDietPlans?>? getDietPlans,
    String? $__typename,
  });
  TRes getDietPlans(
      Iterable<Query$getDietPlans$getDietPlans?>? Function(
              Iterable<
                  CopyWith$Query$getDietPlans$getDietPlans<
                      Query$getDietPlans$getDietPlans>?>?)
          _fn);
}

class _CopyWithImpl$Query$getDietPlans<TRes>
    implements CopyWith$Query$getDietPlans<TRes> {
  _CopyWithImpl$Query$getDietPlans(
    this._instance,
    this._then,
  );

  final Query$getDietPlans _instance;

  final TRes Function(Query$getDietPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getDietPlans = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDietPlans(
        getDietPlans: getDietPlans == _undefined
            ? _instance.getDietPlans
            : (getDietPlans as List<Query$getDietPlans$getDietPlans?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getDietPlans(
          Iterable<Query$getDietPlans$getDietPlans?>? Function(
                  Iterable<
                      CopyWith$Query$getDietPlans$getDietPlans<
                          Query$getDietPlans$getDietPlans>?>?)
              _fn) =>
      call(
          getDietPlans: _fn(_instance.getDietPlans?.map((e) => e == null
              ? null
              : CopyWith$Query$getDietPlans$getDietPlans(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$getDietPlans<TRes>
    implements CopyWith$Query$getDietPlans<TRes> {
  _CopyWithStubImpl$Query$getDietPlans(this._res);

  TRes _res;

  call({
    List<Query$getDietPlans$getDietPlans?>? getDietPlans,
    String? $__typename,
  }) =>
      _res;

  getDietPlans(_fn) => _res;
}

const documentNodeQuerygetDietPlans = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getDietPlans'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
        name: NameNode(value: 'getDietPlans'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'planId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mealType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'foodItems'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'calories'),
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
Query$getDietPlans _parserFn$Query$getDietPlans(Map<String, dynamic> data) =>
    Query$getDietPlans.fromJson(data);
typedef OnQueryComplete$Query$getDietPlans = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$getDietPlans?,
);

class Options$Query$getDietPlans
    extends graphql.QueryOptions<Query$getDietPlans> {
  Options$Query$getDietPlans({
    String? operationName,
    required Variables$Query$getDietPlans variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getDietPlans? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$getDietPlans? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
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
                    data == null ? null : _parserFn$Query$getDietPlans(data),
                  ),
          onError: onError,
          document: documentNodeQuerygetDietPlans,
          parserFn: _parserFn$Query$getDietPlans,
        );

  final OnQueryComplete$Query$getDietPlans? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$getDietPlans
    extends graphql.WatchQueryOptions<Query$getDietPlans> {
  WatchOptions$Query$getDietPlans({
    String? operationName,
    required Variables$Query$getDietPlans variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$getDietPlans? typedOptimisticResult,
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
          document: documentNodeQuerygetDietPlans,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$getDietPlans,
        );
}

class FetchMoreOptions$Query$getDietPlans extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$getDietPlans({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$getDietPlans variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerygetDietPlans,
        );
}

extension ClientExtension$Query$getDietPlans on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$getDietPlans>> query$getDietPlans(
          Options$Query$getDietPlans options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$getDietPlans> watchQuery$getDietPlans(
          WatchOptions$Query$getDietPlans options) =>
      this.watchQuery(options);
  void writeQuery$getDietPlans({
    required Query$getDietPlans data,
    required Variables$Query$getDietPlans variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQuerygetDietPlans),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$getDietPlans? readQuery$getDietPlans({
    required Variables$Query$getDietPlans variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQuerygetDietPlans),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$getDietPlans.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$getDietPlans> useQuery$getDietPlans(
        Options$Query$getDietPlans options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$getDietPlans> useWatchQuery$getDietPlans(
        WatchOptions$Query$getDietPlans options) =>
    graphql_flutter.useWatchQuery(options);

class Query$getDietPlans$Widget
    extends graphql_flutter.Query<Query$getDietPlans> {
  Query$getDietPlans$Widget({
    widgets.Key? key,
    required Options$Query$getDietPlans options,
    required graphql_flutter.QueryBuilder<Query$getDietPlans> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$getDietPlans$getDietPlans {
  Query$getDietPlans$getDietPlans({
    required this.planId,
    required this.mealType,
    required this.foodItems,
    required this.calories,
    required this.createdAt,
    this.$__typename = 'DietPlanDetail',
  });

  factory Query$getDietPlans$getDietPlans.fromJson(Map<String, dynamic> json) {
    final l$planId = json['planId'];
    final l$mealType = json['mealType'];
    final l$foodItems = json['foodItems'];
    final l$calories = json['calories'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$getDietPlans$getDietPlans(
      planId: (l$planId as String),
      mealType: (l$mealType as String),
      foodItems: (l$foodItems as String),
      calories: (l$calories as num).toDouble(),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String planId;

  final String mealType;

  final String foodItems;

  final double calories;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$planId = planId;
    _resultData['planId'] = l$planId;
    final l$mealType = mealType;
    _resultData['mealType'] = l$mealType;
    final l$foodItems = foodItems;
    _resultData['foodItems'] = l$foodItems;
    final l$calories = calories;
    _resultData['calories'] = l$calories;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$planId = planId;
    final l$mealType = mealType;
    final l$foodItems = foodItems;
    final l$calories = calories;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$planId,
      l$mealType,
      l$foodItems,
      l$calories,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$getDietPlans$getDietPlans) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$planId = planId;
    final lOther$planId = other.planId;
    if (l$planId != lOther$planId) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$foodItems = foodItems;
    final lOther$foodItems = other.foodItems;
    if (l$foodItems != lOther$foodItems) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (l$calories != lOther$calories) {
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

extension UtilityExtension$Query$getDietPlans$getDietPlans
    on Query$getDietPlans$getDietPlans {
  CopyWith$Query$getDietPlans$getDietPlans<Query$getDietPlans$getDietPlans>
      get copyWith => CopyWith$Query$getDietPlans$getDietPlans(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$getDietPlans$getDietPlans<TRes> {
  factory CopyWith$Query$getDietPlans$getDietPlans(
    Query$getDietPlans$getDietPlans instance,
    TRes Function(Query$getDietPlans$getDietPlans) then,
  ) = _CopyWithImpl$Query$getDietPlans$getDietPlans;

  factory CopyWith$Query$getDietPlans$getDietPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$getDietPlans$getDietPlans;

  TRes call({
    String? planId,
    String? mealType,
    String? foodItems,
    double? calories,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$getDietPlans$getDietPlans<TRes>
    implements CopyWith$Query$getDietPlans$getDietPlans<TRes> {
  _CopyWithImpl$Query$getDietPlans$getDietPlans(
    this._instance,
    this._then,
  );

  final Query$getDietPlans$getDietPlans _instance;

  final TRes Function(Query$getDietPlans$getDietPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? planId = _undefined,
    Object? mealType = _undefined,
    Object? foodItems = _undefined,
    Object? calories = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$getDietPlans$getDietPlans(
        planId: planId == _undefined || planId == null
            ? _instance.planId
            : (planId as String),
        mealType: mealType == _undefined || mealType == null
            ? _instance.mealType
            : (mealType as String),
        foodItems: foodItems == _undefined || foodItems == null
            ? _instance.foodItems
            : (foodItems as String),
        calories: calories == _undefined || calories == null
            ? _instance.calories
            : (calories as double),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$getDietPlans$getDietPlans<TRes>
    implements CopyWith$Query$getDietPlans$getDietPlans<TRes> {
  _CopyWithStubImpl$Query$getDietPlans$getDietPlans(this._res);

  TRes _res;

  call({
    String? planId,
    String? mealType,
    String? foodItems,
    double? calories,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$createDietPlan {
  factory Variables$Mutation$createDietPlan({
    required String userId,
    required String mealType,
    required String foodItems,
    required double calories,
  }) =>
      Variables$Mutation$createDietPlan._({
        r'userId': userId,
        r'mealType': mealType,
        r'foodItems': foodItems,
        r'calories': calories,
      });

  Variables$Mutation$createDietPlan._(this._$data);

  factory Variables$Mutation$createDietPlan.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    final l$mealType = data['mealType'];
    result$data['mealType'] = (l$mealType as String);
    final l$foodItems = data['foodItems'];
    result$data['foodItems'] = (l$foodItems as String);
    final l$calories = data['calories'];
    result$data['calories'] = (l$calories as num).toDouble();
    return Variables$Mutation$createDietPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  String get userId => (_$data['userId'] as String);

  String get mealType => (_$data['mealType'] as String);

  String get foodItems => (_$data['foodItems'] as String);

  double get calories => (_$data['calories'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$userId = userId;
    result$data['userId'] = l$userId;
    final l$mealType = mealType;
    result$data['mealType'] = l$mealType;
    final l$foodItems = foodItems;
    result$data['foodItems'] = l$foodItems;
    final l$calories = calories;
    result$data['calories'] = l$calories;
    return result$data;
  }

  CopyWith$Variables$Mutation$createDietPlan<Variables$Mutation$createDietPlan>
      get copyWith => CopyWith$Variables$Mutation$createDietPlan(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$createDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$foodItems = foodItems;
    final lOther$foodItems = other.foodItems;
    if (l$foodItems != lOther$foodItems) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (l$calories != lOther$calories) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$userId = userId;
    final l$mealType = mealType;
    final l$foodItems = foodItems;
    final l$calories = calories;
    return Object.hashAll([
      l$userId,
      l$mealType,
      l$foodItems,
      l$calories,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$createDietPlan<TRes> {
  factory CopyWith$Variables$Mutation$createDietPlan(
    Variables$Mutation$createDietPlan instance,
    TRes Function(Variables$Mutation$createDietPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$createDietPlan;

  factory CopyWith$Variables$Mutation$createDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$createDietPlan;

  TRes call({
    String? userId,
    String? mealType,
    String? foodItems,
    double? calories,
  });
}

class _CopyWithImpl$Variables$Mutation$createDietPlan<TRes>
    implements CopyWith$Variables$Mutation$createDietPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$createDietPlan(
    this._instance,
    this._then,
  );

  final Variables$Mutation$createDietPlan _instance;

  final TRes Function(Variables$Mutation$createDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? userId = _undefined,
    Object? mealType = _undefined,
    Object? foodItems = _undefined,
    Object? calories = _undefined,
  }) =>
      _then(Variables$Mutation$createDietPlan._({
        ..._instance._$data,
        if (userId != _undefined && userId != null)
          'userId': (userId as String),
        if (mealType != _undefined && mealType != null)
          'mealType': (mealType as String),
        if (foodItems != _undefined && foodItems != null)
          'foodItems': (foodItems as String),
        if (calories != _undefined && calories != null)
          'calories': (calories as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$createDietPlan<TRes>
    implements CopyWith$Variables$Mutation$createDietPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$createDietPlan(this._res);

  TRes _res;

  call({
    String? userId,
    String? mealType,
    String? foodItems,
    double? calories,
  }) =>
      _res;
}

class Mutation$createDietPlan {
  Mutation$createDietPlan({
    this.createDietPlan,
    this.$__typename = 'Mutation',
  });

  factory Mutation$createDietPlan.fromJson(Map<String, dynamic> json) {
    final l$createDietPlan = json['createDietPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$createDietPlan(
      createDietPlan: l$createDietPlan == null
          ? null
          : Mutation$createDietPlan$createDietPlan.fromJson(
              (l$createDietPlan as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$createDietPlan$createDietPlan? createDietPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createDietPlan = createDietPlan;
    _resultData['createDietPlan'] = l$createDietPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createDietPlan = createDietPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createDietPlan,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createDietPlan = createDietPlan;
    final lOther$createDietPlan = other.createDietPlan;
    if (l$createDietPlan != lOther$createDietPlan) {
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

extension UtilityExtension$Mutation$createDietPlan on Mutation$createDietPlan {
  CopyWith$Mutation$createDietPlan<Mutation$createDietPlan> get copyWith =>
      CopyWith$Mutation$createDietPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$createDietPlan<TRes> {
  factory CopyWith$Mutation$createDietPlan(
    Mutation$createDietPlan instance,
    TRes Function(Mutation$createDietPlan) then,
  ) = _CopyWithImpl$Mutation$createDietPlan;

  factory CopyWith$Mutation$createDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createDietPlan;

  TRes call({
    Mutation$createDietPlan$createDietPlan? createDietPlan,
    String? $__typename,
  });
  CopyWith$Mutation$createDietPlan$createDietPlan<TRes> get createDietPlan;
}

class _CopyWithImpl$Mutation$createDietPlan<TRes>
    implements CopyWith$Mutation$createDietPlan<TRes> {
  _CopyWithImpl$Mutation$createDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$createDietPlan _instance;

  final TRes Function(Mutation$createDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createDietPlan = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createDietPlan(
        createDietPlan: createDietPlan == _undefined
            ? _instance.createDietPlan
            : (createDietPlan as Mutation$createDietPlan$createDietPlan?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$createDietPlan$createDietPlan<TRes> get createDietPlan {
    final local$createDietPlan = _instance.createDietPlan;
    return local$createDietPlan == null
        ? CopyWith$Mutation$createDietPlan$createDietPlan.stub(_then(_instance))
        : CopyWith$Mutation$createDietPlan$createDietPlan(
            local$createDietPlan, (e) => call(createDietPlan: e));
  }
}

class _CopyWithStubImpl$Mutation$createDietPlan<TRes>
    implements CopyWith$Mutation$createDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$createDietPlan(this._res);

  TRes _res;

  call({
    Mutation$createDietPlan$createDietPlan? createDietPlan,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$createDietPlan$createDietPlan<TRes> get createDietPlan =>
      CopyWith$Mutation$createDietPlan$createDietPlan.stub(_res);
}

const documentNodeMutationcreateDietPlan = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createDietPlan'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mealType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'foodItems')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'calories')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createDietPlan'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mealType'),
            value: VariableNode(name: NameNode(value: 'mealType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'foodItems'),
            value: VariableNode(name: NameNode(value: 'foodItems')),
          ),
          ArgumentNode(
            name: NameNode(value: 'calories'),
            value: VariableNode(name: NameNode(value: 'calories')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'planId'),
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
Mutation$createDietPlan _parserFn$Mutation$createDietPlan(
        Map<String, dynamic> data) =>
    Mutation$createDietPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$createDietPlan = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$createDietPlan?,
);

class Options$Mutation$createDietPlan
    extends graphql.MutationOptions<Mutation$createDietPlan> {
  Options$Mutation$createDietPlan({
    String? operationName,
    required Variables$Mutation$createDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$createDietPlan>? update,
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
                        : _parserFn$Mutation$createDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateDietPlan,
          parserFn: _parserFn$Mutation$createDietPlan,
        );

  final OnMutationCompleted$Mutation$createDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$createDietPlan
    extends graphql.WatchQueryOptions<Mutation$createDietPlan> {
  WatchOptions$Mutation$createDietPlan({
    String? operationName,
    required Variables$Mutation$createDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createDietPlan? typedOptimisticResult,
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
          document: documentNodeMutationcreateDietPlan,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$createDietPlan,
        );
}

extension ClientExtension$Mutation$createDietPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$createDietPlan>> mutate$createDietPlan(
          Options$Mutation$createDietPlan options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$createDietPlan> watchMutation$createDietPlan(
          WatchOptions$Mutation$createDietPlan options) =>
      this.watchMutation(options);
}

class Mutation$createDietPlan$HookResult {
  Mutation$createDietPlan$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$createDietPlan runMutation;

  final graphql.QueryResult<Mutation$createDietPlan> result;
}

Mutation$createDietPlan$HookResult useMutation$createDietPlan(
    [WidgetOptions$Mutation$createDietPlan? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$createDietPlan());
  return Mutation$createDietPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$createDietPlan>
    useWatchMutation$createDietPlan(
            WatchOptions$Mutation$createDietPlan options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$createDietPlan
    extends graphql.MutationOptions<Mutation$createDietPlan> {
  WidgetOptions$Mutation$createDietPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$createDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$createDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$createDietPlan>? update,
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
                        : _parserFn$Mutation$createDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationcreateDietPlan,
          parserFn: _parserFn$Mutation$createDietPlan,
        );

  final OnMutationCompleted$Mutation$createDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$createDietPlan
    = graphql.MultiSourceResult<Mutation$createDietPlan> Function(
  Variables$Mutation$createDietPlan, {
  Object? optimisticResult,
  Mutation$createDietPlan? typedOptimisticResult,
});
typedef Builder$Mutation$createDietPlan = widgets.Widget Function(
  RunMutation$Mutation$createDietPlan,
  graphql.QueryResult<Mutation$createDietPlan>?,
);

class Mutation$createDietPlan$Widget
    extends graphql_flutter.Mutation<Mutation$createDietPlan> {
  Mutation$createDietPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$createDietPlan? options,
    required Builder$Mutation$createDietPlan builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$createDietPlan(),
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

class Mutation$createDietPlan$createDietPlan {
  Mutation$createDietPlan$createDietPlan({
    required this.planId,
    required this.message,
    this.$__typename = 'CreateDietPlanResponse',
  });

  factory Mutation$createDietPlan$createDietPlan.fromJson(
      Map<String, dynamic> json) {
    final l$planId = json['planId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$createDietPlan$createDietPlan(
      planId: (l$planId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String planId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$planId = planId;
    _resultData['planId'] = l$planId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$planId = planId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$planId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$createDietPlan$createDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$planId = planId;
    final lOther$planId = other.planId;
    if (l$planId != lOther$planId) {
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

extension UtilityExtension$Mutation$createDietPlan$createDietPlan
    on Mutation$createDietPlan$createDietPlan {
  CopyWith$Mutation$createDietPlan$createDietPlan<
          Mutation$createDietPlan$createDietPlan>
      get copyWith => CopyWith$Mutation$createDietPlan$createDietPlan(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$createDietPlan$createDietPlan<TRes> {
  factory CopyWith$Mutation$createDietPlan$createDietPlan(
    Mutation$createDietPlan$createDietPlan instance,
    TRes Function(Mutation$createDietPlan$createDietPlan) then,
  ) = _CopyWithImpl$Mutation$createDietPlan$createDietPlan;

  factory CopyWith$Mutation$createDietPlan$createDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$createDietPlan$createDietPlan;

  TRes call({
    String? planId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$createDietPlan$createDietPlan<TRes>
    implements CopyWith$Mutation$createDietPlan$createDietPlan<TRes> {
  _CopyWithImpl$Mutation$createDietPlan$createDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$createDietPlan$createDietPlan _instance;

  final TRes Function(Mutation$createDietPlan$createDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? planId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$createDietPlan$createDietPlan(
        planId: planId == _undefined || planId == null
            ? _instance.planId
            : (planId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$createDietPlan$createDietPlan<TRes>
    implements CopyWith$Mutation$createDietPlan$createDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$createDietPlan$createDietPlan(this._res);

  TRes _res;

  call({
    String? planId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$updateDietPlan {
  factory Variables$Mutation$updateDietPlan({
    required String planId,
    String? mealType,
    String? foodItems,
    double? calories,
  }) =>
      Variables$Mutation$updateDietPlan._({
        r'planId': planId,
        if (mealType != null) r'mealType': mealType,
        if (foodItems != null) r'foodItems': foodItems,
        if (calories != null) r'calories': calories,
      });

  Variables$Mutation$updateDietPlan._(this._$data);

  factory Variables$Mutation$updateDietPlan.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$planId = data['planId'];
    result$data['planId'] = (l$planId as String);
    if (data.containsKey('mealType')) {
      final l$mealType = data['mealType'];
      result$data['mealType'] = (l$mealType as String?);
    }
    if (data.containsKey('foodItems')) {
      final l$foodItems = data['foodItems'];
      result$data['foodItems'] = (l$foodItems as String?);
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as num?)?.toDouble();
    }
    return Variables$Mutation$updateDietPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  String get planId => (_$data['planId'] as String);

  String? get mealType => (_$data['mealType'] as String?);

  String? get foodItems => (_$data['foodItems'] as String?);

  double? get calories => (_$data['calories'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$planId = planId;
    result$data['planId'] = l$planId;
    if (_$data.containsKey('mealType')) {
      final l$mealType = mealType;
      result$data['mealType'] = l$mealType;
    }
    if (_$data.containsKey('foodItems')) {
      final l$foodItems = foodItems;
      result$data['foodItems'] = l$foodItems;
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$updateDietPlan<Variables$Mutation$updateDietPlan>
      get copyWith => CopyWith$Variables$Mutation$updateDietPlan(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$updateDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$planId = planId;
    final lOther$planId = other.planId;
    if (l$planId != lOther$planId) {
      return false;
    }
    final l$mealType = mealType;
    final lOther$mealType = other.mealType;
    if (_$data.containsKey('mealType') !=
        other._$data.containsKey('mealType')) {
      return false;
    }
    if (l$mealType != lOther$mealType) {
      return false;
    }
    final l$foodItems = foodItems;
    final lOther$foodItems = other.foodItems;
    if (_$data.containsKey('foodItems') !=
        other._$data.containsKey('foodItems')) {
      return false;
    }
    if (l$foodItems != lOther$foodItems) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != lOther$calories) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$planId = planId;
    final l$mealType = mealType;
    final l$foodItems = foodItems;
    final l$calories = calories;
    return Object.hashAll([
      l$planId,
      _$data.containsKey('mealType') ? l$mealType : const {},
      _$data.containsKey('foodItems') ? l$foodItems : const {},
      _$data.containsKey('calories') ? l$calories : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$updateDietPlan<TRes> {
  factory CopyWith$Variables$Mutation$updateDietPlan(
    Variables$Mutation$updateDietPlan instance,
    TRes Function(Variables$Mutation$updateDietPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$updateDietPlan;

  factory CopyWith$Variables$Mutation$updateDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$updateDietPlan;

  TRes call({
    String? planId,
    String? mealType,
    String? foodItems,
    double? calories,
  });
}

class _CopyWithImpl$Variables$Mutation$updateDietPlan<TRes>
    implements CopyWith$Variables$Mutation$updateDietPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$updateDietPlan(
    this._instance,
    this._then,
  );

  final Variables$Mutation$updateDietPlan _instance;

  final TRes Function(Variables$Mutation$updateDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? planId = _undefined,
    Object? mealType = _undefined,
    Object? foodItems = _undefined,
    Object? calories = _undefined,
  }) =>
      _then(Variables$Mutation$updateDietPlan._({
        ..._instance._$data,
        if (planId != _undefined && planId != null)
          'planId': (planId as String),
        if (mealType != _undefined) 'mealType': (mealType as String?),
        if (foodItems != _undefined) 'foodItems': (foodItems as String?),
        if (calories != _undefined) 'calories': (calories as double?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$updateDietPlan<TRes>
    implements CopyWith$Variables$Mutation$updateDietPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$updateDietPlan(this._res);

  TRes _res;

  call({
    String? planId,
    String? mealType,
    String? foodItems,
    double? calories,
  }) =>
      _res;
}

class Mutation$updateDietPlan {
  Mutation$updateDietPlan({
    this.updateDietPlan,
    this.$__typename = 'Mutation',
  });

  factory Mutation$updateDietPlan.fromJson(Map<String, dynamic> json) {
    final l$updateDietPlan = json['updateDietPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDietPlan(
      updateDietPlan: l$updateDietPlan == null
          ? null
          : Mutation$updateDietPlan$updateDietPlan.fromJson(
              (l$updateDietPlan as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$updateDietPlan$updateDietPlan? updateDietPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateDietPlan = updateDietPlan;
    _resultData['updateDietPlan'] = l$updateDietPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateDietPlan = updateDietPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateDietPlan,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateDietPlan = updateDietPlan;
    final lOther$updateDietPlan = other.updateDietPlan;
    if (l$updateDietPlan != lOther$updateDietPlan) {
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

extension UtilityExtension$Mutation$updateDietPlan on Mutation$updateDietPlan {
  CopyWith$Mutation$updateDietPlan<Mutation$updateDietPlan> get copyWith =>
      CopyWith$Mutation$updateDietPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$updateDietPlan<TRes> {
  factory CopyWith$Mutation$updateDietPlan(
    Mutation$updateDietPlan instance,
    TRes Function(Mutation$updateDietPlan) then,
  ) = _CopyWithImpl$Mutation$updateDietPlan;

  factory CopyWith$Mutation$updateDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDietPlan;

  TRes call({
    Mutation$updateDietPlan$updateDietPlan? updateDietPlan,
    String? $__typename,
  });
  CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> get updateDietPlan;
}

class _CopyWithImpl$Mutation$updateDietPlan<TRes>
    implements CopyWith$Mutation$updateDietPlan<TRes> {
  _CopyWithImpl$Mutation$updateDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$updateDietPlan _instance;

  final TRes Function(Mutation$updateDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateDietPlan = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDietPlan(
        updateDietPlan: updateDietPlan == _undefined
            ? _instance.updateDietPlan
            : (updateDietPlan as Mutation$updateDietPlan$updateDietPlan?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> get updateDietPlan {
    final local$updateDietPlan = _instance.updateDietPlan;
    return local$updateDietPlan == null
        ? CopyWith$Mutation$updateDietPlan$updateDietPlan.stub(_then(_instance))
        : CopyWith$Mutation$updateDietPlan$updateDietPlan(
            local$updateDietPlan, (e) => call(updateDietPlan: e));
  }
}

class _CopyWithStubImpl$Mutation$updateDietPlan<TRes>
    implements CopyWith$Mutation$updateDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$updateDietPlan(this._res);

  TRes _res;

  call({
    Mutation$updateDietPlan$updateDietPlan? updateDietPlan,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> get updateDietPlan =>
      CopyWith$Mutation$updateDietPlan$updateDietPlan.stub(_res);
}

const documentNodeMutationupdateDietPlan = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateDietPlan'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'planId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'mealType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'foodItems')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'calories')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateDietPlan'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'planId'),
            value: VariableNode(name: NameNode(value: 'planId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'mealType'),
            value: VariableNode(name: NameNode(value: 'mealType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'foodItems'),
            value: VariableNode(name: NameNode(value: 'foodItems')),
          ),
          ArgumentNode(
            name: NameNode(value: 'calories'),
            value: VariableNode(name: NameNode(value: 'calories')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'planId'),
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
Mutation$updateDietPlan _parserFn$Mutation$updateDietPlan(
        Map<String, dynamic> data) =>
    Mutation$updateDietPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$updateDietPlan = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$updateDietPlan?,
);

class Options$Mutation$updateDietPlan
    extends graphql.MutationOptions<Mutation$updateDietPlan> {
  Options$Mutation$updateDietPlan({
    String? operationName,
    required Variables$Mutation$updateDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDietPlan>? update,
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
                        : _parserFn$Mutation$updateDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDietPlan,
          parserFn: _parserFn$Mutation$updateDietPlan,
        );

  final OnMutationCompleted$Mutation$updateDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$updateDietPlan
    extends graphql.WatchQueryOptions<Mutation$updateDietPlan> {
  WatchOptions$Mutation$updateDietPlan({
    String? operationName,
    required Variables$Mutation$updateDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateDietPlan? typedOptimisticResult,
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
          document: documentNodeMutationupdateDietPlan,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$updateDietPlan,
        );
}

extension ClientExtension$Mutation$updateDietPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$updateDietPlan>> mutate$updateDietPlan(
          Options$Mutation$updateDietPlan options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$updateDietPlan> watchMutation$updateDietPlan(
          WatchOptions$Mutation$updateDietPlan options) =>
      this.watchMutation(options);
}

class Mutation$updateDietPlan$HookResult {
  Mutation$updateDietPlan$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$updateDietPlan runMutation;

  final graphql.QueryResult<Mutation$updateDietPlan> result;
}

Mutation$updateDietPlan$HookResult useMutation$updateDietPlan(
    [WidgetOptions$Mutation$updateDietPlan? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$updateDietPlan());
  return Mutation$updateDietPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$updateDietPlan>
    useWatchMutation$updateDietPlan(
            WatchOptions$Mutation$updateDietPlan options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$updateDietPlan
    extends graphql.MutationOptions<Mutation$updateDietPlan> {
  WidgetOptions$Mutation$updateDietPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$updateDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$updateDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$updateDietPlan>? update,
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
                        : _parserFn$Mutation$updateDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationupdateDietPlan,
          parserFn: _parserFn$Mutation$updateDietPlan,
        );

  final OnMutationCompleted$Mutation$updateDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$updateDietPlan
    = graphql.MultiSourceResult<Mutation$updateDietPlan> Function(
  Variables$Mutation$updateDietPlan, {
  Object? optimisticResult,
  Mutation$updateDietPlan? typedOptimisticResult,
});
typedef Builder$Mutation$updateDietPlan = widgets.Widget Function(
  RunMutation$Mutation$updateDietPlan,
  graphql.QueryResult<Mutation$updateDietPlan>?,
);

class Mutation$updateDietPlan$Widget
    extends graphql_flutter.Mutation<Mutation$updateDietPlan> {
  Mutation$updateDietPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$updateDietPlan? options,
    required Builder$Mutation$updateDietPlan builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$updateDietPlan(),
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

class Mutation$updateDietPlan$updateDietPlan {
  Mutation$updateDietPlan$updateDietPlan({
    required this.planId,
    required this.message,
    this.$__typename = 'UpdateDietPlanResponse',
  });

  factory Mutation$updateDietPlan$updateDietPlan.fromJson(
      Map<String, dynamic> json) {
    final l$planId = json['planId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$updateDietPlan$updateDietPlan(
      planId: (l$planId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String planId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$planId = planId;
    _resultData['planId'] = l$planId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$planId = planId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$planId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$updateDietPlan$updateDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$planId = planId;
    final lOther$planId = other.planId;
    if (l$planId != lOther$planId) {
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

extension UtilityExtension$Mutation$updateDietPlan$updateDietPlan
    on Mutation$updateDietPlan$updateDietPlan {
  CopyWith$Mutation$updateDietPlan$updateDietPlan<
          Mutation$updateDietPlan$updateDietPlan>
      get copyWith => CopyWith$Mutation$updateDietPlan$updateDietPlan(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> {
  factory CopyWith$Mutation$updateDietPlan$updateDietPlan(
    Mutation$updateDietPlan$updateDietPlan instance,
    TRes Function(Mutation$updateDietPlan$updateDietPlan) then,
  ) = _CopyWithImpl$Mutation$updateDietPlan$updateDietPlan;

  factory CopyWith$Mutation$updateDietPlan$updateDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$updateDietPlan$updateDietPlan;

  TRes call({
    String? planId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$updateDietPlan$updateDietPlan<TRes>
    implements CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> {
  _CopyWithImpl$Mutation$updateDietPlan$updateDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$updateDietPlan$updateDietPlan _instance;

  final TRes Function(Mutation$updateDietPlan$updateDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? planId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$updateDietPlan$updateDietPlan(
        planId: planId == _undefined || planId == null
            ? _instance.planId
            : (planId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$updateDietPlan$updateDietPlan<TRes>
    implements CopyWith$Mutation$updateDietPlan$updateDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$updateDietPlan$updateDietPlan(this._res);

  TRes _res;

  call({
    String? planId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$deleteDietPlan {
  factory Variables$Mutation$deleteDietPlan({required String planId}) =>
      Variables$Mutation$deleteDietPlan._({
        r'planId': planId,
      });

  Variables$Mutation$deleteDietPlan._(this._$data);

  factory Variables$Mutation$deleteDietPlan.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$planId = data['planId'];
    result$data['planId'] = (l$planId as String);
    return Variables$Mutation$deleteDietPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  String get planId => (_$data['planId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$planId = planId;
    result$data['planId'] = l$planId;
    return result$data;
  }

  CopyWith$Variables$Mutation$deleteDietPlan<Variables$Mutation$deleteDietPlan>
      get copyWith => CopyWith$Variables$Mutation$deleteDietPlan(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$deleteDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$planId = planId;
    final lOther$planId = other.planId;
    if (l$planId != lOther$planId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$planId = planId;
    return Object.hashAll([l$planId]);
  }
}

abstract class CopyWith$Variables$Mutation$deleteDietPlan<TRes> {
  factory CopyWith$Variables$Mutation$deleteDietPlan(
    Variables$Mutation$deleteDietPlan instance,
    TRes Function(Variables$Mutation$deleteDietPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$deleteDietPlan;

  factory CopyWith$Variables$Mutation$deleteDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$deleteDietPlan;

  TRes call({String? planId});
}

class _CopyWithImpl$Variables$Mutation$deleteDietPlan<TRes>
    implements CopyWith$Variables$Mutation$deleteDietPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$deleteDietPlan(
    this._instance,
    this._then,
  );

  final Variables$Mutation$deleteDietPlan _instance;

  final TRes Function(Variables$Mutation$deleteDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? planId = _undefined}) =>
      _then(Variables$Mutation$deleteDietPlan._({
        ..._instance._$data,
        if (planId != _undefined && planId != null)
          'planId': (planId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$deleteDietPlan<TRes>
    implements CopyWith$Variables$Mutation$deleteDietPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$deleteDietPlan(this._res);

  TRes _res;

  call({String? planId}) => _res;
}

class Mutation$deleteDietPlan {
  Mutation$deleteDietPlan({
    this.deleteDietPlan,
    this.$__typename = 'Mutation',
  });

  factory Mutation$deleteDietPlan.fromJson(Map<String, dynamic> json) {
    final l$deleteDietPlan = json['deleteDietPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteDietPlan(
      deleteDietPlan: l$deleteDietPlan == null
          ? null
          : Mutation$deleteDietPlan$deleteDietPlan.fromJson(
              (l$deleteDietPlan as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$deleteDietPlan$deleteDietPlan? deleteDietPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteDietPlan = deleteDietPlan;
    _resultData['deleteDietPlan'] = l$deleteDietPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteDietPlan = deleteDietPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteDietPlan,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$deleteDietPlan) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteDietPlan = deleteDietPlan;
    final lOther$deleteDietPlan = other.deleteDietPlan;
    if (l$deleteDietPlan != lOther$deleteDietPlan) {
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

extension UtilityExtension$Mutation$deleteDietPlan on Mutation$deleteDietPlan {
  CopyWith$Mutation$deleteDietPlan<Mutation$deleteDietPlan> get copyWith =>
      CopyWith$Mutation$deleteDietPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$deleteDietPlan<TRes> {
  factory CopyWith$Mutation$deleteDietPlan(
    Mutation$deleteDietPlan instance,
    TRes Function(Mutation$deleteDietPlan) then,
  ) = _CopyWithImpl$Mutation$deleteDietPlan;

  factory CopyWith$Mutation$deleteDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteDietPlan;

  TRes call({
    Mutation$deleteDietPlan$deleteDietPlan? deleteDietPlan,
    String? $__typename,
  });
  CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> get deleteDietPlan;
}

class _CopyWithImpl$Mutation$deleteDietPlan<TRes>
    implements CopyWith$Mutation$deleteDietPlan<TRes> {
  _CopyWithImpl$Mutation$deleteDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$deleteDietPlan _instance;

  final TRes Function(Mutation$deleteDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteDietPlan = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteDietPlan(
        deleteDietPlan: deleteDietPlan == _undefined
            ? _instance.deleteDietPlan
            : (deleteDietPlan as Mutation$deleteDietPlan$deleteDietPlan?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> get deleteDietPlan {
    final local$deleteDietPlan = _instance.deleteDietPlan;
    return local$deleteDietPlan == null
        ? CopyWith$Mutation$deleteDietPlan$deleteDietPlan.stub(_then(_instance))
        : CopyWith$Mutation$deleteDietPlan$deleteDietPlan(
            local$deleteDietPlan, (e) => call(deleteDietPlan: e));
  }
}

class _CopyWithStubImpl$Mutation$deleteDietPlan<TRes>
    implements CopyWith$Mutation$deleteDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$deleteDietPlan(this._res);

  TRes _res;

  call({
    Mutation$deleteDietPlan$deleteDietPlan? deleteDietPlan,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> get deleteDietPlan =>
      CopyWith$Mutation$deleteDietPlan$deleteDietPlan.stub(_res);
}

const documentNodeMutationdeleteDietPlan = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteDietPlan'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'planId')),
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
        name: NameNode(value: 'deleteDietPlan'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'planId'),
            value: VariableNode(name: NameNode(value: 'planId')),
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
Mutation$deleteDietPlan _parserFn$Mutation$deleteDietPlan(
        Map<String, dynamic> data) =>
    Mutation$deleteDietPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$deleteDietPlan = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$deleteDietPlan?,
);

class Options$Mutation$deleteDietPlan
    extends graphql.MutationOptions<Mutation$deleteDietPlan> {
  Options$Mutation$deleteDietPlan({
    String? operationName,
    required Variables$Mutation$deleteDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteDietPlan>? update,
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
                        : _parserFn$Mutation$deleteDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteDietPlan,
          parserFn: _parserFn$Mutation$deleteDietPlan,
        );

  final OnMutationCompleted$Mutation$deleteDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$deleteDietPlan
    extends graphql.WatchQueryOptions<Mutation$deleteDietPlan> {
  WatchOptions$Mutation$deleteDietPlan({
    String? operationName,
    required Variables$Mutation$deleteDietPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteDietPlan? typedOptimisticResult,
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
          document: documentNodeMutationdeleteDietPlan,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$deleteDietPlan,
        );
}

extension ClientExtension$Mutation$deleteDietPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$deleteDietPlan>> mutate$deleteDietPlan(
          Options$Mutation$deleteDietPlan options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$deleteDietPlan> watchMutation$deleteDietPlan(
          WatchOptions$Mutation$deleteDietPlan options) =>
      this.watchMutation(options);
}

class Mutation$deleteDietPlan$HookResult {
  Mutation$deleteDietPlan$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$deleteDietPlan runMutation;

  final graphql.QueryResult<Mutation$deleteDietPlan> result;
}

Mutation$deleteDietPlan$HookResult useMutation$deleteDietPlan(
    [WidgetOptions$Mutation$deleteDietPlan? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$deleteDietPlan());
  return Mutation$deleteDietPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$deleteDietPlan>
    useWatchMutation$deleteDietPlan(
            WatchOptions$Mutation$deleteDietPlan options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$deleteDietPlan
    extends graphql.MutationOptions<Mutation$deleteDietPlan> {
  WidgetOptions$Mutation$deleteDietPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$deleteDietPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$deleteDietPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$deleteDietPlan>? update,
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
                        : _parserFn$Mutation$deleteDietPlan(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationdeleteDietPlan,
          parserFn: _parserFn$Mutation$deleteDietPlan,
        );

  final OnMutationCompleted$Mutation$deleteDietPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$deleteDietPlan
    = graphql.MultiSourceResult<Mutation$deleteDietPlan> Function(
  Variables$Mutation$deleteDietPlan, {
  Object? optimisticResult,
  Mutation$deleteDietPlan? typedOptimisticResult,
});
typedef Builder$Mutation$deleteDietPlan = widgets.Widget Function(
  RunMutation$Mutation$deleteDietPlan,
  graphql.QueryResult<Mutation$deleteDietPlan>?,
);

class Mutation$deleteDietPlan$Widget
    extends graphql_flutter.Mutation<Mutation$deleteDietPlan> {
  Mutation$deleteDietPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$deleteDietPlan? options,
    required Builder$Mutation$deleteDietPlan builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$deleteDietPlan(),
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

class Mutation$deleteDietPlan$deleteDietPlan {
  Mutation$deleteDietPlan$deleteDietPlan({
    required this.message,
    this.$__typename = 'DeleteDietPlanResponse',
  });

  factory Mutation$deleteDietPlan$deleteDietPlan.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$deleteDietPlan$deleteDietPlan(
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
    if (!(other is Mutation$deleteDietPlan$deleteDietPlan) ||
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

extension UtilityExtension$Mutation$deleteDietPlan$deleteDietPlan
    on Mutation$deleteDietPlan$deleteDietPlan {
  CopyWith$Mutation$deleteDietPlan$deleteDietPlan<
          Mutation$deleteDietPlan$deleteDietPlan>
      get copyWith => CopyWith$Mutation$deleteDietPlan$deleteDietPlan(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> {
  factory CopyWith$Mutation$deleteDietPlan$deleteDietPlan(
    Mutation$deleteDietPlan$deleteDietPlan instance,
    TRes Function(Mutation$deleteDietPlan$deleteDietPlan) then,
  ) = _CopyWithImpl$Mutation$deleteDietPlan$deleteDietPlan;

  factory CopyWith$Mutation$deleteDietPlan$deleteDietPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$deleteDietPlan$deleteDietPlan;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$deleteDietPlan$deleteDietPlan<TRes>
    implements CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> {
  _CopyWithImpl$Mutation$deleteDietPlan$deleteDietPlan(
    this._instance,
    this._then,
  );

  final Mutation$deleteDietPlan$deleteDietPlan _instance;

  final TRes Function(Mutation$deleteDietPlan$deleteDietPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$deleteDietPlan$deleteDietPlan(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$deleteDietPlan$deleteDietPlan<TRes>
    implements CopyWith$Mutation$deleteDietPlan$deleteDietPlan<TRes> {
  _CopyWithStubImpl$Mutation$deleteDietPlan$deleteDietPlan(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
