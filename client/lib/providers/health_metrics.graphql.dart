import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Variables$Query$GetHealthMetrics {
  factory Variables$Query$GetHealthMetrics({
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  }) =>
      Variables$Query$GetHealthMetrics._({
        if (startDate != null) r'startDate': startDate,
        if (endDate != null) r'endDate': endDate,
        if (metricType != null) r'metricType': metricType,
      });

  Variables$Query$GetHealthMetrics._(this._$data);

  factory Variables$Query$GetHealthMetrics.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] =
          l$startDate == null ? null : dateTimeFromJson(l$startDate);
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] =
          l$endDate == null ? null : dateTimeFromJson(l$endDate);
    }
    if (data.containsKey('metricType')) {
      final l$metricType = data['metricType'];
      result$data['metricType'] = (l$metricType as String?);
    }
    return Variables$Query$GetHealthMetrics._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get metricType => (_$data['metricType'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] =
          l$startDate == null ? null : dateTimeToJson(l$startDate);
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] =
          l$endDate == null ? null : dateTimeToJson(l$endDate);
    }
    if (_$data.containsKey('metricType')) {
      final l$metricType = metricType;
      result$data['metricType'] = l$metricType;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetHealthMetrics<Variables$Query$GetHealthMetrics>
      get copyWith => CopyWith$Variables$Query$GetHealthMetrics(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$metricType = metricType;
    final lOther$metricType = other.metricType;
    if (_$data.containsKey('metricType') !=
        other._$data.containsKey('metricType')) {
      return false;
    }
    if (l$metricType != lOther$metricType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$metricType = metricType;
    return Object.hashAll([
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('metricType') ? l$metricType : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetHealthMetrics<TRes> {
  factory CopyWith$Variables$Query$GetHealthMetrics(
    Variables$Query$GetHealthMetrics instance,
    TRes Function(Variables$Query$GetHealthMetrics) then,
  ) = _CopyWithImpl$Variables$Query$GetHealthMetrics;

  factory CopyWith$Variables$Query$GetHealthMetrics.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetHealthMetrics;

  TRes call({
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  });
}

class _CopyWithImpl$Variables$Query$GetHealthMetrics<TRes>
    implements CopyWith$Variables$Query$GetHealthMetrics<TRes> {
  _CopyWithImpl$Variables$Query$GetHealthMetrics(
    this._instance,
    this._then,
  );

  final Variables$Query$GetHealthMetrics _instance;

  final TRes Function(Variables$Query$GetHealthMetrics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? metricType = _undefined,
  }) =>
      _then(Variables$Query$GetHealthMetrics._({
        ..._instance._$data,
        if (startDate != _undefined) 'startDate': (startDate as DateTime?),
        if (endDate != _undefined) 'endDate': (endDate as DateTime?),
        if (metricType != _undefined) 'metricType': (metricType as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetHealthMetrics<TRes>
    implements CopyWith$Variables$Query$GetHealthMetrics<TRes> {
  _CopyWithStubImpl$Variables$Query$GetHealthMetrics(this._res);

  TRes _res;

  call({
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  }) =>
      _res;
}

class Query$GetHealthMetrics {
  Query$GetHealthMetrics({
    this.getHealthMetrics,
    this.$__typename = 'Query',
  });

  factory Query$GetHealthMetrics.fromJson(Map<String, dynamic> json) {
    final l$getHealthMetrics = json['getHealthMetrics'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthMetrics(
      getHealthMetrics: (l$getHealthMetrics as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetHealthMetrics$getHealthMetrics.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetHealthMetrics$getHealthMetrics?>? getHealthMetrics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getHealthMetrics = getHealthMetrics;
    _resultData['getHealthMetrics'] =
        l$getHealthMetrics?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getHealthMetrics = getHealthMetrics;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getHealthMetrics == null
          ? null
          : Object.hashAll(l$getHealthMetrics.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getHealthMetrics = getHealthMetrics;
    final lOther$getHealthMetrics = other.getHealthMetrics;
    if (l$getHealthMetrics != null && lOther$getHealthMetrics != null) {
      if (l$getHealthMetrics.length != lOther$getHealthMetrics.length) {
        return false;
      }
      for (int i = 0; i < l$getHealthMetrics.length; i++) {
        final l$getHealthMetrics$entry = l$getHealthMetrics[i];
        final lOther$getHealthMetrics$entry = lOther$getHealthMetrics[i];
        if (l$getHealthMetrics$entry != lOther$getHealthMetrics$entry) {
          return false;
        }
      }
    } else if (l$getHealthMetrics != lOther$getHealthMetrics) {
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

extension UtilityExtension$Query$GetHealthMetrics on Query$GetHealthMetrics {
  CopyWith$Query$GetHealthMetrics<Query$GetHealthMetrics> get copyWith =>
      CopyWith$Query$GetHealthMetrics(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetHealthMetrics<TRes> {
  factory CopyWith$Query$GetHealthMetrics(
    Query$GetHealthMetrics instance,
    TRes Function(Query$GetHealthMetrics) then,
  ) = _CopyWithImpl$Query$GetHealthMetrics;

  factory CopyWith$Query$GetHealthMetrics.stub(TRes res) =
      _CopyWithStubImpl$Query$GetHealthMetrics;

  TRes call({
    List<Query$GetHealthMetrics$getHealthMetrics?>? getHealthMetrics,
    String? $__typename,
  });
  TRes getHealthMetrics(
      Iterable<Query$GetHealthMetrics$getHealthMetrics?>? Function(
              Iterable<
                  CopyWith$Query$GetHealthMetrics$getHealthMetrics<
                      Query$GetHealthMetrics$getHealthMetrics>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetHealthMetrics<TRes>
    implements CopyWith$Query$GetHealthMetrics<TRes> {
  _CopyWithImpl$Query$GetHealthMetrics(
    this._instance,
    this._then,
  );

  final Query$GetHealthMetrics _instance;

  final TRes Function(Query$GetHealthMetrics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getHealthMetrics = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetHealthMetrics(
        getHealthMetrics: getHealthMetrics == _undefined
            ? _instance.getHealthMetrics
            : (getHealthMetrics
                as List<Query$GetHealthMetrics$getHealthMetrics?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getHealthMetrics(
          Iterable<Query$GetHealthMetrics$getHealthMetrics?>? Function(
                  Iterable<
                      CopyWith$Query$GetHealthMetrics$getHealthMetrics<
                          Query$GetHealthMetrics$getHealthMetrics>?>?)
              _fn) =>
      call(
          getHealthMetrics: _fn(_instance.getHealthMetrics?.map((e) => e == null
              ? null
              : CopyWith$Query$GetHealthMetrics$getHealthMetrics(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetHealthMetrics<TRes>
    implements CopyWith$Query$GetHealthMetrics<TRes> {
  _CopyWithStubImpl$Query$GetHealthMetrics(this._res);

  TRes _res;

  call({
    List<Query$GetHealthMetrics$getHealthMetrics?>? getHealthMetrics,
    String? $__typename,
  }) =>
      _res;

  getHealthMetrics(_fn) => _res;
}

const documentNodeQueryGetHealthMetrics = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetHealthMetrics'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'startDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'endDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'metricType')),
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
        name: NameNode(value: 'getHealthMetrics'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'startDate'),
            value: VariableNode(name: NameNode(value: 'startDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'endDate'),
            value: VariableNode(name: NameNode(value: 'endDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'metricType'),
            value: VariableNode(name: NameNode(value: 'metricType')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'metricId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'metricType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'unit'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recordedAt'),
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
Query$GetHealthMetrics _parserFn$Query$GetHealthMetrics(
        Map<String, dynamic> data) =>
    Query$GetHealthMetrics.fromJson(data);
typedef OnQueryComplete$Query$GetHealthMetrics = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetHealthMetrics?,
);

class Options$Query$GetHealthMetrics
    extends graphql.QueryOptions<Query$GetHealthMetrics> {
  Options$Query$GetHealthMetrics({
    String? operationName,
    Variables$Query$GetHealthMetrics? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthMetrics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetHealthMetrics? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                        : _parserFn$Query$GetHealthMetrics(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetHealthMetrics,
          parserFn: _parserFn$Query$GetHealthMetrics,
        );

  final OnQueryComplete$Query$GetHealthMetrics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetHealthMetrics
    extends graphql.WatchQueryOptions<Query$GetHealthMetrics> {
  WatchOptions$Query$GetHealthMetrics({
    String? operationName,
    Variables$Query$GetHealthMetrics? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthMetrics? typedOptimisticResult,
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
          document: documentNodeQueryGetHealthMetrics,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetHealthMetrics,
        );
}

class FetchMoreOptions$Query$GetHealthMetrics extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetHealthMetrics({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetHealthMetrics? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryGetHealthMetrics,
        );
}

extension ClientExtension$Query$GetHealthMetrics on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetHealthMetrics>> query$GetHealthMetrics(
          [Options$Query$GetHealthMetrics? options]) async =>
      await this.query(options ?? Options$Query$GetHealthMetrics());
  graphql.ObservableQuery<Query$GetHealthMetrics> watchQuery$GetHealthMetrics(
          [WatchOptions$Query$GetHealthMetrics? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetHealthMetrics());
  void writeQuery$GetHealthMetrics({
    required Query$GetHealthMetrics data,
    Variables$Query$GetHealthMetrics? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetHealthMetrics),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetHealthMetrics? readQuery$GetHealthMetrics({
    Variables$Query$GetHealthMetrics? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetHealthMetrics),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetHealthMetrics.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetHealthMetrics>
    useQuery$GetHealthMetrics([Options$Query$GetHealthMetrics? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetHealthMetrics());
graphql.ObservableQuery<Query$GetHealthMetrics> useWatchQuery$GetHealthMetrics(
        [WatchOptions$Query$GetHealthMetrics? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetHealthMetrics());

class Query$GetHealthMetrics$Widget
    extends graphql_flutter.Query<Query$GetHealthMetrics> {
  Query$GetHealthMetrics$Widget({
    widgets.Key? key,
    Options$Query$GetHealthMetrics? options,
    required graphql_flutter.QueryBuilder<Query$GetHealthMetrics> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetHealthMetrics(),
          builder: builder,
        );
}

class Query$GetHealthMetrics$getHealthMetrics {
  Query$GetHealthMetrics$getHealthMetrics({
    required this.metricId,
    required this.metricType,
    required this.value,
    required this.unit,
    required this.recordedAt,
    this.$__typename = 'HealthMetricDetail',
  });

  factory Query$GetHealthMetrics$getHealthMetrics.fromJson(
      Map<String, dynamic> json) {
    final l$metricId = json['metricId'];
    final l$metricType = json['metricType'];
    final l$value = json['value'];
    final l$unit = json['unit'];
    final l$recordedAt = json['recordedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthMetrics$getHealthMetrics(
      metricId: (l$metricId as String),
      metricType: (l$metricType as String),
      value: (l$value as num).toDouble(),
      unit: (l$unit as String),
      recordedAt: dateTimeFromJson(l$recordedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String metricId;

  final String metricType;

  final double value;

  final String unit;

  final DateTime recordedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$metricId = metricId;
    _resultData['metricId'] = l$metricId;
    final l$metricType = metricType;
    _resultData['metricType'] = l$metricType;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$unit = unit;
    _resultData['unit'] = l$unit;
    final l$recordedAt = recordedAt;
    _resultData['recordedAt'] = dateTimeToJson(l$recordedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    final l$metricType = metricType;
    final l$value = value;
    final l$unit = unit;
    final l$recordedAt = recordedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$metricId,
      l$metricType,
      l$value,
      l$unit,
      l$recordedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetHealthMetrics$getHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
      return false;
    }
    final l$metricType = metricType;
    final lOther$metricType = other.metricType;
    if (l$metricType != lOther$metricType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$recordedAt = recordedAt;
    final lOther$recordedAt = other.recordedAt;
    if (l$recordedAt != lOther$recordedAt) {
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

extension UtilityExtension$Query$GetHealthMetrics$getHealthMetrics
    on Query$GetHealthMetrics$getHealthMetrics {
  CopyWith$Query$GetHealthMetrics$getHealthMetrics<
          Query$GetHealthMetrics$getHealthMetrics>
      get copyWith => CopyWith$Query$GetHealthMetrics$getHealthMetrics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthMetrics$getHealthMetrics<TRes> {
  factory CopyWith$Query$GetHealthMetrics$getHealthMetrics(
    Query$GetHealthMetrics$getHealthMetrics instance,
    TRes Function(Query$GetHealthMetrics$getHealthMetrics) then,
  ) = _CopyWithImpl$Query$GetHealthMetrics$getHealthMetrics;

  factory CopyWith$Query$GetHealthMetrics$getHealthMetrics.stub(TRes res) =
      _CopyWithStubImpl$Query$GetHealthMetrics$getHealthMetrics;

  TRes call({
    String? metricId,
    String? metricType,
    double? value,
    String? unit,
    DateTime? recordedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetHealthMetrics$getHealthMetrics<TRes>
    implements CopyWith$Query$GetHealthMetrics$getHealthMetrics<TRes> {
  _CopyWithImpl$Query$GetHealthMetrics$getHealthMetrics(
    this._instance,
    this._then,
  );

  final Query$GetHealthMetrics$getHealthMetrics _instance;

  final TRes Function(Query$GetHealthMetrics$getHealthMetrics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricId = _undefined,
    Object? metricType = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? recordedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetHealthMetrics$getHealthMetrics(
        metricId: metricId == _undefined || metricId == null
            ? _instance.metricId
            : (metricId as String),
        metricType: metricType == _undefined || metricType == null
            ? _instance.metricType
            : (metricType as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as double),
        unit: unit == _undefined || unit == null
            ? _instance.unit
            : (unit as String),
        recordedAt: recordedAt == _undefined || recordedAt == null
            ? _instance.recordedAt
            : (recordedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetHealthMetrics$getHealthMetrics<TRes>
    implements CopyWith$Query$GetHealthMetrics$getHealthMetrics<TRes> {
  _CopyWithStubImpl$Query$GetHealthMetrics$getHealthMetrics(this._res);

  TRes _res;

  call({
    String? metricId,
    String? metricType,
    double? value,
    String? unit,
    DateTime? recordedAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetSharedHealthMetrics {
  factory Variables$Query$GetSharedHealthMetrics({
    required String patientId,
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  }) =>
      Variables$Query$GetSharedHealthMetrics._({
        r'patientId': patientId,
        if (startDate != null) r'startDate': startDate,
        if (endDate != null) r'endDate': endDate,
        if (metricType != null) r'metricType': metricType,
      });

  Variables$Query$GetSharedHealthMetrics._(this._$data);

  factory Variables$Query$GetSharedHealthMetrics.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$patientId = data['patientId'];
    result$data['patientId'] = (l$patientId as String);
    if (data.containsKey('startDate')) {
      final l$startDate = data['startDate'];
      result$data['startDate'] =
          l$startDate == null ? null : dateTimeFromJson(l$startDate);
    }
    if (data.containsKey('endDate')) {
      final l$endDate = data['endDate'];
      result$data['endDate'] =
          l$endDate == null ? null : dateTimeFromJson(l$endDate);
    }
    if (data.containsKey('metricType')) {
      final l$metricType = data['metricType'];
      result$data['metricType'] = (l$metricType as String?);
    }
    return Variables$Query$GetSharedHealthMetrics._(result$data);
  }

  Map<String, dynamic> _$data;

  String get patientId => (_$data['patientId'] as String);

  DateTime? get startDate => (_$data['startDate'] as DateTime?);

  DateTime? get endDate => (_$data['endDate'] as DateTime?);

  String? get metricType => (_$data['metricType'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$patientId = patientId;
    result$data['patientId'] = l$patientId;
    if (_$data.containsKey('startDate')) {
      final l$startDate = startDate;
      result$data['startDate'] =
          l$startDate == null ? null : dateTimeToJson(l$startDate);
    }
    if (_$data.containsKey('endDate')) {
      final l$endDate = endDate;
      result$data['endDate'] =
          l$endDate == null ? null : dateTimeToJson(l$endDate);
    }
    if (_$data.containsKey('metricType')) {
      final l$metricType = metricType;
      result$data['metricType'] = l$metricType;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetSharedHealthMetrics<
          Variables$Query$GetSharedHealthMetrics>
      get copyWith => CopyWith$Variables$Query$GetSharedHealthMetrics(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSharedHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$patientId = patientId;
    final lOther$patientId = other.patientId;
    if (l$patientId != lOther$patientId) {
      return false;
    }
    final l$startDate = startDate;
    final lOther$startDate = other.startDate;
    if (_$data.containsKey('startDate') !=
        other._$data.containsKey('startDate')) {
      return false;
    }
    if (l$startDate != lOther$startDate) {
      return false;
    }
    final l$endDate = endDate;
    final lOther$endDate = other.endDate;
    if (_$data.containsKey('endDate') != other._$data.containsKey('endDate')) {
      return false;
    }
    if (l$endDate != lOther$endDate) {
      return false;
    }
    final l$metricType = metricType;
    final lOther$metricType = other.metricType;
    if (_$data.containsKey('metricType') !=
        other._$data.containsKey('metricType')) {
      return false;
    }
    if (l$metricType != lOther$metricType) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$patientId = patientId;
    final l$startDate = startDate;
    final l$endDate = endDate;
    final l$metricType = metricType;
    return Object.hashAll([
      l$patientId,
      _$data.containsKey('startDate') ? l$startDate : const {},
      _$data.containsKey('endDate') ? l$endDate : const {},
      _$data.containsKey('metricType') ? l$metricType : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetSharedHealthMetrics<TRes> {
  factory CopyWith$Variables$Query$GetSharedHealthMetrics(
    Variables$Query$GetSharedHealthMetrics instance,
    TRes Function(Variables$Query$GetSharedHealthMetrics) then,
  ) = _CopyWithImpl$Variables$Query$GetSharedHealthMetrics;

  factory CopyWith$Variables$Query$GetSharedHealthMetrics.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSharedHealthMetrics;

  TRes call({
    String? patientId,
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  });
}

class _CopyWithImpl$Variables$Query$GetSharedHealthMetrics<TRes>
    implements CopyWith$Variables$Query$GetSharedHealthMetrics<TRes> {
  _CopyWithImpl$Variables$Query$GetSharedHealthMetrics(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSharedHealthMetrics _instance;

  final TRes Function(Variables$Query$GetSharedHealthMetrics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? patientId = _undefined,
    Object? startDate = _undefined,
    Object? endDate = _undefined,
    Object? metricType = _undefined,
  }) =>
      _then(Variables$Query$GetSharedHealthMetrics._({
        ..._instance._$data,
        if (patientId != _undefined && patientId != null)
          'patientId': (patientId as String),
        if (startDate != _undefined) 'startDate': (startDate as DateTime?),
        if (endDate != _undefined) 'endDate': (endDate as DateTime?),
        if (metricType != _undefined) 'metricType': (metricType as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSharedHealthMetrics<TRes>
    implements CopyWith$Variables$Query$GetSharedHealthMetrics<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSharedHealthMetrics(this._res);

  TRes _res;

  call({
    String? patientId,
    DateTime? startDate,
    DateTime? endDate,
    String? metricType,
  }) =>
      _res;
}

class Query$GetSharedHealthMetrics {
  Query$GetSharedHealthMetrics({
    this.getSharedHealthMetrics,
    this.$__typename = 'Query',
  });

  factory Query$GetSharedHealthMetrics.fromJson(Map<String, dynamic> json) {
    final l$getSharedHealthMetrics = json['getSharedHealthMetrics'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedHealthMetrics(
      getSharedHealthMetrics: (l$getSharedHealthMetrics as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetSharedHealthMetrics$getSharedHealthMetrics.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>?
      getSharedHealthMetrics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSharedHealthMetrics = getSharedHealthMetrics;
    _resultData['getSharedHealthMetrics'] =
        l$getSharedHealthMetrics?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSharedHealthMetrics = getSharedHealthMetrics;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSharedHealthMetrics == null
          ? null
          : Object.hashAll(l$getSharedHealthMetrics.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSharedHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSharedHealthMetrics = getSharedHealthMetrics;
    final lOther$getSharedHealthMetrics = other.getSharedHealthMetrics;
    if (l$getSharedHealthMetrics != null &&
        lOther$getSharedHealthMetrics != null) {
      if (l$getSharedHealthMetrics.length !=
          lOther$getSharedHealthMetrics.length) {
        return false;
      }
      for (int i = 0; i < l$getSharedHealthMetrics.length; i++) {
        final l$getSharedHealthMetrics$entry = l$getSharedHealthMetrics[i];
        final lOther$getSharedHealthMetrics$entry =
            lOther$getSharedHealthMetrics[i];
        if (l$getSharedHealthMetrics$entry !=
            lOther$getSharedHealthMetrics$entry) {
          return false;
        }
      }
    } else if (l$getSharedHealthMetrics != lOther$getSharedHealthMetrics) {
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

extension UtilityExtension$Query$GetSharedHealthMetrics
    on Query$GetSharedHealthMetrics {
  CopyWith$Query$GetSharedHealthMetrics<Query$GetSharedHealthMetrics>
      get copyWith => CopyWith$Query$GetSharedHealthMetrics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedHealthMetrics<TRes> {
  factory CopyWith$Query$GetSharedHealthMetrics(
    Query$GetSharedHealthMetrics instance,
    TRes Function(Query$GetSharedHealthMetrics) then,
  ) = _CopyWithImpl$Query$GetSharedHealthMetrics;

  factory CopyWith$Query$GetSharedHealthMetrics.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSharedHealthMetrics;

  TRes call({
    List<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>?
        getSharedHealthMetrics,
    String? $__typename,
  });
  TRes getSharedHealthMetrics(
      Iterable<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>? Function(
              Iterable<
                  CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<
                      Query$GetSharedHealthMetrics$getSharedHealthMetrics>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetSharedHealthMetrics<TRes>
    implements CopyWith$Query$GetSharedHealthMetrics<TRes> {
  _CopyWithImpl$Query$GetSharedHealthMetrics(
    this._instance,
    this._then,
  );

  final Query$GetSharedHealthMetrics _instance;

  final TRes Function(Query$GetSharedHealthMetrics) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSharedHealthMetrics = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedHealthMetrics(
        getSharedHealthMetrics: getSharedHealthMetrics == _undefined
            ? _instance.getSharedHealthMetrics
            : (getSharedHealthMetrics
                as List<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getSharedHealthMetrics(
          Iterable<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>? Function(
                  Iterable<
                      CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<
                          Query$GetSharedHealthMetrics$getSharedHealthMetrics>?>?)
              _fn) =>
      call(
          getSharedHealthMetrics:
              _fn(_instance.getSharedHealthMetrics?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetSharedHealthMetrics<TRes>
    implements CopyWith$Query$GetSharedHealthMetrics<TRes> {
  _CopyWithStubImpl$Query$GetSharedHealthMetrics(this._res);

  TRes _res;

  call({
    List<Query$GetSharedHealthMetrics$getSharedHealthMetrics?>?
        getSharedHealthMetrics,
    String? $__typename,
  }) =>
      _res;

  getSharedHealthMetrics(_fn) => _res;
}

const documentNodeQueryGetSharedHealthMetrics = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSharedHealthMetrics'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'patientId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'startDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'endDate')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'metricType')),
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
        name: NameNode(value: 'getSharedHealthMetrics'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'patientId'),
            value: VariableNode(name: NameNode(value: 'patientId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'startDate'),
            value: VariableNode(name: NameNode(value: 'startDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'endDate'),
            value: VariableNode(name: NameNode(value: 'endDate')),
          ),
          ArgumentNode(
            name: NameNode(value: 'metricType'),
            value: VariableNode(name: NameNode(value: 'metricType')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'metricId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'metricType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'unit'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recordedAt'),
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
Query$GetSharedHealthMetrics _parserFn$Query$GetSharedHealthMetrics(
        Map<String, dynamic> data) =>
    Query$GetSharedHealthMetrics.fromJson(data);
typedef OnQueryComplete$Query$GetSharedHealthMetrics = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSharedHealthMetrics?,
);

class Options$Query$GetSharedHealthMetrics
    extends graphql.QueryOptions<Query$GetSharedHealthMetrics> {
  Options$Query$GetSharedHealthMetrics({
    String? operationName,
    required Variables$Query$GetSharedHealthMetrics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedHealthMetrics? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSharedHealthMetrics? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetSharedHealthMetrics(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSharedHealthMetrics,
          parserFn: _parserFn$Query$GetSharedHealthMetrics,
        );

  final OnQueryComplete$Query$GetSharedHealthMetrics? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSharedHealthMetrics
    extends graphql.WatchQueryOptions<Query$GetSharedHealthMetrics> {
  WatchOptions$Query$GetSharedHealthMetrics({
    String? operationName,
    required Variables$Query$GetSharedHealthMetrics variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedHealthMetrics? typedOptimisticResult,
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
          document: documentNodeQueryGetSharedHealthMetrics,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSharedHealthMetrics,
        );
}

class FetchMoreOptions$Query$GetSharedHealthMetrics
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSharedHealthMetrics({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSharedHealthMetrics variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSharedHealthMetrics,
        );
}

extension ClientExtension$Query$GetSharedHealthMetrics
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSharedHealthMetrics>>
      query$GetSharedHealthMetrics(
              Options$Query$GetSharedHealthMetrics options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetSharedHealthMetrics>
      watchQuery$GetSharedHealthMetrics(
              WatchOptions$Query$GetSharedHealthMetrics options) =>
          this.watchQuery(options);
  void writeQuery$GetSharedHealthMetrics({
    required Query$GetSharedHealthMetrics data,
    required Variables$Query$GetSharedHealthMetrics variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSharedHealthMetrics),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSharedHealthMetrics? readQuery$GetSharedHealthMetrics({
    required Variables$Query$GetSharedHealthMetrics variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetSharedHealthMetrics),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetSharedHealthMetrics.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSharedHealthMetrics>
    useQuery$GetSharedHealthMetrics(
            Options$Query$GetSharedHealthMetrics options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSharedHealthMetrics>
    useWatchQuery$GetSharedHealthMetrics(
            WatchOptions$Query$GetSharedHealthMetrics options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSharedHealthMetrics$Widget
    extends graphql_flutter.Query<Query$GetSharedHealthMetrics> {
  Query$GetSharedHealthMetrics$Widget({
    widgets.Key? key,
    required Options$Query$GetSharedHealthMetrics options,
    required graphql_flutter.QueryBuilder<Query$GetSharedHealthMetrics> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSharedHealthMetrics$getSharedHealthMetrics {
  Query$GetSharedHealthMetrics$getSharedHealthMetrics({
    required this.metricId,
    required this.metricType,
    required this.value,
    required this.unit,
    required this.recordedAt,
    this.$__typename = 'HealthMetricDetail',
  });

  factory Query$GetSharedHealthMetrics$getSharedHealthMetrics.fromJson(
      Map<String, dynamic> json) {
    final l$metricId = json['metricId'];
    final l$metricType = json['metricType'];
    final l$value = json['value'];
    final l$unit = json['unit'];
    final l$recordedAt = json['recordedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedHealthMetrics$getSharedHealthMetrics(
      metricId: (l$metricId as String),
      metricType: (l$metricType as String),
      value: (l$value as num).toDouble(),
      unit: (l$unit as String),
      recordedAt: dateTimeFromJson(l$recordedAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String metricId;

  final String metricType;

  final double value;

  final String unit;

  final DateTime recordedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$metricId = metricId;
    _resultData['metricId'] = l$metricId;
    final l$metricType = metricType;
    _resultData['metricType'] = l$metricType;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$unit = unit;
    _resultData['unit'] = l$unit;
    final l$recordedAt = recordedAt;
    _resultData['recordedAt'] = dateTimeToJson(l$recordedAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    final l$metricType = metricType;
    final l$value = value;
    final l$unit = unit;
    final l$recordedAt = recordedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$metricId,
      l$metricType,
      l$value,
      l$unit,
      l$recordedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSharedHealthMetrics$getSharedHealthMetrics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
      return false;
    }
    final l$metricType = metricType;
    final lOther$metricType = other.metricType;
    if (l$metricType != lOther$metricType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$recordedAt = recordedAt;
    final lOther$recordedAt = other.recordedAt;
    if (l$recordedAt != lOther$recordedAt) {
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

extension UtilityExtension$Query$GetSharedHealthMetrics$getSharedHealthMetrics
    on Query$GetSharedHealthMetrics$getSharedHealthMetrics {
  CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<
          Query$GetSharedHealthMetrics$getSharedHealthMetrics>
      get copyWith =>
          CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<
    TRes> {
  factory CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics(
    Query$GetSharedHealthMetrics$getSharedHealthMetrics instance,
    TRes Function(Query$GetSharedHealthMetrics$getSharedHealthMetrics) then,
  ) = _CopyWithImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics;

  factory CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics;

  TRes call({
    String? metricId,
    String? metricType,
    double? value,
    String? unit,
    DateTime? recordedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics<TRes>
    implements
        CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<TRes> {
  _CopyWithImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics(
    this._instance,
    this._then,
  );

  final Query$GetSharedHealthMetrics$getSharedHealthMetrics _instance;

  final TRes Function(Query$GetSharedHealthMetrics$getSharedHealthMetrics)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricId = _undefined,
    Object? metricType = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? recordedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedHealthMetrics$getSharedHealthMetrics(
        metricId: metricId == _undefined || metricId == null
            ? _instance.metricId
            : (metricId as String),
        metricType: metricType == _undefined || metricType == null
            ? _instance.metricType
            : (metricType as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as double),
        unit: unit == _undefined || unit == null
            ? _instance.unit
            : (unit as String),
        recordedAt: recordedAt == _undefined || recordedAt == null
            ? _instance.recordedAt
            : (recordedAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics<
        TRes>
    implements
        CopyWith$Query$GetSharedHealthMetrics$getSharedHealthMetrics<TRes> {
  _CopyWithStubImpl$Query$GetSharedHealthMetrics$getSharedHealthMetrics(
      this._res);

  TRes _res;

  call({
    String? metricId,
    String? metricType,
    double? value,
    String? unit,
    DateTime? recordedAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddHealthMetric {
  factory Variables$Mutation$AddHealthMetric({
    required String metricType,
    required double value,
    required String unit,
    required String recordedAt,
  }) =>
      Variables$Mutation$AddHealthMetric._({
        r'metricType': metricType,
        r'value': value,
        r'unit': unit,
        r'recordedAt': recordedAt,
      });

  Variables$Mutation$AddHealthMetric._(this._$data);

  factory Variables$Mutation$AddHealthMetric.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$metricType = data['metricType'];
    result$data['metricType'] = (l$metricType as String);
    final l$value = data['value'];
    result$data['value'] = (l$value as num).toDouble();
    final l$unit = data['unit'];
    result$data['unit'] = (l$unit as String);
    final l$recordedAt = data['recordedAt'];
    result$data['recordedAt'] = (l$recordedAt as String);
    return Variables$Mutation$AddHealthMetric._(result$data);
  }

  Map<String, dynamic> _$data;

  String get metricType => (_$data['metricType'] as String);

  double get value => (_$data['value'] as double);

  String get unit => (_$data['unit'] as String);

  String get recordedAt => (_$data['recordedAt'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$metricType = metricType;
    result$data['metricType'] = l$metricType;
    final l$value = value;
    result$data['value'] = l$value;
    final l$unit = unit;
    result$data['unit'] = l$unit;
    final l$recordedAt = recordedAt;
    result$data['recordedAt'] = l$recordedAt;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddHealthMetric<
          Variables$Mutation$AddHealthMetric>
      get copyWith => CopyWith$Variables$Mutation$AddHealthMetric(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricType = metricType;
    final lOther$metricType = other.metricType;
    if (l$metricType != lOther$metricType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$recordedAt = recordedAt;
    final lOther$recordedAt = other.recordedAt;
    if (l$recordedAt != lOther$recordedAt) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$metricType = metricType;
    final l$value = value;
    final l$unit = unit;
    final l$recordedAt = recordedAt;
    return Object.hashAll([
      l$metricType,
      l$value,
      l$unit,
      l$recordedAt,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddHealthMetric<TRes> {
  factory CopyWith$Variables$Mutation$AddHealthMetric(
    Variables$Mutation$AddHealthMetric instance,
    TRes Function(Variables$Mutation$AddHealthMetric) then,
  ) = _CopyWithImpl$Variables$Mutation$AddHealthMetric;

  factory CopyWith$Variables$Mutation$AddHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddHealthMetric;

  TRes call({
    String? metricType,
    double? value,
    String? unit,
    String? recordedAt,
  });
}

class _CopyWithImpl$Variables$Mutation$AddHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$AddHealthMetric<TRes> {
  _CopyWithImpl$Variables$Mutation$AddHealthMetric(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddHealthMetric _instance;

  final TRes Function(Variables$Mutation$AddHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricType = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? recordedAt = _undefined,
  }) =>
      _then(Variables$Mutation$AddHealthMetric._({
        ..._instance._$data,
        if (metricType != _undefined && metricType != null)
          'metricType': (metricType as String),
        if (value != _undefined && value != null) 'value': (value as double),
        if (unit != _undefined && unit != null) 'unit': (unit as String),
        if (recordedAt != _undefined && recordedAt != null)
          'recordedAt': (recordedAt as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$AddHealthMetric<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddHealthMetric(this._res);

  TRes _res;

  call({
    String? metricType,
    double? value,
    String? unit,
    String? recordedAt,
  }) =>
      _res;
}

class Mutation$AddHealthMetric {
  Mutation$AddHealthMetric({
    this.addHealthMetric,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddHealthMetric.fromJson(Map<String, dynamic> json) {
    final l$addHealthMetric = json['addHealthMetric'];
    final l$$__typename = json['__typename'];
    return Mutation$AddHealthMetric(
      addHealthMetric: l$addHealthMetric == null
          ? null
          : Mutation$AddHealthMetric$addHealthMetric.fromJson(
              (l$addHealthMetric as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddHealthMetric$addHealthMetric? addHealthMetric;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addHealthMetric = addHealthMetric;
    _resultData['addHealthMetric'] = l$addHealthMetric?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addHealthMetric = addHealthMetric;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addHealthMetric,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addHealthMetric = addHealthMetric;
    final lOther$addHealthMetric = other.addHealthMetric;
    if (l$addHealthMetric != lOther$addHealthMetric) {
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

extension UtilityExtension$Mutation$AddHealthMetric
    on Mutation$AddHealthMetric {
  CopyWith$Mutation$AddHealthMetric<Mutation$AddHealthMetric> get copyWith =>
      CopyWith$Mutation$AddHealthMetric(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddHealthMetric<TRes> {
  factory CopyWith$Mutation$AddHealthMetric(
    Mutation$AddHealthMetric instance,
    TRes Function(Mutation$AddHealthMetric) then,
  ) = _CopyWithImpl$Mutation$AddHealthMetric;

  factory CopyWith$Mutation$AddHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddHealthMetric;

  TRes call({
    Mutation$AddHealthMetric$addHealthMetric? addHealthMetric,
    String? $__typename,
  });
  CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> get addHealthMetric;
}

class _CopyWithImpl$Mutation$AddHealthMetric<TRes>
    implements CopyWith$Mutation$AddHealthMetric<TRes> {
  _CopyWithImpl$Mutation$AddHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$AddHealthMetric _instance;

  final TRes Function(Mutation$AddHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addHealthMetric = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddHealthMetric(
        addHealthMetric: addHealthMetric == _undefined
            ? _instance.addHealthMetric
            : (addHealthMetric as Mutation$AddHealthMetric$addHealthMetric?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> get addHealthMetric {
    final local$addHealthMetric = _instance.addHealthMetric;
    return local$addHealthMetric == null
        ? CopyWith$Mutation$AddHealthMetric$addHealthMetric.stub(
            _then(_instance))
        : CopyWith$Mutation$AddHealthMetric$addHealthMetric(
            local$addHealthMetric, (e) => call(addHealthMetric: e));
  }
}

class _CopyWithStubImpl$Mutation$AddHealthMetric<TRes>
    implements CopyWith$Mutation$AddHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$AddHealthMetric(this._res);

  TRes _res;

  call({
    Mutation$AddHealthMetric$addHealthMetric? addHealthMetric,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> get addHealthMetric =>
      CopyWith$Mutation$AddHealthMetric$addHealthMetric.stub(_res);
}

const documentNodeMutationAddHealthMetric = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddHealthMetric'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'metricType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'value')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'unit')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'recordedAt')),
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
        name: NameNode(value: 'addHealthMetric'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'metricType'),
            value: VariableNode(name: NameNode(value: 'metricType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'value'),
            value: VariableNode(name: NameNode(value: 'value')),
          ),
          ArgumentNode(
            name: NameNode(value: 'unit'),
            value: VariableNode(name: NameNode(value: 'unit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'recordedAt'),
            value: VariableNode(name: NameNode(value: 'recordedAt')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'metricId'),
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
Mutation$AddHealthMetric _parserFn$Mutation$AddHealthMetric(
        Map<String, dynamic> data) =>
    Mutation$AddHealthMetric.fromJson(data);
typedef OnMutationCompleted$Mutation$AddHealthMetric = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddHealthMetric?,
);

class Options$Mutation$AddHealthMetric
    extends graphql.MutationOptions<Mutation$AddHealthMetric> {
  Options$Mutation$AddHealthMetric({
    String? operationName,
    required Variables$Mutation$AddHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddHealthMetric>? update,
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
                        : _parserFn$Mutation$AddHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddHealthMetric,
          parserFn: _parserFn$Mutation$AddHealthMetric,
        );

  final OnMutationCompleted$Mutation$AddHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddHealthMetric
    extends graphql.WatchQueryOptions<Mutation$AddHealthMetric> {
  WatchOptions$Mutation$AddHealthMetric({
    String? operationName,
    required Variables$Mutation$AddHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddHealthMetric? typedOptimisticResult,
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
          document: documentNodeMutationAddHealthMetric,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddHealthMetric,
        );
}

extension ClientExtension$Mutation$AddHealthMetric on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddHealthMetric>> mutate$AddHealthMetric(
          Options$Mutation$AddHealthMetric options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddHealthMetric>
      watchMutation$AddHealthMetric(
              WatchOptions$Mutation$AddHealthMetric options) =>
          this.watchMutation(options);
}

class Mutation$AddHealthMetric$HookResult {
  Mutation$AddHealthMetric$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddHealthMetric runMutation;

  final graphql.QueryResult<Mutation$AddHealthMetric> result;
}

Mutation$AddHealthMetric$HookResult useMutation$AddHealthMetric(
    [WidgetOptions$Mutation$AddHealthMetric? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddHealthMetric());
  return Mutation$AddHealthMetric$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddHealthMetric>
    useWatchMutation$AddHealthMetric(
            WatchOptions$Mutation$AddHealthMetric options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddHealthMetric
    extends graphql.MutationOptions<Mutation$AddHealthMetric> {
  WidgetOptions$Mutation$AddHealthMetric({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddHealthMetric>? update,
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
                        : _parserFn$Mutation$AddHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddHealthMetric,
          parserFn: _parserFn$Mutation$AddHealthMetric,
        );

  final OnMutationCompleted$Mutation$AddHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddHealthMetric
    = graphql.MultiSourceResult<Mutation$AddHealthMetric> Function(
  Variables$Mutation$AddHealthMetric, {
  Object? optimisticResult,
  Mutation$AddHealthMetric? typedOptimisticResult,
});
typedef Builder$Mutation$AddHealthMetric = widgets.Widget Function(
  RunMutation$Mutation$AddHealthMetric,
  graphql.QueryResult<Mutation$AddHealthMetric>?,
);

class Mutation$AddHealthMetric$Widget
    extends graphql_flutter.Mutation<Mutation$AddHealthMetric> {
  Mutation$AddHealthMetric$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddHealthMetric? options,
    required Builder$Mutation$AddHealthMetric builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddHealthMetric(),
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

class Mutation$AddHealthMetric$addHealthMetric {
  Mutation$AddHealthMetric$addHealthMetric({
    required this.metricId,
    required this.message,
    this.$__typename = 'AddHealthMetricResponse',
  });

  factory Mutation$AddHealthMetric$addHealthMetric.fromJson(
      Map<String, dynamic> json) {
    final l$metricId = json['metricId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$AddHealthMetric$addHealthMetric(
      metricId: (l$metricId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String metricId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$metricId = metricId;
    _resultData['metricId'] = l$metricId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$metricId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddHealthMetric$addHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
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

extension UtilityExtension$Mutation$AddHealthMetric$addHealthMetric
    on Mutation$AddHealthMetric$addHealthMetric {
  CopyWith$Mutation$AddHealthMetric$addHealthMetric<
          Mutation$AddHealthMetric$addHealthMetric>
      get copyWith => CopyWith$Mutation$AddHealthMetric$addHealthMetric(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> {
  factory CopyWith$Mutation$AddHealthMetric$addHealthMetric(
    Mutation$AddHealthMetric$addHealthMetric instance,
    TRes Function(Mutation$AddHealthMetric$addHealthMetric) then,
  ) = _CopyWithImpl$Mutation$AddHealthMetric$addHealthMetric;

  factory CopyWith$Mutation$AddHealthMetric$addHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddHealthMetric$addHealthMetric;

  TRes call({
    String? metricId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddHealthMetric$addHealthMetric<TRes>
    implements CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> {
  _CopyWithImpl$Mutation$AddHealthMetric$addHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$AddHealthMetric$addHealthMetric _instance;

  final TRes Function(Mutation$AddHealthMetric$addHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddHealthMetric$addHealthMetric(
        metricId: metricId == _undefined || metricId == null
            ? _instance.metricId
            : (metricId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddHealthMetric$addHealthMetric<TRes>
    implements CopyWith$Mutation$AddHealthMetric$addHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$AddHealthMetric$addHealthMetric(this._res);

  TRes _res;

  call({
    String? metricId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateHealthMetric {
  factory Variables$Mutation$UpdateHealthMetric({
    required String metricId,
    double? value,
    String? unit,
  }) =>
      Variables$Mutation$UpdateHealthMetric._({
        r'metricId': metricId,
        if (value != null) r'value': value,
        if (unit != null) r'unit': unit,
      });

  Variables$Mutation$UpdateHealthMetric._(this._$data);

  factory Variables$Mutation$UpdateHealthMetric.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$metricId = data['metricId'];
    result$data['metricId'] = (l$metricId as String);
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as num?)?.toDouble();
    }
    if (data.containsKey('unit')) {
      final l$unit = data['unit'];
      result$data['unit'] = (l$unit as String?);
    }
    return Variables$Mutation$UpdateHealthMetric._(result$data);
  }

  Map<String, dynamic> _$data;

  String get metricId => (_$data['metricId'] as String);

  double? get value => (_$data['value'] as double?);

  String? get unit => (_$data['unit'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$metricId = metricId;
    result$data['metricId'] = l$metricId;
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    if (_$data.containsKey('unit')) {
      final l$unit = unit;
      result$data['unit'] = l$unit;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateHealthMetric<
          Variables$Mutation$UpdateHealthMetric>
      get copyWith => CopyWith$Variables$Mutation$UpdateHealthMetric(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (_$data.containsKey('unit') != other._$data.containsKey('unit')) {
      return false;
    }
    if (l$unit != lOther$unit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    final l$value = value;
    final l$unit = unit;
    return Object.hashAll([
      l$metricId,
      _$data.containsKey('value') ? l$value : const {},
      _$data.containsKey('unit') ? l$unit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateHealthMetric<TRes> {
  factory CopyWith$Variables$Mutation$UpdateHealthMetric(
    Variables$Mutation$UpdateHealthMetric instance,
    TRes Function(Variables$Mutation$UpdateHealthMetric) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateHealthMetric;

  factory CopyWith$Variables$Mutation$UpdateHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateHealthMetric;

  TRes call({
    String? metricId,
    double? value,
    String? unit,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$UpdateHealthMetric<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateHealthMetric(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateHealthMetric _instance;

  final TRes Function(Variables$Mutation$UpdateHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricId = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateHealthMetric._({
        ..._instance._$data,
        if (metricId != _undefined && metricId != null)
          'metricId': (metricId as String),
        if (value != _undefined) 'value': (value as double?),
        if (unit != _undefined) 'unit': (unit as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$UpdateHealthMetric<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateHealthMetric(this._res);

  TRes _res;

  call({
    String? metricId,
    double? value,
    String? unit,
  }) =>
      _res;
}

class Mutation$UpdateHealthMetric {
  Mutation$UpdateHealthMetric({
    this.updateHealthMetric,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateHealthMetric.fromJson(Map<String, dynamic> json) {
    final l$updateHealthMetric = json['updateHealthMetric'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateHealthMetric(
      updateHealthMetric: l$updateHealthMetric == null
          ? null
          : Mutation$UpdateHealthMetric$updateHealthMetric.fromJson(
              (l$updateHealthMetric as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateHealthMetric$updateHealthMetric? updateHealthMetric;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateHealthMetric = updateHealthMetric;
    _resultData['updateHealthMetric'] = l$updateHealthMetric?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateHealthMetric = updateHealthMetric;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateHealthMetric,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateHealthMetric = updateHealthMetric;
    final lOther$updateHealthMetric = other.updateHealthMetric;
    if (l$updateHealthMetric != lOther$updateHealthMetric) {
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

extension UtilityExtension$Mutation$UpdateHealthMetric
    on Mutation$UpdateHealthMetric {
  CopyWith$Mutation$UpdateHealthMetric<Mutation$UpdateHealthMetric>
      get copyWith => CopyWith$Mutation$UpdateHealthMetric(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateHealthMetric<TRes> {
  factory CopyWith$Mutation$UpdateHealthMetric(
    Mutation$UpdateHealthMetric instance,
    TRes Function(Mutation$UpdateHealthMetric) then,
  ) = _CopyWithImpl$Mutation$UpdateHealthMetric;

  factory CopyWith$Mutation$UpdateHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateHealthMetric;

  TRes call({
    Mutation$UpdateHealthMetric$updateHealthMetric? updateHealthMetric,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes>
      get updateHealthMetric;
}

class _CopyWithImpl$Mutation$UpdateHealthMetric<TRes>
    implements CopyWith$Mutation$UpdateHealthMetric<TRes> {
  _CopyWithImpl$Mutation$UpdateHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$UpdateHealthMetric _instance;

  final TRes Function(Mutation$UpdateHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateHealthMetric = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateHealthMetric(
        updateHealthMetric: updateHealthMetric == _undefined
            ? _instance.updateHealthMetric
            : (updateHealthMetric
                as Mutation$UpdateHealthMetric$updateHealthMetric?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes>
      get updateHealthMetric {
    final local$updateHealthMetric = _instance.updateHealthMetric;
    return local$updateHealthMetric == null
        ? CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric(
            local$updateHealthMetric, (e) => call(updateHealthMetric: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateHealthMetric<TRes>
    implements CopyWith$Mutation$UpdateHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$UpdateHealthMetric(this._res);

  TRes _res;

  call({
    Mutation$UpdateHealthMetric$updateHealthMetric? updateHealthMetric,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes>
      get updateHealthMetric =>
          CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric.stub(_res);
}

const documentNodeMutationUpdateHealthMetric = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateHealthMetric'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'metricId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'value')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'unit')),
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
        name: NameNode(value: 'updateHealthMetric'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'metricId'),
            value: VariableNode(name: NameNode(value: 'metricId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'value'),
            value: VariableNode(name: NameNode(value: 'value')),
          ),
          ArgumentNode(
            name: NameNode(value: 'unit'),
            value: VariableNode(name: NameNode(value: 'unit')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'metricId'),
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
Mutation$UpdateHealthMetric _parserFn$Mutation$UpdateHealthMetric(
        Map<String, dynamic> data) =>
    Mutation$UpdateHealthMetric.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateHealthMetric = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateHealthMetric?,
);

class Options$Mutation$UpdateHealthMetric
    extends graphql.MutationOptions<Mutation$UpdateHealthMetric> {
  Options$Mutation$UpdateHealthMetric({
    String? operationName,
    required Variables$Mutation$UpdateHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateHealthMetric>? update,
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
                        : _parserFn$Mutation$UpdateHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateHealthMetric,
          parserFn: _parserFn$Mutation$UpdateHealthMetric,
        );

  final OnMutationCompleted$Mutation$UpdateHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateHealthMetric
    extends graphql.WatchQueryOptions<Mutation$UpdateHealthMetric> {
  WatchOptions$Mutation$UpdateHealthMetric({
    String? operationName,
    required Variables$Mutation$UpdateHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthMetric? typedOptimisticResult,
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
          document: documentNodeMutationUpdateHealthMetric,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateHealthMetric,
        );
}

extension ClientExtension$Mutation$UpdateHealthMetric on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateHealthMetric>>
      mutate$UpdateHealthMetric(
              Options$Mutation$UpdateHealthMetric options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateHealthMetric>
      watchMutation$UpdateHealthMetric(
              WatchOptions$Mutation$UpdateHealthMetric options) =>
          this.watchMutation(options);
}

class Mutation$UpdateHealthMetric$HookResult {
  Mutation$UpdateHealthMetric$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateHealthMetric runMutation;

  final graphql.QueryResult<Mutation$UpdateHealthMetric> result;
}

Mutation$UpdateHealthMetric$HookResult useMutation$UpdateHealthMetric(
    [WidgetOptions$Mutation$UpdateHealthMetric? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateHealthMetric());
  return Mutation$UpdateHealthMetric$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateHealthMetric>
    useWatchMutation$UpdateHealthMetric(
            WatchOptions$Mutation$UpdateHealthMetric options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateHealthMetric
    extends graphql.MutationOptions<Mutation$UpdateHealthMetric> {
  WidgetOptions$Mutation$UpdateHealthMetric({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateHealthMetric>? update,
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
                        : _parserFn$Mutation$UpdateHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateHealthMetric,
          parserFn: _parserFn$Mutation$UpdateHealthMetric,
        );

  final OnMutationCompleted$Mutation$UpdateHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateHealthMetric
    = graphql.MultiSourceResult<Mutation$UpdateHealthMetric> Function(
  Variables$Mutation$UpdateHealthMetric, {
  Object? optimisticResult,
  Mutation$UpdateHealthMetric? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateHealthMetric = widgets.Widget Function(
  RunMutation$Mutation$UpdateHealthMetric,
  graphql.QueryResult<Mutation$UpdateHealthMetric>?,
);

class Mutation$UpdateHealthMetric$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateHealthMetric> {
  Mutation$UpdateHealthMetric$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateHealthMetric? options,
    required Builder$Mutation$UpdateHealthMetric builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateHealthMetric(),
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

class Mutation$UpdateHealthMetric$updateHealthMetric {
  Mutation$UpdateHealthMetric$updateHealthMetric({
    required this.metricId,
    required this.message,
    this.$__typename = 'UpdateHealthMetricResponse',
  });

  factory Mutation$UpdateHealthMetric$updateHealthMetric.fromJson(
      Map<String, dynamic> json) {
    final l$metricId = json['metricId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateHealthMetric$updateHealthMetric(
      metricId: (l$metricId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String metricId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$metricId = metricId;
    _resultData['metricId'] = l$metricId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$metricId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateHealthMetric$updateHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
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

extension UtilityExtension$Mutation$UpdateHealthMetric$updateHealthMetric
    on Mutation$UpdateHealthMetric$updateHealthMetric {
  CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<
          Mutation$UpdateHealthMetric$updateHealthMetric>
      get copyWith => CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes> {
  factory CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric(
    Mutation$UpdateHealthMetric$updateHealthMetric instance,
    TRes Function(Mutation$UpdateHealthMetric$updateHealthMetric) then,
  ) = _CopyWithImpl$Mutation$UpdateHealthMetric$updateHealthMetric;

  factory CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateHealthMetric$updateHealthMetric;

  TRes call({
    String? metricId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateHealthMetric$updateHealthMetric<TRes>
    implements CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes> {
  _CopyWithImpl$Mutation$UpdateHealthMetric$updateHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$UpdateHealthMetric$updateHealthMetric _instance;

  final TRes Function(Mutation$UpdateHealthMetric$updateHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? metricId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateHealthMetric$updateHealthMetric(
        metricId: metricId == _undefined || metricId == null
            ? _instance.metricId
            : (metricId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateHealthMetric$updateHealthMetric<TRes>
    implements CopyWith$Mutation$UpdateHealthMetric$updateHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$UpdateHealthMetric$updateHealthMetric(this._res);

  TRes _res;

  call({
    String? metricId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteHealthMetric {
  factory Variables$Mutation$DeleteHealthMetric({required String metricId}) =>
      Variables$Mutation$DeleteHealthMetric._({
        r'metricId': metricId,
      });

  Variables$Mutation$DeleteHealthMetric._(this._$data);

  factory Variables$Mutation$DeleteHealthMetric.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$metricId = data['metricId'];
    result$data['metricId'] = (l$metricId as String);
    return Variables$Mutation$DeleteHealthMetric._(result$data);
  }

  Map<String, dynamic> _$data;

  String get metricId => (_$data['metricId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$metricId = metricId;
    result$data['metricId'] = l$metricId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteHealthMetric<
          Variables$Mutation$DeleteHealthMetric>
      get copyWith => CopyWith$Variables$Mutation$DeleteHealthMetric(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$metricId = metricId;
    final lOther$metricId = other.metricId;
    if (l$metricId != lOther$metricId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$metricId = metricId;
    return Object.hashAll([l$metricId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteHealthMetric<TRes> {
  factory CopyWith$Variables$Mutation$DeleteHealthMetric(
    Variables$Mutation$DeleteHealthMetric instance,
    TRes Function(Variables$Mutation$DeleteHealthMetric) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteHealthMetric;

  factory CopyWith$Variables$Mutation$DeleteHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteHealthMetric;

  TRes call({String? metricId});
}

class _CopyWithImpl$Variables$Mutation$DeleteHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$DeleteHealthMetric<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteHealthMetric(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteHealthMetric _instance;

  final TRes Function(Variables$Mutation$DeleteHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? metricId = _undefined}) =>
      _then(Variables$Mutation$DeleteHealthMetric._({
        ..._instance._$data,
        if (metricId != _undefined && metricId != null)
          'metricId': (metricId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteHealthMetric<TRes>
    implements CopyWith$Variables$Mutation$DeleteHealthMetric<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteHealthMetric(this._res);

  TRes _res;

  call({String? metricId}) => _res;
}

class Mutation$DeleteHealthMetric {
  Mutation$DeleteHealthMetric({
    this.deleteHealthMetric,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteHealthMetric.fromJson(Map<String, dynamic> json) {
    final l$deleteHealthMetric = json['deleteHealthMetric'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteHealthMetric(
      deleteHealthMetric: l$deleteHealthMetric == null
          ? null
          : Mutation$DeleteHealthMetric$deleteHealthMetric.fromJson(
              (l$deleteHealthMetric as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteHealthMetric$deleteHealthMetric? deleteHealthMetric;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteHealthMetric = deleteHealthMetric;
    _resultData['deleteHealthMetric'] = l$deleteHealthMetric?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteHealthMetric = deleteHealthMetric;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteHealthMetric,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteHealthMetric) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteHealthMetric = deleteHealthMetric;
    final lOther$deleteHealthMetric = other.deleteHealthMetric;
    if (l$deleteHealthMetric != lOther$deleteHealthMetric) {
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

extension UtilityExtension$Mutation$DeleteHealthMetric
    on Mutation$DeleteHealthMetric {
  CopyWith$Mutation$DeleteHealthMetric<Mutation$DeleteHealthMetric>
      get copyWith => CopyWith$Mutation$DeleteHealthMetric(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteHealthMetric<TRes> {
  factory CopyWith$Mutation$DeleteHealthMetric(
    Mutation$DeleteHealthMetric instance,
    TRes Function(Mutation$DeleteHealthMetric) then,
  ) = _CopyWithImpl$Mutation$DeleteHealthMetric;

  factory CopyWith$Mutation$DeleteHealthMetric.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteHealthMetric;

  TRes call({
    Mutation$DeleteHealthMetric$deleteHealthMetric? deleteHealthMetric,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes>
      get deleteHealthMetric;
}

class _CopyWithImpl$Mutation$DeleteHealthMetric<TRes>
    implements CopyWith$Mutation$DeleteHealthMetric<TRes> {
  _CopyWithImpl$Mutation$DeleteHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$DeleteHealthMetric _instance;

  final TRes Function(Mutation$DeleteHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteHealthMetric = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteHealthMetric(
        deleteHealthMetric: deleteHealthMetric == _undefined
            ? _instance.deleteHealthMetric
            : (deleteHealthMetric
                as Mutation$DeleteHealthMetric$deleteHealthMetric?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes>
      get deleteHealthMetric {
    final local$deleteHealthMetric = _instance.deleteHealthMetric;
    return local$deleteHealthMetric == null
        ? CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric(
            local$deleteHealthMetric, (e) => call(deleteHealthMetric: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteHealthMetric<TRes>
    implements CopyWith$Mutation$DeleteHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$DeleteHealthMetric(this._res);

  TRes _res;

  call({
    Mutation$DeleteHealthMetric$deleteHealthMetric? deleteHealthMetric,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes>
      get deleteHealthMetric =>
          CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric.stub(_res);
}

const documentNodeMutationDeleteHealthMetric = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteHealthMetric'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'metricId')),
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
        name: NameNode(value: 'deleteHealthMetric'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'metricId'),
            value: VariableNode(name: NameNode(value: 'metricId')),
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
Mutation$DeleteHealthMetric _parserFn$Mutation$DeleteHealthMetric(
        Map<String, dynamic> data) =>
    Mutation$DeleteHealthMetric.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteHealthMetric = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteHealthMetric?,
);

class Options$Mutation$DeleteHealthMetric
    extends graphql.MutationOptions<Mutation$DeleteHealthMetric> {
  Options$Mutation$DeleteHealthMetric({
    String? operationName,
    required Variables$Mutation$DeleteHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteHealthMetric>? update,
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
                        : _parserFn$Mutation$DeleteHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteHealthMetric,
          parserFn: _parserFn$Mutation$DeleteHealthMetric,
        );

  final OnMutationCompleted$Mutation$DeleteHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteHealthMetric
    extends graphql.WatchQueryOptions<Mutation$DeleteHealthMetric> {
  WatchOptions$Mutation$DeleteHealthMetric({
    String? operationName,
    required Variables$Mutation$DeleteHealthMetric variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteHealthMetric? typedOptimisticResult,
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
          document: documentNodeMutationDeleteHealthMetric,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteHealthMetric,
        );
}

extension ClientExtension$Mutation$DeleteHealthMetric on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteHealthMetric>>
      mutate$DeleteHealthMetric(
              Options$Mutation$DeleteHealthMetric options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteHealthMetric>
      watchMutation$DeleteHealthMetric(
              WatchOptions$Mutation$DeleteHealthMetric options) =>
          this.watchMutation(options);
}

class Mutation$DeleteHealthMetric$HookResult {
  Mutation$DeleteHealthMetric$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteHealthMetric runMutation;

  final graphql.QueryResult<Mutation$DeleteHealthMetric> result;
}

Mutation$DeleteHealthMetric$HookResult useMutation$DeleteHealthMetric(
    [WidgetOptions$Mutation$DeleteHealthMetric? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteHealthMetric());
  return Mutation$DeleteHealthMetric$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteHealthMetric>
    useWatchMutation$DeleteHealthMetric(
            WatchOptions$Mutation$DeleteHealthMetric options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteHealthMetric
    extends graphql.MutationOptions<Mutation$DeleteHealthMetric> {
  WidgetOptions$Mutation$DeleteHealthMetric({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteHealthMetric? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteHealthMetric? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteHealthMetric>? update,
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
                        : _parserFn$Mutation$DeleteHealthMetric(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteHealthMetric,
          parserFn: _parserFn$Mutation$DeleteHealthMetric,
        );

  final OnMutationCompleted$Mutation$DeleteHealthMetric? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteHealthMetric
    = graphql.MultiSourceResult<Mutation$DeleteHealthMetric> Function(
  Variables$Mutation$DeleteHealthMetric, {
  Object? optimisticResult,
  Mutation$DeleteHealthMetric? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteHealthMetric = widgets.Widget Function(
  RunMutation$Mutation$DeleteHealthMetric,
  graphql.QueryResult<Mutation$DeleteHealthMetric>?,
);

class Mutation$DeleteHealthMetric$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteHealthMetric> {
  Mutation$DeleteHealthMetric$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteHealthMetric? options,
    required Builder$Mutation$DeleteHealthMetric builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteHealthMetric(),
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

class Mutation$DeleteHealthMetric$deleteHealthMetric {
  Mutation$DeleteHealthMetric$deleteHealthMetric({
    required this.message,
    this.$__typename = 'DeleteHealthMetricResponse',
  });

  factory Mutation$DeleteHealthMetric$deleteHealthMetric.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteHealthMetric$deleteHealthMetric(
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
    if (!(other is Mutation$DeleteHealthMetric$deleteHealthMetric) ||
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

extension UtilityExtension$Mutation$DeleteHealthMetric$deleteHealthMetric
    on Mutation$DeleteHealthMetric$deleteHealthMetric {
  CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<
          Mutation$DeleteHealthMetric$deleteHealthMetric>
      get copyWith => CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes> {
  factory CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric(
    Mutation$DeleteHealthMetric$deleteHealthMetric instance,
    TRes Function(Mutation$DeleteHealthMetric$deleteHealthMetric) then,
  ) = _CopyWithImpl$Mutation$DeleteHealthMetric$deleteHealthMetric;

  factory CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeleteHealthMetric$deleteHealthMetric;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes>
    implements CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes> {
  _CopyWithImpl$Mutation$DeleteHealthMetric$deleteHealthMetric(
    this._instance,
    this._then,
  );

  final Mutation$DeleteHealthMetric$deleteHealthMetric _instance;

  final TRes Function(Mutation$DeleteHealthMetric$deleteHealthMetric) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteHealthMetric$deleteHealthMetric(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes>
    implements CopyWith$Mutation$DeleteHealthMetric$deleteHealthMetric<TRes> {
  _CopyWithStubImpl$Mutation$DeleteHealthMetric$deleteHealthMetric(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetTreatmentSchedules {
  Query$GetTreatmentSchedules({
    this.getTreatmentSchedules,
    this.$__typename = 'Query',
  });

  factory Query$GetTreatmentSchedules.fromJson(Map<String, dynamic> json) {
    final l$getTreatmentSchedules = json['getTreatmentSchedules'];
    final l$$__typename = json['__typename'];
    return Query$GetTreatmentSchedules(
      getTreatmentSchedules: (l$getTreatmentSchedules as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetTreatmentSchedules$getTreatmentSchedules.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetTreatmentSchedules$getTreatmentSchedules?>?
      getTreatmentSchedules;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getTreatmentSchedules = getTreatmentSchedules;
    _resultData['getTreatmentSchedules'] =
        l$getTreatmentSchedules?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getTreatmentSchedules = getTreatmentSchedules;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getTreatmentSchedules == null
          ? null
          : Object.hashAll(l$getTreatmentSchedules.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTreatmentSchedules) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getTreatmentSchedules = getTreatmentSchedules;
    final lOther$getTreatmentSchedules = other.getTreatmentSchedules;
    if (l$getTreatmentSchedules != null &&
        lOther$getTreatmentSchedules != null) {
      if (l$getTreatmentSchedules.length !=
          lOther$getTreatmentSchedules.length) {
        return false;
      }
      for (int i = 0; i < l$getTreatmentSchedules.length; i++) {
        final l$getTreatmentSchedules$entry = l$getTreatmentSchedules[i];
        final lOther$getTreatmentSchedules$entry =
            lOther$getTreatmentSchedules[i];
        if (l$getTreatmentSchedules$entry !=
            lOther$getTreatmentSchedules$entry) {
          return false;
        }
      }
    } else if (l$getTreatmentSchedules != lOther$getTreatmentSchedules) {
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

extension UtilityExtension$Query$GetTreatmentSchedules
    on Query$GetTreatmentSchedules {
  CopyWith$Query$GetTreatmentSchedules<Query$GetTreatmentSchedules>
      get copyWith => CopyWith$Query$GetTreatmentSchedules(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTreatmentSchedules<TRes> {
  factory CopyWith$Query$GetTreatmentSchedules(
    Query$GetTreatmentSchedules instance,
    TRes Function(Query$GetTreatmentSchedules) then,
  ) = _CopyWithImpl$Query$GetTreatmentSchedules;

  factory CopyWith$Query$GetTreatmentSchedules.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTreatmentSchedules;

  TRes call({
    List<Query$GetTreatmentSchedules$getTreatmentSchedules?>?
        getTreatmentSchedules,
    String? $__typename,
  });
  TRes getTreatmentSchedules(
      Iterable<Query$GetTreatmentSchedules$getTreatmentSchedules?>? Function(
              Iterable<
                  CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<
                      Query$GetTreatmentSchedules$getTreatmentSchedules>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetTreatmentSchedules<TRes>
    implements CopyWith$Query$GetTreatmentSchedules<TRes> {
  _CopyWithImpl$Query$GetTreatmentSchedules(
    this._instance,
    this._then,
  );

  final Query$GetTreatmentSchedules _instance;

  final TRes Function(Query$GetTreatmentSchedules) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getTreatmentSchedules = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTreatmentSchedules(
        getTreatmentSchedules: getTreatmentSchedules == _undefined
            ? _instance.getTreatmentSchedules
            : (getTreatmentSchedules
                as List<Query$GetTreatmentSchedules$getTreatmentSchedules?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getTreatmentSchedules(
          Iterable<Query$GetTreatmentSchedules$getTreatmentSchedules?>? Function(
                  Iterable<
                      CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<
                          Query$GetTreatmentSchedules$getTreatmentSchedules>?>?)
              _fn) =>
      call(
          getTreatmentSchedules:
              _fn(_instance.getTreatmentSchedules?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetTreatmentSchedules<TRes>
    implements CopyWith$Query$GetTreatmentSchedules<TRes> {
  _CopyWithStubImpl$Query$GetTreatmentSchedules(this._res);

  TRes _res;

  call({
    List<Query$GetTreatmentSchedules$getTreatmentSchedules?>?
        getTreatmentSchedules,
    String? $__typename,
  }) =>
      _res;

  getTreatmentSchedules(_fn) => _res;
}

const documentNodeQueryGetTreatmentSchedules = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetTreatmentSchedules'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getTreatmentSchedules'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'scheduleId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'treatmentType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'scheduledTime'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
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
Query$GetTreatmentSchedules _parserFn$Query$GetTreatmentSchedules(
        Map<String, dynamic> data) =>
    Query$GetTreatmentSchedules.fromJson(data);
typedef OnQueryComplete$Query$GetTreatmentSchedules = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetTreatmentSchedules?,
);

class Options$Query$GetTreatmentSchedules
    extends graphql.QueryOptions<Query$GetTreatmentSchedules> {
  Options$Query$GetTreatmentSchedules({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTreatmentSchedules? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetTreatmentSchedules? onComplete,
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
                        : _parserFn$Query$GetTreatmentSchedules(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetTreatmentSchedules,
          parserFn: _parserFn$Query$GetTreatmentSchedules,
        );

  final OnQueryComplete$Query$GetTreatmentSchedules? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetTreatmentSchedules
    extends graphql.WatchQueryOptions<Query$GetTreatmentSchedules> {
  WatchOptions$Query$GetTreatmentSchedules({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTreatmentSchedules? typedOptimisticResult,
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
          document: documentNodeQueryGetTreatmentSchedules,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetTreatmentSchedules,
        );
}

class FetchMoreOptions$Query$GetTreatmentSchedules
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTreatmentSchedules(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetTreatmentSchedules,
        );
}

extension ClientExtension$Query$GetTreatmentSchedules on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTreatmentSchedules>>
      query$GetTreatmentSchedules(
              [Options$Query$GetTreatmentSchedules? options]) async =>
          await this.query(options ?? Options$Query$GetTreatmentSchedules());
  graphql.ObservableQuery<
      Query$GetTreatmentSchedules> watchQuery$GetTreatmentSchedules(
          [WatchOptions$Query$GetTreatmentSchedules? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetTreatmentSchedules());
  void writeQuery$GetTreatmentSchedules({
    required Query$GetTreatmentSchedules data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetTreatmentSchedules)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetTreatmentSchedules? readQuery$GetTreatmentSchedules(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetTreatmentSchedules)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetTreatmentSchedules.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetTreatmentSchedules>
    useQuery$GetTreatmentSchedules(
            [Options$Query$GetTreatmentSchedules? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetTreatmentSchedules());
graphql.ObservableQuery<Query$GetTreatmentSchedules>
    useWatchQuery$GetTreatmentSchedules(
            [WatchOptions$Query$GetTreatmentSchedules? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$GetTreatmentSchedules());

class Query$GetTreatmentSchedules$Widget
    extends graphql_flutter.Query<Query$GetTreatmentSchedules> {
  Query$GetTreatmentSchedules$Widget({
    widgets.Key? key,
    Options$Query$GetTreatmentSchedules? options,
    required graphql_flutter.QueryBuilder<Query$GetTreatmentSchedules> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetTreatmentSchedules(),
          builder: builder,
        );
}

class Query$GetTreatmentSchedules$getTreatmentSchedules {
  Query$GetTreatmentSchedules$getTreatmentSchedules({
    required this.scheduleId,
    required this.treatmentType,
    required this.scheduledTime,
    required this.location,
    this.notes,
    this.$__typename = 'TreatmentScheduleDetail',
  });

  factory Query$GetTreatmentSchedules$getTreatmentSchedules.fromJson(
      Map<String, dynamic> json) {
    final l$scheduleId = json['scheduleId'];
    final l$treatmentType = json['treatmentType'];
    final l$scheduledTime = json['scheduledTime'];
    final l$location = json['location'];
    final l$notes = json['notes'];
    final l$$__typename = json['__typename'];
    return Query$GetTreatmentSchedules$getTreatmentSchedules(
      scheduleId: (l$scheduleId as String),
      treatmentType: (l$treatmentType as String),
      scheduledTime: dateTimeFromJson(l$scheduledTime),
      location: (l$location as String),
      notes: (l$notes as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String scheduleId;

  final String treatmentType;

  final DateTime scheduledTime;

  final String location;

  final String? notes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    _resultData['scheduleId'] = l$scheduleId;
    final l$treatmentType = treatmentType;
    _resultData['treatmentType'] = l$treatmentType;
    final l$scheduledTime = scheduledTime;
    _resultData['scheduledTime'] = dateTimeToJson(l$scheduledTime);
    final l$location = location;
    _resultData['location'] = l$location;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    final l$treatmentType = treatmentType;
    final l$scheduledTime = scheduledTime;
    final l$location = location;
    final l$notes = notes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$scheduleId,
      l$treatmentType,
      l$scheduledTime,
      l$location,
      l$notes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetTreatmentSchedules$getTreatmentSchedules) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    final l$treatmentType = treatmentType;
    final lOther$treatmentType = other.treatmentType;
    if (l$treatmentType != lOther$treatmentType) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
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

extension UtilityExtension$Query$GetTreatmentSchedules$getTreatmentSchedules
    on Query$GetTreatmentSchedules$getTreatmentSchedules {
  CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<
          Query$GetTreatmentSchedules$getTreatmentSchedules>
      get copyWith =>
          CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<
    TRes> {
  factory CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules(
    Query$GetTreatmentSchedules$getTreatmentSchedules instance,
    TRes Function(Query$GetTreatmentSchedules$getTreatmentSchedules) then,
  ) = _CopyWithImpl$Query$GetTreatmentSchedules$getTreatmentSchedules;

  factory CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetTreatmentSchedules$getTreatmentSchedules;

  TRes call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetTreatmentSchedules$getTreatmentSchedules<TRes>
    implements
        CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<TRes> {
  _CopyWithImpl$Query$GetTreatmentSchedules$getTreatmentSchedules(
    this._instance,
    this._then,
  );

  final Query$GetTreatmentSchedules$getTreatmentSchedules _instance;

  final TRes Function(Query$GetTreatmentSchedules$getTreatmentSchedules) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? scheduleId = _undefined,
    Object? treatmentType = _undefined,
    Object? scheduledTime = _undefined,
    Object? location = _undefined,
    Object? notes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetTreatmentSchedules$getTreatmentSchedules(
        scheduleId: scheduleId == _undefined || scheduleId == null
            ? _instance.scheduleId
            : (scheduleId as String),
        treatmentType: treatmentType == _undefined || treatmentType == null
            ? _instance.treatmentType
            : (treatmentType as String),
        scheduledTime: scheduledTime == _undefined || scheduledTime == null
            ? _instance.scheduledTime
            : (scheduledTime as DateTime),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetTreatmentSchedules$getTreatmentSchedules<TRes>
    implements
        CopyWith$Query$GetTreatmentSchedules$getTreatmentSchedules<TRes> {
  _CopyWithStubImpl$Query$GetTreatmentSchedules$getTreatmentSchedules(
      this._res);

  TRes _res;

  call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetSharedTreatmentSchedule {
  factory Variables$Query$GetSharedTreatmentSchedule(
          {required String patientId}) =>
      Variables$Query$GetSharedTreatmentSchedule._({
        r'patientId': patientId,
      });

  Variables$Query$GetSharedTreatmentSchedule._(this._$data);

  factory Variables$Query$GetSharedTreatmentSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$patientId = data['patientId'];
    result$data['patientId'] = (l$patientId as String);
    return Variables$Query$GetSharedTreatmentSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  String get patientId => (_$data['patientId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$patientId = patientId;
    result$data['patientId'] = l$patientId;
    return result$data;
  }

  CopyWith$Variables$Query$GetSharedTreatmentSchedule<
          Variables$Query$GetSharedTreatmentSchedule>
      get copyWith => CopyWith$Variables$Query$GetSharedTreatmentSchedule(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSharedTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$patientId = patientId;
    final lOther$patientId = other.patientId;
    if (l$patientId != lOther$patientId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$patientId = patientId;
    return Object.hashAll([l$patientId]);
  }
}

abstract class CopyWith$Variables$Query$GetSharedTreatmentSchedule<TRes> {
  factory CopyWith$Variables$Query$GetSharedTreatmentSchedule(
    Variables$Query$GetSharedTreatmentSchedule instance,
    TRes Function(Variables$Query$GetSharedTreatmentSchedule) then,
  ) = _CopyWithImpl$Variables$Query$GetSharedTreatmentSchedule;

  factory CopyWith$Variables$Query$GetSharedTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSharedTreatmentSchedule;

  TRes call({String? patientId});
}

class _CopyWithImpl$Variables$Query$GetSharedTreatmentSchedule<TRes>
    implements CopyWith$Variables$Query$GetSharedTreatmentSchedule<TRes> {
  _CopyWithImpl$Variables$Query$GetSharedTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSharedTreatmentSchedule _instance;

  final TRes Function(Variables$Query$GetSharedTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? patientId = _undefined}) =>
      _then(Variables$Query$GetSharedTreatmentSchedule._({
        ..._instance._$data,
        if (patientId != _undefined && patientId != null)
          'patientId': (patientId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSharedTreatmentSchedule<TRes>
    implements CopyWith$Variables$Query$GetSharedTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSharedTreatmentSchedule(this._res);

  TRes _res;

  call({String? patientId}) => _res;
}

class Query$GetSharedTreatmentSchedule {
  Query$GetSharedTreatmentSchedule({
    this.getSharedTreatmentSchedule,
    this.$__typename = 'Query',
  });

  factory Query$GetSharedTreatmentSchedule.fromJson(Map<String, dynamic> json) {
    final l$getSharedTreatmentSchedule = json['getSharedTreatmentSchedule'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedTreatmentSchedule(
      getSharedTreatmentSchedule:
          (l$getSharedTreatmentSchedule as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule
                      .fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>?
      getSharedTreatmentSchedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSharedTreatmentSchedule = getSharedTreatmentSchedule;
    _resultData['getSharedTreatmentSchedule'] =
        l$getSharedTreatmentSchedule?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSharedTreatmentSchedule = getSharedTreatmentSchedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSharedTreatmentSchedule == null
          ? null
          : Object.hashAll(l$getSharedTreatmentSchedule.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSharedTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSharedTreatmentSchedule = getSharedTreatmentSchedule;
    final lOther$getSharedTreatmentSchedule = other.getSharedTreatmentSchedule;
    if (l$getSharedTreatmentSchedule != null &&
        lOther$getSharedTreatmentSchedule != null) {
      if (l$getSharedTreatmentSchedule.length !=
          lOther$getSharedTreatmentSchedule.length) {
        return false;
      }
      for (int i = 0; i < l$getSharedTreatmentSchedule.length; i++) {
        final l$getSharedTreatmentSchedule$entry =
            l$getSharedTreatmentSchedule[i];
        final lOther$getSharedTreatmentSchedule$entry =
            lOther$getSharedTreatmentSchedule[i];
        if (l$getSharedTreatmentSchedule$entry !=
            lOther$getSharedTreatmentSchedule$entry) {
          return false;
        }
      }
    } else if (l$getSharedTreatmentSchedule !=
        lOther$getSharedTreatmentSchedule) {
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

extension UtilityExtension$Query$GetSharedTreatmentSchedule
    on Query$GetSharedTreatmentSchedule {
  CopyWith$Query$GetSharedTreatmentSchedule<Query$GetSharedTreatmentSchedule>
      get copyWith => CopyWith$Query$GetSharedTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedTreatmentSchedule<TRes> {
  factory CopyWith$Query$GetSharedTreatmentSchedule(
    Query$GetSharedTreatmentSchedule instance,
    TRes Function(Query$GetSharedTreatmentSchedule) then,
  ) = _CopyWithImpl$Query$GetSharedTreatmentSchedule;

  factory CopyWith$Query$GetSharedTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSharedTreatmentSchedule;

  TRes call({
    List<Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>?
        getSharedTreatmentSchedule,
    String? $__typename,
  });
  TRes getSharedTreatmentSchedule(
      Iterable<Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>? Function(
              Iterable<
                  CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
                      Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetSharedTreatmentSchedule<TRes>
    implements CopyWith$Query$GetSharedTreatmentSchedule<TRes> {
  _CopyWithImpl$Query$GetSharedTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Query$GetSharedTreatmentSchedule _instance;

  final TRes Function(Query$GetSharedTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSharedTreatmentSchedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedTreatmentSchedule(
        getSharedTreatmentSchedule: getSharedTreatmentSchedule == _undefined
            ? _instance.getSharedTreatmentSchedule
            : (getSharedTreatmentSchedule as List<
                Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getSharedTreatmentSchedule(
          Iterable<Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>? Function(
                  Iterable<
                      CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
                          Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule>?>?)
              _fn) =>
      call(
          getSharedTreatmentSchedule:
              _fn(_instance.getSharedTreatmentSchedule?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetSharedTreatmentSchedule<TRes>
    implements CopyWith$Query$GetSharedTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Query$GetSharedTreatmentSchedule(this._res);

  TRes _res;

  call({
    List<Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule?>?
        getSharedTreatmentSchedule,
    String? $__typename,
  }) =>
      _res;

  getSharedTreatmentSchedule(_fn) => _res;
}

const documentNodeQueryGetSharedTreatmentSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSharedTreatmentSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'patientId')),
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
        name: NameNode(value: 'getSharedTreatmentSchedule'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'patientId'),
            value: VariableNode(name: NameNode(value: 'patientId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'scheduleId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'treatmentType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'scheduledTime'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'location'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'notes'),
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
Query$GetSharedTreatmentSchedule _parserFn$Query$GetSharedTreatmentSchedule(
        Map<String, dynamic> data) =>
    Query$GetSharedTreatmentSchedule.fromJson(data);
typedef OnQueryComplete$Query$GetSharedTreatmentSchedule = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$GetSharedTreatmentSchedule?,
);

class Options$Query$GetSharedTreatmentSchedule
    extends graphql.QueryOptions<Query$GetSharedTreatmentSchedule> {
  Options$Query$GetSharedTreatmentSchedule({
    String? operationName,
    required Variables$Query$GetSharedTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedTreatmentSchedule? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSharedTreatmentSchedule? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetSharedTreatmentSchedule(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSharedTreatmentSchedule,
          parserFn: _parserFn$Query$GetSharedTreatmentSchedule,
        );

  final OnQueryComplete$Query$GetSharedTreatmentSchedule? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSharedTreatmentSchedule
    extends graphql.WatchQueryOptions<Query$GetSharedTreatmentSchedule> {
  WatchOptions$Query$GetSharedTreatmentSchedule({
    String? operationName,
    required Variables$Query$GetSharedTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedTreatmentSchedule? typedOptimisticResult,
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
          document: documentNodeQueryGetSharedTreatmentSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSharedTreatmentSchedule,
        );
}

class FetchMoreOptions$Query$GetSharedTreatmentSchedule
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSharedTreatmentSchedule({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSharedTreatmentSchedule variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSharedTreatmentSchedule,
        );
}

extension ClientExtension$Query$GetSharedTreatmentSchedule
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSharedTreatmentSchedule>>
      query$GetSharedTreatmentSchedule(
              Options$Query$GetSharedTreatmentSchedule options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetSharedTreatmentSchedule>
      watchQuery$GetSharedTreatmentSchedule(
              WatchOptions$Query$GetSharedTreatmentSchedule options) =>
          this.watchQuery(options);
  void writeQuery$GetSharedTreatmentSchedule({
    required Query$GetSharedTreatmentSchedule data,
    required Variables$Query$GetSharedTreatmentSchedule variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSharedTreatmentSchedule),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSharedTreatmentSchedule? readQuery$GetSharedTreatmentSchedule({
    required Variables$Query$GetSharedTreatmentSchedule variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetSharedTreatmentSchedule),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetSharedTreatmentSchedule.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSharedTreatmentSchedule>
    useQuery$GetSharedTreatmentSchedule(
            Options$Query$GetSharedTreatmentSchedule options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSharedTreatmentSchedule>
    useWatchQuery$GetSharedTreatmentSchedule(
            WatchOptions$Query$GetSharedTreatmentSchedule options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSharedTreatmentSchedule$Widget
    extends graphql_flutter.Query<Query$GetSharedTreatmentSchedule> {
  Query$GetSharedTreatmentSchedule$Widget({
    widgets.Key? key,
    required Options$Query$GetSharedTreatmentSchedule options,
    required graphql_flutter.QueryBuilder<Query$GetSharedTreatmentSchedule>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule {
  Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule({
    required this.scheduleId,
    required this.treatmentType,
    required this.scheduledTime,
    required this.location,
    this.notes,
    this.$__typename = 'TreatmentScheduleDetail',
  });

  factory Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule.fromJson(
      Map<String, dynamic> json) {
    final l$scheduleId = json['scheduleId'];
    final l$treatmentType = json['treatmentType'];
    final l$scheduledTime = json['scheduledTime'];
    final l$location = json['location'];
    final l$notes = json['notes'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
      scheduleId: (l$scheduleId as String),
      treatmentType: (l$treatmentType as String),
      scheduledTime: dateTimeFromJson(l$scheduledTime),
      location: (l$location as String),
      notes: (l$notes as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String scheduleId;

  final String treatmentType;

  final DateTime scheduledTime;

  final String location;

  final String? notes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    _resultData['scheduleId'] = l$scheduleId;
    final l$treatmentType = treatmentType;
    _resultData['treatmentType'] = l$treatmentType;
    final l$scheduledTime = scheduledTime;
    _resultData['scheduledTime'] = dateTimeToJson(l$scheduledTime);
    final l$location = location;
    _resultData['location'] = l$location;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    final l$treatmentType = treatmentType;
    final l$scheduledTime = scheduledTime;
    final l$location = location;
    final l$notes = notes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$scheduleId,
      l$treatmentType,
      l$scheduledTime,
      l$location,
      l$notes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    final l$treatmentType = treatmentType;
    final lOther$treatmentType = other.treatmentType;
    if (l$treatmentType != lOther$treatmentType) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
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

extension UtilityExtension$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule
    on Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule {
  CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
          Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule>
      get copyWith =>
          CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
    TRes> {
  factory CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
    Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule instance,
    TRes Function(Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule)
        then,
  ) = _CopyWithImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule;

  factory CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule;

  TRes call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
        TRes>
    implements
        CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
            TRes> {
  _CopyWithImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule _instance;

  final TRes Function(
      Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? scheduleId = _undefined,
    Object? treatmentType = _undefined,
    Object? scheduledTime = _undefined,
    Object? location = _undefined,
    Object? notes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
        scheduleId: scheduleId == _undefined || scheduleId == null
            ? _instance.scheduleId
            : (scheduleId as String),
        treatmentType: treatmentType == _undefined || treatmentType == null
            ? _instance.treatmentType
            : (treatmentType as String),
        scheduledTime: scheduledTime == _undefined || scheduledTime == null
            ? _instance.scheduledTime
            : (scheduledTime as DateTime),
        location: location == _undefined || location == null
            ? _instance.location
            : (location as String),
        notes: notes == _undefined ? _instance.notes : (notes as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
        TRes>
    implements
        CopyWith$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule<
            TRes> {
  _CopyWithStubImpl$Query$GetSharedTreatmentSchedule$getSharedTreatmentSchedule(
      this._res);

  TRes _res;

  call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateTreatmentSchedule {
  factory Variables$Mutation$CreateTreatmentSchedule({
    required String treatmentType,
    required DateTime scheduledTime,
    required String location,
    String? notes,
  }) =>
      Variables$Mutation$CreateTreatmentSchedule._({
        r'treatmentType': treatmentType,
        r'scheduledTime': scheduledTime,
        r'location': location,
        if (notes != null) r'notes': notes,
      });

  Variables$Mutation$CreateTreatmentSchedule._(this._$data);

  factory Variables$Mutation$CreateTreatmentSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$treatmentType = data['treatmentType'];
    result$data['treatmentType'] = (l$treatmentType as String);
    final l$scheduledTime = data['scheduledTime'];
    result$data['scheduledTime'] = dateTimeFromJson(l$scheduledTime);
    final l$location = data['location'];
    result$data['location'] = (l$location as String);
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Variables$Mutation$CreateTreatmentSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  String get treatmentType => (_$data['treatmentType'] as String);

  DateTime get scheduledTime => (_$data['scheduledTime'] as DateTime);

  String get location => (_$data['location'] as String);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$treatmentType = treatmentType;
    result$data['treatmentType'] = l$treatmentType;
    final l$scheduledTime = scheduledTime;
    result$data['scheduledTime'] = dateTimeToJson(l$scheduledTime);
    final l$location = location;
    result$data['location'] = l$location;
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateTreatmentSchedule<
          Variables$Mutation$CreateTreatmentSchedule>
      get copyWith => CopyWith$Variables$Mutation$CreateTreatmentSchedule(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$treatmentType = treatmentType;
    final lOther$treatmentType = other.treatmentType;
    if (l$treatmentType != lOther$treatmentType) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (l$location != lOther$location) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$treatmentType = treatmentType;
    final l$scheduledTime = scheduledTime;
    final l$location = location;
    final l$notes = notes;
    return Object.hashAll([
      l$treatmentType,
      l$scheduledTime,
      l$location,
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateTreatmentSchedule<TRes> {
  factory CopyWith$Variables$Mutation$CreateTreatmentSchedule(
    Variables$Mutation$CreateTreatmentSchedule instance,
    TRes Function(Variables$Mutation$CreateTreatmentSchedule) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateTreatmentSchedule;

  factory CopyWith$Variables$Mutation$CreateTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateTreatmentSchedule;

  TRes call({
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$CreateTreatmentSchedule<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateTreatmentSchedule _instance;

  final TRes Function(Variables$Mutation$CreateTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? treatmentType = _undefined,
    Object? scheduledTime = _undefined,
    Object? location = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Variables$Mutation$CreateTreatmentSchedule._({
        ..._instance._$data,
        if (treatmentType != _undefined && treatmentType != null)
          'treatmentType': (treatmentType as String),
        if (scheduledTime != _undefined && scheduledTime != null)
          'scheduledTime': (scheduledTime as DateTime),
        if (location != _undefined && location != null)
          'location': (location as String),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$CreateTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateTreatmentSchedule(this._res);

  TRes _res;

  call({
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  }) =>
      _res;
}

class Mutation$CreateTreatmentSchedule {
  Mutation$CreateTreatmentSchedule({
    this.createTreatmentSchedule,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateTreatmentSchedule.fromJson(Map<String, dynamic> json) {
    final l$createTreatmentSchedule = json['createTreatmentSchedule'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTreatmentSchedule(
      createTreatmentSchedule: l$createTreatmentSchedule == null
          ? null
          : Mutation$CreateTreatmentSchedule$createTreatmentSchedule.fromJson(
              (l$createTreatmentSchedule as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateTreatmentSchedule$createTreatmentSchedule?
      createTreatmentSchedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createTreatmentSchedule = createTreatmentSchedule;
    _resultData['createTreatmentSchedule'] =
        l$createTreatmentSchedule?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createTreatmentSchedule = createTreatmentSchedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createTreatmentSchedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createTreatmentSchedule = createTreatmentSchedule;
    final lOther$createTreatmentSchedule = other.createTreatmentSchedule;
    if (l$createTreatmentSchedule != lOther$createTreatmentSchedule) {
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

extension UtilityExtension$Mutation$CreateTreatmentSchedule
    on Mutation$CreateTreatmentSchedule {
  CopyWith$Mutation$CreateTreatmentSchedule<Mutation$CreateTreatmentSchedule>
      get copyWith => CopyWith$Mutation$CreateTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateTreatmentSchedule<TRes> {
  factory CopyWith$Mutation$CreateTreatmentSchedule(
    Mutation$CreateTreatmentSchedule instance,
    TRes Function(Mutation$CreateTreatmentSchedule) then,
  ) = _CopyWithImpl$Mutation$CreateTreatmentSchedule;

  factory CopyWith$Mutation$CreateTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTreatmentSchedule;

  TRes call({
    Mutation$CreateTreatmentSchedule$createTreatmentSchedule?
        createTreatmentSchedule,
    String? $__typename,
  });
  CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<TRes>
      get createTreatmentSchedule;
}

class _CopyWithImpl$Mutation$CreateTreatmentSchedule<TRes>
    implements CopyWith$Mutation$CreateTreatmentSchedule<TRes> {
  _CopyWithImpl$Mutation$CreateTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$CreateTreatmentSchedule _instance;

  final TRes Function(Mutation$CreateTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createTreatmentSchedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateTreatmentSchedule(
        createTreatmentSchedule: createTreatmentSchedule == _undefined
            ? _instance.createTreatmentSchedule
            : (createTreatmentSchedule
                as Mutation$CreateTreatmentSchedule$createTreatmentSchedule?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<TRes>
      get createTreatmentSchedule {
    final local$createTreatmentSchedule = _instance.createTreatmentSchedule;
    return local$createTreatmentSchedule == null
        ? CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule
            .stub(_then(_instance))
        : CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
            local$createTreatmentSchedule,
            (e) => call(createTreatmentSchedule: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateTreatmentSchedule<TRes>
    implements CopyWith$Mutation$CreateTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Mutation$CreateTreatmentSchedule(this._res);

  TRes _res;

  call({
    Mutation$CreateTreatmentSchedule$createTreatmentSchedule?
        createTreatmentSchedule,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<TRes>
      get createTreatmentSchedule =>
          CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule
              .stub(_res);
}

const documentNodeMutationCreateTreatmentSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateTreatmentSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'treatmentType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'scheduledTime')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'notes')),
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
        name: NameNode(value: 'createTreatmentSchedule'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'treatmentType'),
            value: VariableNode(name: NameNode(value: 'treatmentType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'scheduledTime'),
            value: VariableNode(name: NameNode(value: 'scheduledTime')),
          ),
          ArgumentNode(
            name: NameNode(value: 'location'),
            value: VariableNode(name: NameNode(value: 'location')),
          ),
          ArgumentNode(
            name: NameNode(value: 'notes'),
            value: VariableNode(name: NameNode(value: 'notes')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'scheduleId'),
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
Mutation$CreateTreatmentSchedule _parserFn$Mutation$CreateTreatmentSchedule(
        Map<String, dynamic> data) =>
    Mutation$CreateTreatmentSchedule.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateTreatmentSchedule = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateTreatmentSchedule?,
);

class Options$Mutation$CreateTreatmentSchedule
    extends graphql.MutationOptions<Mutation$CreateTreatmentSchedule> {
  Options$Mutation$CreateTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$CreateTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$CreateTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateTreatmentSchedule,
          parserFn: _parserFn$Mutation$CreateTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$CreateTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateTreatmentSchedule
    extends graphql.WatchQueryOptions<Mutation$CreateTreatmentSchedule> {
  WatchOptions$Mutation$CreateTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$CreateTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTreatmentSchedule? typedOptimisticResult,
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
          document: documentNodeMutationCreateTreatmentSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateTreatmentSchedule,
        );
}

extension ClientExtension$Mutation$CreateTreatmentSchedule
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateTreatmentSchedule>>
      mutate$CreateTreatmentSchedule(
              Options$Mutation$CreateTreatmentSchedule options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateTreatmentSchedule>
      watchMutation$CreateTreatmentSchedule(
              WatchOptions$Mutation$CreateTreatmentSchedule options) =>
          this.watchMutation(options);
}

class Mutation$CreateTreatmentSchedule$HookResult {
  Mutation$CreateTreatmentSchedule$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateTreatmentSchedule runMutation;

  final graphql.QueryResult<Mutation$CreateTreatmentSchedule> result;
}

Mutation$CreateTreatmentSchedule$HookResult useMutation$CreateTreatmentSchedule(
    [WidgetOptions$Mutation$CreateTreatmentSchedule? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateTreatmentSchedule());
  return Mutation$CreateTreatmentSchedule$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateTreatmentSchedule>
    useWatchMutation$CreateTreatmentSchedule(
            WatchOptions$Mutation$CreateTreatmentSchedule options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateTreatmentSchedule
    extends graphql.MutationOptions<Mutation$CreateTreatmentSchedule> {
  WidgetOptions$Mutation$CreateTreatmentSchedule({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$CreateTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateTreatmentSchedule,
          parserFn: _parserFn$Mutation$CreateTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$CreateTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateTreatmentSchedule
    = graphql.MultiSourceResult<Mutation$CreateTreatmentSchedule> Function(
  Variables$Mutation$CreateTreatmentSchedule, {
  Object? optimisticResult,
  Mutation$CreateTreatmentSchedule? typedOptimisticResult,
});
typedef Builder$Mutation$CreateTreatmentSchedule = widgets.Widget Function(
  RunMutation$Mutation$CreateTreatmentSchedule,
  graphql.QueryResult<Mutation$CreateTreatmentSchedule>?,
);

class Mutation$CreateTreatmentSchedule$Widget
    extends graphql_flutter.Mutation<Mutation$CreateTreatmentSchedule> {
  Mutation$CreateTreatmentSchedule$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateTreatmentSchedule? options,
    required Builder$Mutation$CreateTreatmentSchedule builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateTreatmentSchedule(),
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

class Mutation$CreateTreatmentSchedule$createTreatmentSchedule {
  Mutation$CreateTreatmentSchedule$createTreatmentSchedule({
    required this.scheduleId,
    required this.message,
    this.$__typename = 'CreateTreatmentScheduleResponse',
  });

  factory Mutation$CreateTreatmentSchedule$createTreatmentSchedule.fromJson(
      Map<String, dynamic> json) {
    final l$scheduleId = json['scheduleId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
      scheduleId: (l$scheduleId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String scheduleId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    _resultData['scheduleId'] = l$scheduleId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$scheduleId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateTreatmentSchedule$createTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
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

extension UtilityExtension$Mutation$CreateTreatmentSchedule$createTreatmentSchedule
    on Mutation$CreateTreatmentSchedule$createTreatmentSchedule {
  CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
          Mutation$CreateTreatmentSchedule$createTreatmentSchedule>
      get copyWith =>
          CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
    TRes> {
  factory CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
    Mutation$CreateTreatmentSchedule$createTreatmentSchedule instance,
    TRes Function(Mutation$CreateTreatmentSchedule$createTreatmentSchedule)
        then,
  ) = _CopyWithImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule;

  factory CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule;

  TRes call({
    String? scheduleId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
            TRes> {
  _CopyWithImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$CreateTreatmentSchedule$createTreatmentSchedule _instance;

  final TRes Function(Mutation$CreateTreatmentSchedule$createTreatmentSchedule)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? scheduleId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
        scheduleId: scheduleId == _undefined || scheduleId == null
            ? _instance.scheduleId
            : (scheduleId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$CreateTreatmentSchedule$createTreatmentSchedule<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateTreatmentSchedule$createTreatmentSchedule(
      this._res);

  TRes _res;

  call({
    String? scheduleId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateTreatmentSchedule {
  factory Variables$Mutation$UpdateTreatmentSchedule({
    required String scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  }) =>
      Variables$Mutation$UpdateTreatmentSchedule._({
        r'scheduleId': scheduleId,
        if (treatmentType != null) r'treatmentType': treatmentType,
        if (scheduledTime != null) r'scheduledTime': scheduledTime,
        if (location != null) r'location': location,
        if (notes != null) r'notes': notes,
      });

  Variables$Mutation$UpdateTreatmentSchedule._(this._$data);

  factory Variables$Mutation$UpdateTreatmentSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$scheduleId = data['scheduleId'];
    result$data['scheduleId'] = (l$scheduleId as String);
    if (data.containsKey('treatmentType')) {
      final l$treatmentType = data['treatmentType'];
      result$data['treatmentType'] = (l$treatmentType as String?);
    }
    if (data.containsKey('scheduledTime')) {
      final l$scheduledTime = data['scheduledTime'];
      result$data['scheduledTime'] =
          l$scheduledTime == null ? null : dateTimeFromJson(l$scheduledTime);
    }
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    return Variables$Mutation$UpdateTreatmentSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  String get scheduleId => (_$data['scheduleId'] as String);

  String? get treatmentType => (_$data['treatmentType'] as String?);

  DateTime? get scheduledTime => (_$data['scheduledTime'] as DateTime?);

  String? get location => (_$data['location'] as String?);

  String? get notes => (_$data['notes'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    result$data['scheduleId'] = l$scheduleId;
    if (_$data.containsKey('treatmentType')) {
      final l$treatmentType = treatmentType;
      result$data['treatmentType'] = l$treatmentType;
    }
    if (_$data.containsKey('scheduledTime')) {
      final l$scheduledTime = scheduledTime;
      result$data['scheduledTime'] =
          l$scheduledTime == null ? null : dateTimeToJson(l$scheduledTime);
    }
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateTreatmentSchedule<
          Variables$Mutation$UpdateTreatmentSchedule>
      get copyWith => CopyWith$Variables$Mutation$UpdateTreatmentSchedule(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    final l$treatmentType = treatmentType;
    final lOther$treatmentType = other.treatmentType;
    if (_$data.containsKey('treatmentType') !=
        other._$data.containsKey('treatmentType')) {
      return false;
    }
    if (l$treatmentType != lOther$treatmentType) {
      return false;
    }
    final l$scheduledTime = scheduledTime;
    final lOther$scheduledTime = other.scheduledTime;
    if (_$data.containsKey('scheduledTime') !=
        other._$data.containsKey('scheduledTime')) {
      return false;
    }
    if (l$scheduledTime != lOther$scheduledTime) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    final l$treatmentType = treatmentType;
    final l$scheduledTime = scheduledTime;
    final l$location = location;
    final l$notes = notes;
    return Object.hashAll([
      l$scheduleId,
      _$data.containsKey('treatmentType') ? l$treatmentType : const {},
      _$data.containsKey('scheduledTime') ? l$scheduledTime : const {},
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('notes') ? l$notes : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateTreatmentSchedule<TRes> {
  factory CopyWith$Variables$Mutation$UpdateTreatmentSchedule(
    Variables$Mutation$UpdateTreatmentSchedule instance,
    TRes Function(Variables$Mutation$UpdateTreatmentSchedule) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateTreatmentSchedule;

  factory CopyWith$Variables$Mutation$UpdateTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateTreatmentSchedule;

  TRes call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$UpdateTreatmentSchedule<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateTreatmentSchedule _instance;

  final TRes Function(Variables$Mutation$UpdateTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? scheduleId = _undefined,
    Object? treatmentType = _undefined,
    Object? scheduledTime = _undefined,
    Object? location = _undefined,
    Object? notes = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateTreatmentSchedule._({
        ..._instance._$data,
        if (scheduleId != _undefined && scheduleId != null)
          'scheduleId': (scheduleId as String),
        if (treatmentType != _undefined)
          'treatmentType': (treatmentType as String?),
        if (scheduledTime != _undefined)
          'scheduledTime': (scheduledTime as DateTime?),
        if (location != _undefined) 'location': (location as String?),
        if (notes != _undefined) 'notes': (notes as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$UpdateTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateTreatmentSchedule(this._res);

  TRes _res;

  call({
    String? scheduleId,
    String? treatmentType,
    DateTime? scheduledTime,
    String? location,
    String? notes,
  }) =>
      _res;
}

class Mutation$UpdateTreatmentSchedule {
  Mutation$UpdateTreatmentSchedule({
    this.updateTreatmentSchedule,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateTreatmentSchedule.fromJson(Map<String, dynamic> json) {
    final l$updateTreatmentSchedule = json['updateTreatmentSchedule'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateTreatmentSchedule(
      updateTreatmentSchedule: l$updateTreatmentSchedule == null
          ? null
          : Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule.fromJson(
              (l$updateTreatmentSchedule as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule?
      updateTreatmentSchedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateTreatmentSchedule = updateTreatmentSchedule;
    _resultData['updateTreatmentSchedule'] =
        l$updateTreatmentSchedule?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateTreatmentSchedule = updateTreatmentSchedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateTreatmentSchedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateTreatmentSchedule = updateTreatmentSchedule;
    final lOther$updateTreatmentSchedule = other.updateTreatmentSchedule;
    if (l$updateTreatmentSchedule != lOther$updateTreatmentSchedule) {
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

extension UtilityExtension$Mutation$UpdateTreatmentSchedule
    on Mutation$UpdateTreatmentSchedule {
  CopyWith$Mutation$UpdateTreatmentSchedule<Mutation$UpdateTreatmentSchedule>
      get copyWith => CopyWith$Mutation$UpdateTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateTreatmentSchedule<TRes> {
  factory CopyWith$Mutation$UpdateTreatmentSchedule(
    Mutation$UpdateTreatmentSchedule instance,
    TRes Function(Mutation$UpdateTreatmentSchedule) then,
  ) = _CopyWithImpl$Mutation$UpdateTreatmentSchedule;

  factory CopyWith$Mutation$UpdateTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule;

  TRes call({
    Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule?
        updateTreatmentSchedule,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<TRes>
      get updateTreatmentSchedule;
}

class _CopyWithImpl$Mutation$UpdateTreatmentSchedule<TRes>
    implements CopyWith$Mutation$UpdateTreatmentSchedule<TRes> {
  _CopyWithImpl$Mutation$UpdateTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$UpdateTreatmentSchedule _instance;

  final TRes Function(Mutation$UpdateTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateTreatmentSchedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateTreatmentSchedule(
        updateTreatmentSchedule: updateTreatmentSchedule == _undefined
            ? _instance.updateTreatmentSchedule
            : (updateTreatmentSchedule
                as Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<TRes>
      get updateTreatmentSchedule {
    final local$updateTreatmentSchedule = _instance.updateTreatmentSchedule;
    return local$updateTreatmentSchedule == null
        ? CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule
            .stub(_then(_instance))
        : CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
            local$updateTreatmentSchedule,
            (e) => call(updateTreatmentSchedule: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule<TRes>
    implements CopyWith$Mutation$UpdateTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule(this._res);

  TRes _res;

  call({
    Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule?
        updateTreatmentSchedule,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<TRes>
      get updateTreatmentSchedule =>
          CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule
              .stub(_res);
}

const documentNodeMutationUpdateTreatmentSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateTreatmentSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'scheduleId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'treatmentType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'scheduledTime')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'location')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'notes')),
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
        name: NameNode(value: 'updateTreatmentSchedule'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'scheduleId'),
            value: VariableNode(name: NameNode(value: 'scheduleId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'treatmentType'),
            value: VariableNode(name: NameNode(value: 'treatmentType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'scheduledTime'),
            value: VariableNode(name: NameNode(value: 'scheduledTime')),
          ),
          ArgumentNode(
            name: NameNode(value: 'location'),
            value: VariableNode(name: NameNode(value: 'location')),
          ),
          ArgumentNode(
            name: NameNode(value: 'notes'),
            value: VariableNode(name: NameNode(value: 'notes')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'scheduleId'),
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
Mutation$UpdateTreatmentSchedule _parserFn$Mutation$UpdateTreatmentSchedule(
        Map<String, dynamic> data) =>
    Mutation$UpdateTreatmentSchedule.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateTreatmentSchedule = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateTreatmentSchedule?,
);

class Options$Mutation$UpdateTreatmentSchedule
    extends graphql.MutationOptions<Mutation$UpdateTreatmentSchedule> {
  Options$Mutation$UpdateTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$UpdateTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$UpdateTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateTreatmentSchedule,
          parserFn: _parserFn$Mutation$UpdateTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$UpdateTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateTreatmentSchedule
    extends graphql.WatchQueryOptions<Mutation$UpdateTreatmentSchedule> {
  WatchOptions$Mutation$UpdateTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$UpdateTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateTreatmentSchedule? typedOptimisticResult,
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
          document: documentNodeMutationUpdateTreatmentSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateTreatmentSchedule,
        );
}

extension ClientExtension$Mutation$UpdateTreatmentSchedule
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateTreatmentSchedule>>
      mutate$UpdateTreatmentSchedule(
              Options$Mutation$UpdateTreatmentSchedule options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateTreatmentSchedule>
      watchMutation$UpdateTreatmentSchedule(
              WatchOptions$Mutation$UpdateTreatmentSchedule options) =>
          this.watchMutation(options);
}

class Mutation$UpdateTreatmentSchedule$HookResult {
  Mutation$UpdateTreatmentSchedule$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateTreatmentSchedule runMutation;

  final graphql.QueryResult<Mutation$UpdateTreatmentSchedule> result;
}

Mutation$UpdateTreatmentSchedule$HookResult useMutation$UpdateTreatmentSchedule(
    [WidgetOptions$Mutation$UpdateTreatmentSchedule? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateTreatmentSchedule());
  return Mutation$UpdateTreatmentSchedule$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateTreatmentSchedule>
    useWatchMutation$UpdateTreatmentSchedule(
            WatchOptions$Mutation$UpdateTreatmentSchedule options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateTreatmentSchedule
    extends graphql.MutationOptions<Mutation$UpdateTreatmentSchedule> {
  WidgetOptions$Mutation$UpdateTreatmentSchedule({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$UpdateTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateTreatmentSchedule,
          parserFn: _parserFn$Mutation$UpdateTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$UpdateTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateTreatmentSchedule
    = graphql.MultiSourceResult<Mutation$UpdateTreatmentSchedule> Function(
  Variables$Mutation$UpdateTreatmentSchedule, {
  Object? optimisticResult,
  Mutation$UpdateTreatmentSchedule? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateTreatmentSchedule = widgets.Widget Function(
  RunMutation$Mutation$UpdateTreatmentSchedule,
  graphql.QueryResult<Mutation$UpdateTreatmentSchedule>?,
);

class Mutation$UpdateTreatmentSchedule$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateTreatmentSchedule> {
  Mutation$UpdateTreatmentSchedule$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateTreatmentSchedule? options,
    required Builder$Mutation$UpdateTreatmentSchedule builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateTreatmentSchedule(),
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

class Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule {
  Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule({
    required this.scheduleId,
    required this.message,
    this.$__typename = 'UpdateTreatmentScheduleResponse',
  });

  factory Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule.fromJson(
      Map<String, dynamic> json) {
    final l$scheduleId = json['scheduleId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
      scheduleId: (l$scheduleId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String scheduleId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    _resultData['scheduleId'] = l$scheduleId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$scheduleId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
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

extension UtilityExtension$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule
    on Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule {
  CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
          Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule>
      get copyWith =>
          CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
    TRes> {
  factory CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
    Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule instance,
    TRes Function(Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule)
        then,
  ) = _CopyWithImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule;

  factory CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule;

  TRes call({
    String? scheduleId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
            TRes> {
  _CopyWithImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule _instance;

  final TRes Function(Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? scheduleId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
        scheduleId: scheduleId == _undefined || scheduleId == null
            ? _instance.scheduleId
            : (scheduleId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule<
            TRes> {
  _CopyWithStubImpl$Mutation$UpdateTreatmentSchedule$updateTreatmentSchedule(
      this._res);

  TRes _res;

  call({
    String? scheduleId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteTreatmentSchedule {
  factory Variables$Mutation$DeleteTreatmentSchedule(
          {required String scheduleId}) =>
      Variables$Mutation$DeleteTreatmentSchedule._({
        r'scheduleId': scheduleId,
      });

  Variables$Mutation$DeleteTreatmentSchedule._(this._$data);

  factory Variables$Mutation$DeleteTreatmentSchedule.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$scheduleId = data['scheduleId'];
    result$data['scheduleId'] = (l$scheduleId as String);
    return Variables$Mutation$DeleteTreatmentSchedule._(result$data);
  }

  Map<String, dynamic> _$data;

  String get scheduleId => (_$data['scheduleId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$scheduleId = scheduleId;
    result$data['scheduleId'] = l$scheduleId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteTreatmentSchedule<
          Variables$Mutation$DeleteTreatmentSchedule>
      get copyWith => CopyWith$Variables$Mutation$DeleteTreatmentSchedule(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$scheduleId = scheduleId;
    final lOther$scheduleId = other.scheduleId;
    if (l$scheduleId != lOther$scheduleId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$scheduleId = scheduleId;
    return Object.hashAll([l$scheduleId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteTreatmentSchedule<TRes> {
  factory CopyWith$Variables$Mutation$DeleteTreatmentSchedule(
    Variables$Mutation$DeleteTreatmentSchedule instance,
    TRes Function(Variables$Mutation$DeleteTreatmentSchedule) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteTreatmentSchedule;

  factory CopyWith$Variables$Mutation$DeleteTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteTreatmentSchedule;

  TRes call({String? scheduleId});
}

class _CopyWithImpl$Variables$Mutation$DeleteTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$DeleteTreatmentSchedule<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteTreatmentSchedule _instance;

  final TRes Function(Variables$Mutation$DeleteTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? scheduleId = _undefined}) =>
      _then(Variables$Mutation$DeleteTreatmentSchedule._({
        ..._instance._$data,
        if (scheduleId != _undefined && scheduleId != null)
          'scheduleId': (scheduleId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteTreatmentSchedule<TRes>
    implements CopyWith$Variables$Mutation$DeleteTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteTreatmentSchedule(this._res);

  TRes _res;

  call({String? scheduleId}) => _res;
}

class Mutation$DeleteTreatmentSchedule {
  Mutation$DeleteTreatmentSchedule({
    this.deleteTreatmentSchedule,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteTreatmentSchedule.fromJson(Map<String, dynamic> json) {
    final l$deleteTreatmentSchedule = json['deleteTreatmentSchedule'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteTreatmentSchedule(
      deleteTreatmentSchedule: l$deleteTreatmentSchedule == null
          ? null
          : Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule.fromJson(
              (l$deleteTreatmentSchedule as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule?
      deleteTreatmentSchedule;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteTreatmentSchedule = deleteTreatmentSchedule;
    _resultData['deleteTreatmentSchedule'] =
        l$deleteTreatmentSchedule?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteTreatmentSchedule = deleteTreatmentSchedule;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteTreatmentSchedule,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteTreatmentSchedule) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteTreatmentSchedule = deleteTreatmentSchedule;
    final lOther$deleteTreatmentSchedule = other.deleteTreatmentSchedule;
    if (l$deleteTreatmentSchedule != lOther$deleteTreatmentSchedule) {
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

extension UtilityExtension$Mutation$DeleteTreatmentSchedule
    on Mutation$DeleteTreatmentSchedule {
  CopyWith$Mutation$DeleteTreatmentSchedule<Mutation$DeleteTreatmentSchedule>
      get copyWith => CopyWith$Mutation$DeleteTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteTreatmentSchedule<TRes> {
  factory CopyWith$Mutation$DeleteTreatmentSchedule(
    Mutation$DeleteTreatmentSchedule instance,
    TRes Function(Mutation$DeleteTreatmentSchedule) then,
  ) = _CopyWithImpl$Mutation$DeleteTreatmentSchedule;

  factory CopyWith$Mutation$DeleteTreatmentSchedule.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule;

  TRes call({
    Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule?
        deleteTreatmentSchedule,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<TRes>
      get deleteTreatmentSchedule;
}

class _CopyWithImpl$Mutation$DeleteTreatmentSchedule<TRes>
    implements CopyWith$Mutation$DeleteTreatmentSchedule<TRes> {
  _CopyWithImpl$Mutation$DeleteTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$DeleteTreatmentSchedule _instance;

  final TRes Function(Mutation$DeleteTreatmentSchedule) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteTreatmentSchedule = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteTreatmentSchedule(
        deleteTreatmentSchedule: deleteTreatmentSchedule == _undefined
            ? _instance.deleteTreatmentSchedule
            : (deleteTreatmentSchedule
                as Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<TRes>
      get deleteTreatmentSchedule {
    final local$deleteTreatmentSchedule = _instance.deleteTreatmentSchedule;
    return local$deleteTreatmentSchedule == null
        ? CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule
            .stub(_then(_instance))
        : CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
            local$deleteTreatmentSchedule,
            (e) => call(deleteTreatmentSchedule: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule<TRes>
    implements CopyWith$Mutation$DeleteTreatmentSchedule<TRes> {
  _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule(this._res);

  TRes _res;

  call({
    Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule?
        deleteTreatmentSchedule,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<TRes>
      get deleteTreatmentSchedule =>
          CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule
              .stub(_res);
}

const documentNodeMutationDeleteTreatmentSchedule = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteTreatmentSchedule'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'scheduleId')),
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
        name: NameNode(value: 'deleteTreatmentSchedule'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'scheduleId'),
            value: VariableNode(name: NameNode(value: 'scheduleId')),
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
Mutation$DeleteTreatmentSchedule _parserFn$Mutation$DeleteTreatmentSchedule(
        Map<String, dynamic> data) =>
    Mutation$DeleteTreatmentSchedule.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteTreatmentSchedule = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteTreatmentSchedule?,
);

class Options$Mutation$DeleteTreatmentSchedule
    extends graphql.MutationOptions<Mutation$DeleteTreatmentSchedule> {
  Options$Mutation$DeleteTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$DeleteTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$DeleteTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteTreatmentSchedule,
          parserFn: _parserFn$Mutation$DeleteTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$DeleteTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteTreatmentSchedule
    extends graphql.WatchQueryOptions<Mutation$DeleteTreatmentSchedule> {
  WatchOptions$Mutation$DeleteTreatmentSchedule({
    String? operationName,
    required Variables$Mutation$DeleteTreatmentSchedule variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteTreatmentSchedule? typedOptimisticResult,
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
          document: documentNodeMutationDeleteTreatmentSchedule,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteTreatmentSchedule,
        );
}

extension ClientExtension$Mutation$DeleteTreatmentSchedule
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteTreatmentSchedule>>
      mutate$DeleteTreatmentSchedule(
              Options$Mutation$DeleteTreatmentSchedule options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteTreatmentSchedule>
      watchMutation$DeleteTreatmentSchedule(
              WatchOptions$Mutation$DeleteTreatmentSchedule options) =>
          this.watchMutation(options);
}

class Mutation$DeleteTreatmentSchedule$HookResult {
  Mutation$DeleteTreatmentSchedule$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteTreatmentSchedule runMutation;

  final graphql.QueryResult<Mutation$DeleteTreatmentSchedule> result;
}

Mutation$DeleteTreatmentSchedule$HookResult useMutation$DeleteTreatmentSchedule(
    [WidgetOptions$Mutation$DeleteTreatmentSchedule? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteTreatmentSchedule());
  return Mutation$DeleteTreatmentSchedule$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteTreatmentSchedule>
    useWatchMutation$DeleteTreatmentSchedule(
            WatchOptions$Mutation$DeleteTreatmentSchedule options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteTreatmentSchedule
    extends graphql.MutationOptions<Mutation$DeleteTreatmentSchedule> {
  WidgetOptions$Mutation$DeleteTreatmentSchedule({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteTreatmentSchedule? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteTreatmentSchedule? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteTreatmentSchedule>? update,
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
                        : _parserFn$Mutation$DeleteTreatmentSchedule(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteTreatmentSchedule,
          parserFn: _parserFn$Mutation$DeleteTreatmentSchedule,
        );

  final OnMutationCompleted$Mutation$DeleteTreatmentSchedule?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteTreatmentSchedule
    = graphql.MultiSourceResult<Mutation$DeleteTreatmentSchedule> Function(
  Variables$Mutation$DeleteTreatmentSchedule, {
  Object? optimisticResult,
  Mutation$DeleteTreatmentSchedule? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteTreatmentSchedule = widgets.Widget Function(
  RunMutation$Mutation$DeleteTreatmentSchedule,
  graphql.QueryResult<Mutation$DeleteTreatmentSchedule>?,
);

class Mutation$DeleteTreatmentSchedule$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteTreatmentSchedule> {
  Mutation$DeleteTreatmentSchedule$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteTreatmentSchedule? options,
    required Builder$Mutation$DeleteTreatmentSchedule builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteTreatmentSchedule(),
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

class Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule {
  Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule({
    required this.message,
    this.$__typename = 'DeleteTreatmentScheduleResponse',
  });

  factory Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
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
    if (!(other is Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule) ||
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

extension UtilityExtension$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule
    on Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule {
  CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
          Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule>
      get copyWith =>
          CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
    TRes> {
  factory CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
    Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule instance,
    TRes Function(Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule)
        then,
  ) = _CopyWithImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule;

  factory CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
            TRes> {
  _CopyWithImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
    this._instance,
    this._then,
  );

  final Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule _instance;

  final TRes Function(Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
        TRes>
    implements
        CopyWith$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule<
            TRes> {
  _CopyWithStubImpl$Mutation$DeleteTreatmentSchedule$deleteTreatmentSchedule(
      this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
