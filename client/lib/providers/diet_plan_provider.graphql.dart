import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetFoodSpecs {
  factory Variables$Query$GetFoodSpecs({required String food}) =>
      Variables$Query$GetFoodSpecs._({
        r'food': food,
      });

  Variables$Query$GetFoodSpecs._(this._$data);

  factory Variables$Query$GetFoodSpecs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$food = data['food'];
    result$data['food'] = (l$food as String);
    return Variables$Query$GetFoodSpecs._(result$data);
  }

  Map<String, dynamic> _$data;

  String get food => (_$data['food'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$food = food;
    result$data['food'] = l$food;
    return result$data;
  }

  CopyWith$Variables$Query$GetFoodSpecs<Variables$Query$GetFoodSpecs>
      get copyWith => CopyWith$Variables$Query$GetFoodSpecs(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetFoodSpecs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$food = food;
    final lOther$food = other.food;
    if (l$food != lOther$food) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$food = food;
    return Object.hashAll([l$food]);
  }
}

abstract class CopyWith$Variables$Query$GetFoodSpecs<TRes> {
  factory CopyWith$Variables$Query$GetFoodSpecs(
    Variables$Query$GetFoodSpecs instance,
    TRes Function(Variables$Query$GetFoodSpecs) then,
  ) = _CopyWithImpl$Variables$Query$GetFoodSpecs;

  factory CopyWith$Variables$Query$GetFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetFoodSpecs;

  TRes call({String? food});
}

class _CopyWithImpl$Variables$Query$GetFoodSpecs<TRes>
    implements CopyWith$Variables$Query$GetFoodSpecs<TRes> {
  _CopyWithImpl$Variables$Query$GetFoodSpecs(
    this._instance,
    this._then,
  );

  final Variables$Query$GetFoodSpecs _instance;

  final TRes Function(Variables$Query$GetFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? food = _undefined}) =>
      _then(Variables$Query$GetFoodSpecs._({
        ..._instance._$data,
        if (food != _undefined && food != null) 'food': (food as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetFoodSpecs<TRes>
    implements CopyWith$Variables$Query$GetFoodSpecs<TRes> {
  _CopyWithStubImpl$Variables$Query$GetFoodSpecs(this._res);

  TRes _res;

  call({String? food}) => _res;
}

class Query$GetFoodSpecs {
  Query$GetFoodSpecs({
    this.getFoodSpecs,
    this.$__typename = 'Query',
  });

  factory Query$GetFoodSpecs.fromJson(Map<String, dynamic> json) {
    final l$getFoodSpecs = json['getFoodSpecs'];
    final l$$__typename = json['__typename'];
    return Query$GetFoodSpecs(
      getFoodSpecs: l$getFoodSpecs == null
          ? null
          : Query$GetFoodSpecs$getFoodSpecs.fromJson(
              (l$getFoodSpecs as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetFoodSpecs$getFoodSpecs? getFoodSpecs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getFoodSpecs = getFoodSpecs;
    _resultData['getFoodSpecs'] = l$getFoodSpecs?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getFoodSpecs = getFoodSpecs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getFoodSpecs,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetFoodSpecs) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getFoodSpecs = getFoodSpecs;
    final lOther$getFoodSpecs = other.getFoodSpecs;
    if (l$getFoodSpecs != lOther$getFoodSpecs) {
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

extension UtilityExtension$Query$GetFoodSpecs on Query$GetFoodSpecs {
  CopyWith$Query$GetFoodSpecs<Query$GetFoodSpecs> get copyWith =>
      CopyWith$Query$GetFoodSpecs(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetFoodSpecs<TRes> {
  factory CopyWith$Query$GetFoodSpecs(
    Query$GetFoodSpecs instance,
    TRes Function(Query$GetFoodSpecs) then,
  ) = _CopyWithImpl$Query$GetFoodSpecs;

  factory CopyWith$Query$GetFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetFoodSpecs;

  TRes call({
    Query$GetFoodSpecs$getFoodSpecs? getFoodSpecs,
    String? $__typename,
  });
  CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> get getFoodSpecs;
}

class _CopyWithImpl$Query$GetFoodSpecs<TRes>
    implements CopyWith$Query$GetFoodSpecs<TRes> {
  _CopyWithImpl$Query$GetFoodSpecs(
    this._instance,
    this._then,
  );

  final Query$GetFoodSpecs _instance;

  final TRes Function(Query$GetFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getFoodSpecs = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetFoodSpecs(
        getFoodSpecs: getFoodSpecs == _undefined
            ? _instance.getFoodSpecs
            : (getFoodSpecs as Query$GetFoodSpecs$getFoodSpecs?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> get getFoodSpecs {
    final local$getFoodSpecs = _instance.getFoodSpecs;
    return local$getFoodSpecs == null
        ? CopyWith$Query$GetFoodSpecs$getFoodSpecs.stub(_then(_instance))
        : CopyWith$Query$GetFoodSpecs$getFoodSpecs(
            local$getFoodSpecs, (e) => call(getFoodSpecs: e));
  }
}

class _CopyWithStubImpl$Query$GetFoodSpecs<TRes>
    implements CopyWith$Query$GetFoodSpecs<TRes> {
  _CopyWithStubImpl$Query$GetFoodSpecs(this._res);

  TRes _res;

  call({
    Query$GetFoodSpecs$getFoodSpecs? getFoodSpecs,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> get getFoodSpecs =>
      CopyWith$Query$GetFoodSpecs$getFoodSpecs.stub(_res);
}

const documentNodeQueryGetFoodSpecs = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetFoodSpecs'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'food')),
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
        name: NameNode(value: 'getFoodSpecs'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'food'),
            value: VariableNode(name: NameNode(value: 'food')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'specs'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
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
                name: NameNode(value: 'howHigh'),
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
            name: NameNode(value: 'howRecommend'),
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
Query$GetFoodSpecs _parserFn$Query$GetFoodSpecs(Map<String, dynamic> data) =>
    Query$GetFoodSpecs.fromJson(data);
typedef OnQueryComplete$Query$GetFoodSpecs = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetFoodSpecs?,
);

class Options$Query$GetFoodSpecs
    extends graphql.QueryOptions<Query$GetFoodSpecs> {
  Options$Query$GetFoodSpecs({
    String? operationName,
    required Variables$Query$GetFoodSpecs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetFoodSpecs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetFoodSpecs? onComplete,
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
                    data == null ? null : _parserFn$Query$GetFoodSpecs(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetFoodSpecs,
          parserFn: _parserFn$Query$GetFoodSpecs,
        );

  final OnQueryComplete$Query$GetFoodSpecs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetFoodSpecs
    extends graphql.WatchQueryOptions<Query$GetFoodSpecs> {
  WatchOptions$Query$GetFoodSpecs({
    String? operationName,
    required Variables$Query$GetFoodSpecs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetFoodSpecs? typedOptimisticResult,
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
          document: documentNodeQueryGetFoodSpecs,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetFoodSpecs,
        );
}

class FetchMoreOptions$Query$GetFoodSpecs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetFoodSpecs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetFoodSpecs variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetFoodSpecs,
        );
}

extension ClientExtension$Query$GetFoodSpecs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetFoodSpecs>> query$GetFoodSpecs(
          Options$Query$GetFoodSpecs options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetFoodSpecs> watchQuery$GetFoodSpecs(
          WatchOptions$Query$GetFoodSpecs options) =>
      this.watchQuery(options);
  void writeQuery$GetFoodSpecs({
    required Query$GetFoodSpecs data,
    required Variables$Query$GetFoodSpecs variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetFoodSpecs),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetFoodSpecs? readQuery$GetFoodSpecs({
    required Variables$Query$GetFoodSpecs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetFoodSpecs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetFoodSpecs.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetFoodSpecs> useQuery$GetFoodSpecs(
        Options$Query$GetFoodSpecs options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetFoodSpecs> useWatchQuery$GetFoodSpecs(
        WatchOptions$Query$GetFoodSpecs options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetFoodSpecs$Widget
    extends graphql_flutter.Query<Query$GetFoodSpecs> {
  Query$GetFoodSpecs$Widget({
    widgets.Key? key,
    required Options$Query$GetFoodSpecs options,
    required graphql_flutter.QueryBuilder<Query$GetFoodSpecs> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetFoodSpecs$getFoodSpecs {
  Query$GetFoodSpecs$getFoodSpecs({
    required this.specs,
    required this.howRecommend,
    this.$__typename = 'FoodSpecs',
  });

  factory Query$GetFoodSpecs$getFoodSpecs.fromJson(Map<String, dynamic> json) {
    final l$specs = json['specs'];
    final l$howRecommend = json['howRecommend'];
    final l$$__typename = json['__typename'];
    return Query$GetFoodSpecs$getFoodSpecs(
      specs: (l$specs as List<dynamic>)
          .map((e) => Query$GetFoodSpecs$getFoodSpecs$specs.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      howRecommend: (l$howRecommend as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetFoodSpecs$getFoodSpecs$specs> specs;

  final double howRecommend;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$specs = specs;
    _resultData['specs'] = l$specs.map((e) => e.toJson()).toList();
    final l$howRecommend = howRecommend;
    _resultData['howRecommend'] = l$howRecommend;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$specs = specs;
    final l$howRecommend = howRecommend;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$specs.map((v) => v)),
      l$howRecommend,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetFoodSpecs$getFoodSpecs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$specs = specs;
    final lOther$specs = other.specs;
    if (l$specs.length != lOther$specs.length) {
      return false;
    }
    for (int i = 0; i < l$specs.length; i++) {
      final l$specs$entry = l$specs[i];
      final lOther$specs$entry = lOther$specs[i];
      if (l$specs$entry != lOther$specs$entry) {
        return false;
      }
    }
    final l$howRecommend = howRecommend;
    final lOther$howRecommend = other.howRecommend;
    if (l$howRecommend != lOther$howRecommend) {
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

extension UtilityExtension$Query$GetFoodSpecs$getFoodSpecs
    on Query$GetFoodSpecs$getFoodSpecs {
  CopyWith$Query$GetFoodSpecs$getFoodSpecs<Query$GetFoodSpecs$getFoodSpecs>
      get copyWith => CopyWith$Query$GetFoodSpecs$getFoodSpecs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> {
  factory CopyWith$Query$GetFoodSpecs$getFoodSpecs(
    Query$GetFoodSpecs$getFoodSpecs instance,
    TRes Function(Query$GetFoodSpecs$getFoodSpecs) then,
  ) = _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs;

  factory CopyWith$Query$GetFoodSpecs$getFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs;

  TRes call({
    List<Query$GetFoodSpecs$getFoodSpecs$specs>? specs,
    double? howRecommend,
    String? $__typename,
  });
  TRes specs(
      Iterable<Query$GetFoodSpecs$getFoodSpecs$specs> Function(
              Iterable<
                  CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<
                      Query$GetFoodSpecs$getFoodSpecs$specs>>)
          _fn);
}

class _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs<TRes>
    implements CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> {
  _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs(
    this._instance,
    this._then,
  );

  final Query$GetFoodSpecs$getFoodSpecs _instance;

  final TRes Function(Query$GetFoodSpecs$getFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? specs = _undefined,
    Object? howRecommend = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetFoodSpecs$getFoodSpecs(
        specs: specs == _undefined || specs == null
            ? _instance.specs
            : (specs as List<Query$GetFoodSpecs$getFoodSpecs$specs>),
        howRecommend: howRecommend == _undefined || howRecommend == null
            ? _instance.howRecommend
            : (howRecommend as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes specs(
          Iterable<Query$GetFoodSpecs$getFoodSpecs$specs> Function(
                  Iterable<
                      CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<
                          Query$GetFoodSpecs$getFoodSpecs$specs>>)
              _fn) =>
      call(
          specs: _fn(_instance.specs
              .map((e) => CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs<TRes>
    implements CopyWith$Query$GetFoodSpecs$getFoodSpecs<TRes> {
  _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs(this._res);

  TRes _res;

  call({
    List<Query$GetFoodSpecs$getFoodSpecs$specs>? specs,
    double? howRecommend,
    String? $__typename,
  }) =>
      _res;

  specs(_fn) => _res;
}

class Query$GetFoodSpecs$getFoodSpecs$specs {
  Query$GetFoodSpecs$getFoodSpecs$specs({
    required this.name,
    required this.value,
    required this.unit,
    required this.howHigh,
    this.$__typename = 'FoodSpec',
  });

  factory Query$GetFoodSpecs$getFoodSpecs$specs.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$value = json['value'];
    final l$unit = json['unit'];
    final l$howHigh = json['howHigh'];
    final l$$__typename = json['__typename'];
    return Query$GetFoodSpecs$getFoodSpecs$specs(
      name: (l$name as String),
      value: (l$value as num).toDouble(),
      unit: (l$unit as String),
      howHigh: (l$howHigh as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final double value;

  final String unit;

  final double howHigh;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$unit = unit;
    _resultData['unit'] = l$unit;
    final l$howHigh = howHigh;
    _resultData['howHigh'] = l$howHigh;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$value = value;
    final l$unit = unit;
    final l$howHigh = howHigh;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$value,
      l$unit,
      l$howHigh,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetFoodSpecs$getFoodSpecs$specs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$howHigh = howHigh;
    final lOther$howHigh = other.howHigh;
    if (l$howHigh != lOther$howHigh) {
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

extension UtilityExtension$Query$GetFoodSpecs$getFoodSpecs$specs
    on Query$GetFoodSpecs$getFoodSpecs$specs {
  CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<
          Query$GetFoodSpecs$getFoodSpecs$specs>
      get copyWith => CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<TRes> {
  factory CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs(
    Query$GetFoodSpecs$getFoodSpecs$specs instance,
    TRes Function(Query$GetFoodSpecs$getFoodSpecs$specs) then,
  ) = _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs$specs;

  factory CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs$specs;

  TRes call({
    String? name,
    double? value,
    String? unit,
    double? howHigh,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs$specs<TRes>
    implements CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<TRes> {
  _CopyWithImpl$Query$GetFoodSpecs$getFoodSpecs$specs(
    this._instance,
    this._then,
  );

  final Query$GetFoodSpecs$getFoodSpecs$specs _instance;

  final TRes Function(Query$GetFoodSpecs$getFoodSpecs$specs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? howHigh = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetFoodSpecs$getFoodSpecs$specs(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as double),
        unit: unit == _undefined || unit == null
            ? _instance.unit
            : (unit as String),
        howHigh: howHigh == _undefined || howHigh == null
            ? _instance.howHigh
            : (howHigh as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs$specs<TRes>
    implements CopyWith$Query$GetFoodSpecs$getFoodSpecs$specs<TRes> {
  _CopyWithStubImpl$Query$GetFoodSpecs$getFoodSpecs$specs(this._res);

  TRes _res;

  call({
    String? name,
    double? value,
    String? unit,
    double? howHigh,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetMockFoodSpecs {
  factory Variables$Query$GetMockFoodSpecs({required String food}) =>
      Variables$Query$GetMockFoodSpecs._({
        r'food': food,
      });

  Variables$Query$GetMockFoodSpecs._(this._$data);

  factory Variables$Query$GetMockFoodSpecs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$food = data['food'];
    result$data['food'] = (l$food as String);
    return Variables$Query$GetMockFoodSpecs._(result$data);
  }

  Map<String, dynamic> _$data;

  String get food => (_$data['food'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$food = food;
    result$data['food'] = l$food;
    return result$data;
  }

  CopyWith$Variables$Query$GetMockFoodSpecs<Variables$Query$GetMockFoodSpecs>
      get copyWith => CopyWith$Variables$Query$GetMockFoodSpecs(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetMockFoodSpecs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$food = food;
    final lOther$food = other.food;
    if (l$food != lOther$food) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$food = food;
    return Object.hashAll([l$food]);
  }
}

abstract class CopyWith$Variables$Query$GetMockFoodSpecs<TRes> {
  factory CopyWith$Variables$Query$GetMockFoodSpecs(
    Variables$Query$GetMockFoodSpecs instance,
    TRes Function(Variables$Query$GetMockFoodSpecs) then,
  ) = _CopyWithImpl$Variables$Query$GetMockFoodSpecs;

  factory CopyWith$Variables$Query$GetMockFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMockFoodSpecs;

  TRes call({String? food});
}

class _CopyWithImpl$Variables$Query$GetMockFoodSpecs<TRes>
    implements CopyWith$Variables$Query$GetMockFoodSpecs<TRes> {
  _CopyWithImpl$Variables$Query$GetMockFoodSpecs(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMockFoodSpecs _instance;

  final TRes Function(Variables$Query$GetMockFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? food = _undefined}) =>
      _then(Variables$Query$GetMockFoodSpecs._({
        ..._instance._$data,
        if (food != _undefined && food != null) 'food': (food as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetMockFoodSpecs<TRes>
    implements CopyWith$Variables$Query$GetMockFoodSpecs<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMockFoodSpecs(this._res);

  TRes _res;

  call({String? food}) => _res;
}

class Query$GetMockFoodSpecs {
  Query$GetMockFoodSpecs({
    this.getMockFoodSpecs,
    this.$__typename = 'Query',
  });

  factory Query$GetMockFoodSpecs.fromJson(Map<String, dynamic> json) {
    final l$getMockFoodSpecs = json['getMockFoodSpecs'];
    final l$$__typename = json['__typename'];
    return Query$GetMockFoodSpecs(
      getMockFoodSpecs: l$getMockFoodSpecs == null
          ? null
          : Query$GetMockFoodSpecs$getMockFoodSpecs.fromJson(
              (l$getMockFoodSpecs as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMockFoodSpecs$getMockFoodSpecs? getMockFoodSpecs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMockFoodSpecs = getMockFoodSpecs;
    _resultData['getMockFoodSpecs'] = l$getMockFoodSpecs?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMockFoodSpecs = getMockFoodSpecs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMockFoodSpecs,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMockFoodSpecs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMockFoodSpecs = getMockFoodSpecs;
    final lOther$getMockFoodSpecs = other.getMockFoodSpecs;
    if (l$getMockFoodSpecs != lOther$getMockFoodSpecs) {
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

extension UtilityExtension$Query$GetMockFoodSpecs on Query$GetMockFoodSpecs {
  CopyWith$Query$GetMockFoodSpecs<Query$GetMockFoodSpecs> get copyWith =>
      CopyWith$Query$GetMockFoodSpecs(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMockFoodSpecs<TRes> {
  factory CopyWith$Query$GetMockFoodSpecs(
    Query$GetMockFoodSpecs instance,
    TRes Function(Query$GetMockFoodSpecs) then,
  ) = _CopyWithImpl$Query$GetMockFoodSpecs;

  factory CopyWith$Query$GetMockFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMockFoodSpecs;

  TRes call({
    Query$GetMockFoodSpecs$getMockFoodSpecs? getMockFoodSpecs,
    String? $__typename,
  });
  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> get getMockFoodSpecs;
}

class _CopyWithImpl$Query$GetMockFoodSpecs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs<TRes> {
  _CopyWithImpl$Query$GetMockFoodSpecs(
    this._instance,
    this._then,
  );

  final Query$GetMockFoodSpecs _instance;

  final TRes Function(Query$GetMockFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMockFoodSpecs = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMockFoodSpecs(
        getMockFoodSpecs: getMockFoodSpecs == _undefined
            ? _instance.getMockFoodSpecs
            : (getMockFoodSpecs as Query$GetMockFoodSpecs$getMockFoodSpecs?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> get getMockFoodSpecs {
    final local$getMockFoodSpecs = _instance.getMockFoodSpecs;
    return local$getMockFoodSpecs == null
        ? CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs.stub(
            _then(_instance))
        : CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs(
            local$getMockFoodSpecs, (e) => call(getMockFoodSpecs: e));
  }
}

class _CopyWithStubImpl$Query$GetMockFoodSpecs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs<TRes> {
  _CopyWithStubImpl$Query$GetMockFoodSpecs(this._res);

  TRes _res;

  call({
    Query$GetMockFoodSpecs$getMockFoodSpecs? getMockFoodSpecs,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> get getMockFoodSpecs =>
      CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs.stub(_res);
}

const documentNodeQueryGetMockFoodSpecs = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMockFoodSpecs'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'food')),
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
        name: NameNode(value: 'getMockFoodSpecs'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'food'),
            value: VariableNode(name: NameNode(value: 'food')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'specs'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'name'),
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
                name: NameNode(value: 'howHigh'),
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
            name: NameNode(value: 'howRecommend'),
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
Query$GetMockFoodSpecs _parserFn$Query$GetMockFoodSpecs(
        Map<String, dynamic> data) =>
    Query$GetMockFoodSpecs.fromJson(data);
typedef OnQueryComplete$Query$GetMockFoodSpecs = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMockFoodSpecs?,
);

class Options$Query$GetMockFoodSpecs
    extends graphql.QueryOptions<Query$GetMockFoodSpecs> {
  Options$Query$GetMockFoodSpecs({
    String? operationName,
    required Variables$Query$GetMockFoodSpecs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMockFoodSpecs? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMockFoodSpecs? onComplete,
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
                        : _parserFn$Query$GetMockFoodSpecs(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMockFoodSpecs,
          parserFn: _parserFn$Query$GetMockFoodSpecs,
        );

  final OnQueryComplete$Query$GetMockFoodSpecs? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMockFoodSpecs
    extends graphql.WatchQueryOptions<Query$GetMockFoodSpecs> {
  WatchOptions$Query$GetMockFoodSpecs({
    String? operationName,
    required Variables$Query$GetMockFoodSpecs variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMockFoodSpecs? typedOptimisticResult,
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
          document: documentNodeQueryGetMockFoodSpecs,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMockFoodSpecs,
        );
}

class FetchMoreOptions$Query$GetMockFoodSpecs extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMockFoodSpecs({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMockFoodSpecs variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetMockFoodSpecs,
        );
}

extension ClientExtension$Query$GetMockFoodSpecs on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMockFoodSpecs>> query$GetMockFoodSpecs(
          Options$Query$GetMockFoodSpecs options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetMockFoodSpecs> watchQuery$GetMockFoodSpecs(
          WatchOptions$Query$GetMockFoodSpecs options) =>
      this.watchQuery(options);
  void writeQuery$GetMockFoodSpecs({
    required Query$GetMockFoodSpecs data,
    required Variables$Query$GetMockFoodSpecs variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetMockFoodSpecs),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMockFoodSpecs? readQuery$GetMockFoodSpecs({
    required Variables$Query$GetMockFoodSpecs variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetMockFoodSpecs),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMockFoodSpecs.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMockFoodSpecs>
    useQuery$GetMockFoodSpecs(Options$Query$GetMockFoodSpecs options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMockFoodSpecs> useWatchQuery$GetMockFoodSpecs(
        WatchOptions$Query$GetMockFoodSpecs options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetMockFoodSpecs$Widget
    extends graphql_flutter.Query<Query$GetMockFoodSpecs> {
  Query$GetMockFoodSpecs$Widget({
    widgets.Key? key,
    required Options$Query$GetMockFoodSpecs options,
    required graphql_flutter.QueryBuilder<Query$GetMockFoodSpecs> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetMockFoodSpecs$getMockFoodSpecs {
  Query$GetMockFoodSpecs$getMockFoodSpecs({
    required this.specs,
    required this.howRecommend,
    this.$__typename = 'FoodSpecs',
  });

  factory Query$GetMockFoodSpecs$getMockFoodSpecs.fromJson(
      Map<String, dynamic> json) {
    final l$specs = json['specs'];
    final l$howRecommend = json['howRecommend'];
    final l$$__typename = json['__typename'];
    return Query$GetMockFoodSpecs$getMockFoodSpecs(
      specs: (l$specs as List<dynamic>)
          .map((e) => Query$GetMockFoodSpecs$getMockFoodSpecs$specs.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      howRecommend: (l$howRecommend as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMockFoodSpecs$getMockFoodSpecs$specs> specs;

  final double howRecommend;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$specs = specs;
    _resultData['specs'] = l$specs.map((e) => e.toJson()).toList();
    final l$howRecommend = howRecommend;
    _resultData['howRecommend'] = l$howRecommend;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$specs = specs;
    final l$howRecommend = howRecommend;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$specs.map((v) => v)),
      l$howRecommend,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMockFoodSpecs$getMockFoodSpecs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$specs = specs;
    final lOther$specs = other.specs;
    if (l$specs.length != lOther$specs.length) {
      return false;
    }
    for (int i = 0; i < l$specs.length; i++) {
      final l$specs$entry = l$specs[i];
      final lOther$specs$entry = lOther$specs[i];
      if (l$specs$entry != lOther$specs$entry) {
        return false;
      }
    }
    final l$howRecommend = howRecommend;
    final lOther$howRecommend = other.howRecommend;
    if (l$howRecommend != lOther$howRecommend) {
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

extension UtilityExtension$Query$GetMockFoodSpecs$getMockFoodSpecs
    on Query$GetMockFoodSpecs$getMockFoodSpecs {
  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<
          Query$GetMockFoodSpecs$getMockFoodSpecs>
      get copyWith => CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> {
  factory CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs(
    Query$GetMockFoodSpecs$getMockFoodSpecs instance,
    TRes Function(Query$GetMockFoodSpecs$getMockFoodSpecs) then,
  ) = _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs;

  factory CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs;

  TRes call({
    List<Query$GetMockFoodSpecs$getMockFoodSpecs$specs>? specs,
    double? howRecommend,
    String? $__typename,
  });
  TRes specs(
      Iterable<Query$GetMockFoodSpecs$getMockFoodSpecs$specs> Function(
              Iterable<
                  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<
                      Query$GetMockFoodSpecs$getMockFoodSpecs$specs>>)
          _fn);
}

class _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> {
  _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs(
    this._instance,
    this._then,
  );

  final Query$GetMockFoodSpecs$getMockFoodSpecs _instance;

  final TRes Function(Query$GetMockFoodSpecs$getMockFoodSpecs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? specs = _undefined,
    Object? howRecommend = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMockFoodSpecs$getMockFoodSpecs(
        specs: specs == _undefined || specs == null
            ? _instance.specs
            : (specs as List<Query$GetMockFoodSpecs$getMockFoodSpecs$specs>),
        howRecommend: howRecommend == _undefined || howRecommend == null
            ? _instance.howRecommend
            : (howRecommend as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes specs(
          Iterable<Query$GetMockFoodSpecs$getMockFoodSpecs$specs> Function(
                  Iterable<
                      CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<
                          Query$GetMockFoodSpecs$getMockFoodSpecs$specs>>)
              _fn) =>
      call(
          specs: _fn(_instance.specs.map(
              (e) => CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs<TRes> {
  _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs(this._res);

  TRes _res;

  call({
    List<Query$GetMockFoodSpecs$getMockFoodSpecs$specs>? specs,
    double? howRecommend,
    String? $__typename,
  }) =>
      _res;

  specs(_fn) => _res;
}

class Query$GetMockFoodSpecs$getMockFoodSpecs$specs {
  Query$GetMockFoodSpecs$getMockFoodSpecs$specs({
    required this.name,
    required this.value,
    required this.unit,
    required this.howHigh,
    this.$__typename = 'FoodSpec',
  });

  factory Query$GetMockFoodSpecs$getMockFoodSpecs$specs.fromJson(
      Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$value = json['value'];
    final l$unit = json['unit'];
    final l$howHigh = json['howHigh'];
    final l$$__typename = json['__typename'];
    return Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
      name: (l$name as String),
      value: (l$value as num).toDouble(),
      unit: (l$unit as String),
      howHigh: (l$howHigh as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final double value;

  final String unit;

  final double howHigh;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$value = value;
    _resultData['value'] = l$value;
    final l$unit = unit;
    _resultData['unit'] = l$unit;
    final l$howHigh = howHigh;
    _resultData['howHigh'] = l$howHigh;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$value = value;
    final l$unit = unit;
    final l$howHigh = howHigh;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$value,
      l$unit,
      l$howHigh,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMockFoodSpecs$getMockFoodSpecs$specs) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
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
    final l$howHigh = howHigh;
    final lOther$howHigh = other.howHigh;
    if (l$howHigh != lOther$howHigh) {
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

extension UtilityExtension$Query$GetMockFoodSpecs$getMockFoodSpecs$specs
    on Query$GetMockFoodSpecs$getMockFoodSpecs$specs {
  CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<
          Query$GetMockFoodSpecs$getMockFoodSpecs$specs>
      get copyWith => CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<TRes> {
  factory CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
    Query$GetMockFoodSpecs$getMockFoodSpecs$specs instance,
    TRes Function(Query$GetMockFoodSpecs$getMockFoodSpecs$specs) then,
  ) = _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs;

  factory CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs;

  TRes call({
    String? name,
    double? value,
    String? unit,
    double? howHigh,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<TRes> {
  _CopyWithImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
    this._instance,
    this._then,
  );

  final Query$GetMockFoodSpecs$getMockFoodSpecs$specs _instance;

  final TRes Function(Query$GetMockFoodSpecs$getMockFoodSpecs$specs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? value = _undefined,
    Object? unit = _undefined,
    Object? howHigh = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMockFoodSpecs$getMockFoodSpecs$specs(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        value: value == _undefined || value == null
            ? _instance.value
            : (value as double),
        unit: unit == _undefined || unit == null
            ? _instance.unit
            : (unit as String),
        howHigh: howHigh == _undefined || howHigh == null
            ? _instance.howHigh
            : (howHigh as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<TRes>
    implements CopyWith$Query$GetMockFoodSpecs$getMockFoodSpecs$specs<TRes> {
  _CopyWithStubImpl$Query$GetMockFoodSpecs$getMockFoodSpecs$specs(this._res);

  TRes _res;

  call({
    String? name,
    double? value,
    String? unit,
    double? howHigh,
    String? $__typename,
  }) =>
      _res;
}
