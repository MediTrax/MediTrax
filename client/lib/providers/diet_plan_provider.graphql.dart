import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Query$GetHealthRiskAssessment {
  Query$GetHealthRiskAssessment({
    this.getHealthRiskAssessment,
    this.$__typename = 'Query',
  });

  factory Query$GetHealthRiskAssessment.fromJson(Map<String, dynamic> json) {
    final l$getHealthRiskAssessment = json['getHealthRiskAssessment'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessment(
      getHealthRiskAssessment: l$getHealthRiskAssessment == null
          ? null
          : Query$GetHealthRiskAssessment$getHealthRiskAssessment.fromJson(
              (l$getHealthRiskAssessment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetHealthRiskAssessment$getHealthRiskAssessment?
      getHealthRiskAssessment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    _resultData['getHealthRiskAssessment'] =
        l$getHealthRiskAssessment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getHealthRiskAssessment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    final lOther$getHealthRiskAssessment = other.getHealthRiskAssessment;
    if (l$getHealthRiskAssessment != lOther$getHealthRiskAssessment) {
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

extension UtilityExtension$Query$GetHealthRiskAssessment
    on Query$GetHealthRiskAssessment {
  CopyWith$Query$GetHealthRiskAssessment<Query$GetHealthRiskAssessment>
      get copyWith => CopyWith$Query$GetHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessment<TRes> {
  factory CopyWith$Query$GetHealthRiskAssessment(
    Query$GetHealthRiskAssessment instance,
    TRes Function(Query$GetHealthRiskAssessment) then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessment;

  factory CopyWith$Query$GetHealthRiskAssessment.stub(TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessment;

  TRes call({
    Query$GetHealthRiskAssessment$getHealthRiskAssessment?
        getHealthRiskAssessment,
    String? $__typename,
  });
  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes>
      get getHealthRiskAssessment;
}

class _CopyWithImpl$Query$GetHealthRiskAssessment<TRes>
    implements CopyWith$Query$GetHealthRiskAssessment<TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessment _instance;

  final TRes Function(Query$GetHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getHealthRiskAssessment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetHealthRiskAssessment(
        getHealthRiskAssessment: getHealthRiskAssessment == _undefined
            ? _instance.getHealthRiskAssessment
            : (getHealthRiskAssessment
                as Query$GetHealthRiskAssessment$getHealthRiskAssessment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes>
      get getHealthRiskAssessment {
    final local$getHealthRiskAssessment = _instance.getHealthRiskAssessment;
    return local$getHealthRiskAssessment == null
        ? CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment.stub(
            _then(_instance))
        : CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
            local$getHealthRiskAssessment,
            (e) => call(getHealthRiskAssessment: e));
  }
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessment<TRes>
    implements CopyWith$Query$GetHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessment(this._res);

  TRes _res;

  call({
    Query$GetHealthRiskAssessment$getHealthRiskAssessment?
        getHealthRiskAssessment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes>
      get getHealthRiskAssessment =>
          CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment.stub(
              _res);
}

const documentNodeQueryGetHealthRiskAssessment = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetHealthRiskAssessment'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getHealthRiskAssessment'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'assessmentId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'questionnaireData'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'riskLevel'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recommendations'),
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
Query$GetHealthRiskAssessment _parserFn$Query$GetHealthRiskAssessment(
        Map<String, dynamic> data) =>
    Query$GetHealthRiskAssessment.fromJson(data);
typedef OnQueryComplete$Query$GetHealthRiskAssessment = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetHealthRiskAssessment?,
);

class Options$Query$GetHealthRiskAssessment
    extends graphql.QueryOptions<Query$GetHealthRiskAssessment> {
  Options$Query$GetHealthRiskAssessment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthRiskAssessment? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetHealthRiskAssessment? onComplete,
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
                        : _parserFn$Query$GetHealthRiskAssessment(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetHealthRiskAssessment,
          parserFn: _parserFn$Query$GetHealthRiskAssessment,
        );

  final OnQueryComplete$Query$GetHealthRiskAssessment? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetHealthRiskAssessment
    extends graphql.WatchQueryOptions<Query$GetHealthRiskAssessment> {
  WatchOptions$Query$GetHealthRiskAssessment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthRiskAssessment? typedOptimisticResult,
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
          document: documentNodeQueryGetHealthRiskAssessment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetHealthRiskAssessment,
        );
}

class FetchMoreOptions$Query$GetHealthRiskAssessment
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetHealthRiskAssessment(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetHealthRiskAssessment,
        );
}

extension ClientExtension$Query$GetHealthRiskAssessment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetHealthRiskAssessment>>
      query$GetHealthRiskAssessment(
              [Options$Query$GetHealthRiskAssessment? options]) async =>
          await this.query(options ?? Options$Query$GetHealthRiskAssessment());
  graphql.ObservableQuery<
      Query$GetHealthRiskAssessment> watchQuery$GetHealthRiskAssessment(
          [WatchOptions$Query$GetHealthRiskAssessment? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetHealthRiskAssessment());
  void writeQuery$GetHealthRiskAssessment({
    required Query$GetHealthRiskAssessment data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetHealthRiskAssessment)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetHealthRiskAssessment? readQuery$GetHealthRiskAssessment(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetHealthRiskAssessment)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetHealthRiskAssessment.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetHealthRiskAssessment>
    useQuery$GetHealthRiskAssessment(
            [Options$Query$GetHealthRiskAssessment? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetHealthRiskAssessment());
graphql.ObservableQuery<Query$GetHealthRiskAssessment>
    useWatchQuery$GetHealthRiskAssessment(
            [WatchOptions$Query$GetHealthRiskAssessment? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$GetHealthRiskAssessment());

class Query$GetHealthRiskAssessment$Widget
    extends graphql_flutter.Query<Query$GetHealthRiskAssessment> {
  Query$GetHealthRiskAssessment$Widget({
    widgets.Key? key,
    Options$Query$GetHealthRiskAssessment? options,
    required graphql_flutter.QueryBuilder<Query$GetHealthRiskAssessment>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetHealthRiskAssessment(),
          builder: builder,
        );
}

class Query$GetHealthRiskAssessment$getHealthRiskAssessment {
  Query$GetHealthRiskAssessment$getHealthRiskAssessment({
    required this.assessmentId,
    required this.questionnaireData,
    required this.riskLevel,
    required this.recommendations,
    required this.createdAt,
    this.$__typename = 'HealthRiskAssessmentDetailResponse',
  });

  factory Query$GetHealthRiskAssessment$getHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$assessmentId = json['assessmentId'];
    final l$questionnaireData = json['questionnaireData'];
    final l$riskLevel = json['riskLevel'];
    final l$recommendations = json['recommendations'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessment$getHealthRiskAssessment(
      assessmentId: (l$assessmentId as String),
      questionnaireData: (l$questionnaireData as String),
      riskLevel: (l$riskLevel as String),
      recommendations: (l$recommendations as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String assessmentId;

  final String questionnaireData;

  final String riskLevel;

  final String recommendations;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$assessmentId = assessmentId;
    _resultData['assessmentId'] = l$assessmentId;
    final l$questionnaireData = questionnaireData;
    _resultData['questionnaireData'] = l$questionnaireData;
    final l$riskLevel = riskLevel;
    _resultData['riskLevel'] = l$riskLevel;
    final l$recommendations = recommendations;
    _resultData['recommendations'] = l$recommendations;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$assessmentId = assessmentId;
    final l$questionnaireData = questionnaireData;
    final l$riskLevel = riskLevel;
    final l$recommendations = recommendations;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$assessmentId,
      l$questionnaireData,
      l$riskLevel,
      l$recommendations,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetHealthRiskAssessment$getHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$assessmentId = assessmentId;
    final lOther$assessmentId = other.assessmentId;
    if (l$assessmentId != lOther$assessmentId) {
      return false;
    }
    final l$questionnaireData = questionnaireData;
    final lOther$questionnaireData = other.questionnaireData;
    if (l$questionnaireData != lOther$questionnaireData) {
      return false;
    }
    final l$riskLevel = riskLevel;
    final lOther$riskLevel = other.riskLevel;
    if (l$riskLevel != lOther$riskLevel) {
      return false;
    }
    final l$recommendations = recommendations;
    final lOther$recommendations = other.recommendations;
    if (l$recommendations != lOther$recommendations) {
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

extension UtilityExtension$Query$GetHealthRiskAssessment$getHealthRiskAssessment
    on Query$GetHealthRiskAssessment$getHealthRiskAssessment {
  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<
          Query$GetHealthRiskAssessment$getHealthRiskAssessment>
      get copyWith =>
          CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<
    TRes> {
  factory CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
    Query$GetHealthRiskAssessment$getHealthRiskAssessment instance,
    TRes Function(Query$GetHealthRiskAssessment$getHealthRiskAssessment) then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment;

  factory CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment;

  TRes call({
    String? assessmentId,
    String? questionnaireData,
    String? riskLevel,
    String? recommendations,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessment$getHealthRiskAssessment _instance;

  final TRes Function(Query$GetHealthRiskAssessment$getHealthRiskAssessment)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assessmentId = _undefined,
    Object? questionnaireData = _undefined,
    Object? riskLevel = _undefined,
    Object? recommendations = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetHealthRiskAssessment$getHealthRiskAssessment(
        assessmentId: assessmentId == _undefined || assessmentId == null
            ? _instance.assessmentId
            : (assessmentId as String),
        questionnaireData:
            questionnaireData == _undefined || questionnaireData == null
                ? _instance.questionnaireData
                : (questionnaireData as String),
        riskLevel: riskLevel == _undefined || riskLevel == null
            ? _instance.riskLevel
            : (riskLevel as String),
        recommendations:
            recommendations == _undefined || recommendations == null
                ? _instance.recommendations
                : (recommendations as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
      this._res);

  TRes _res;

  call({
    String? assessmentId,
    String? questionnaireData,
    String? riskLevel,
    String? recommendations,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateHealthRiskAssessment {
  factory Variables$Mutation$CreateHealthRiskAssessment(
          {required String questionnaireData}) =>
      Variables$Mutation$CreateHealthRiskAssessment._({
        r'questionnaireData': questionnaireData,
      });

  Variables$Mutation$CreateHealthRiskAssessment._(this._$data);

  factory Variables$Mutation$CreateHealthRiskAssessment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$questionnaireData = data['questionnaireData'];
    result$data['questionnaireData'] = (l$questionnaireData as String);
    return Variables$Mutation$CreateHealthRiskAssessment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get questionnaireData => (_$data['questionnaireData'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$questionnaireData = questionnaireData;
    result$data['questionnaireData'] = l$questionnaireData;
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateHealthRiskAssessment<
          Variables$Mutation$CreateHealthRiskAssessment>
      get copyWith => CopyWith$Variables$Mutation$CreateHealthRiskAssessment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionnaireData = questionnaireData;
    final lOther$questionnaireData = other.questionnaireData;
    if (l$questionnaireData != lOther$questionnaireData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$questionnaireData = questionnaireData;
    return Object.hashAll([l$questionnaireData]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateHealthRiskAssessment<TRes> {
  factory CopyWith$Variables$Mutation$CreateHealthRiskAssessment(
    Variables$Mutation$CreateHealthRiskAssessment instance,
    TRes Function(Variables$Mutation$CreateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateHealthRiskAssessment;

  factory CopyWith$Variables$Mutation$CreateHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateHealthRiskAssessment;

  TRes call({String? questionnaireData});
}

class _CopyWithImpl$Variables$Mutation$CreateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$CreateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateHealthRiskAssessment _instance;

  final TRes Function(Variables$Mutation$CreateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? questionnaireData = _undefined}) =>
      _then(Variables$Mutation$CreateHealthRiskAssessment._({
        ..._instance._$data,
        if (questionnaireData != _undefined && questionnaireData != null)
          'questionnaireData': (questionnaireData as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$CreateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateHealthRiskAssessment(this._res);

  TRes _res;

  call({String? questionnaireData}) => _res;
}

class Mutation$CreateHealthRiskAssessment {
  Mutation$CreateHealthRiskAssessment({
    this.createHealthRiskAssessment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$createHealthRiskAssessment = json['createHealthRiskAssessment'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateHealthRiskAssessment(
      createHealthRiskAssessment: l$createHealthRiskAssessment == null
          ? null
          : Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment
              .fromJson((l$createHealthRiskAssessment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment?
      createHealthRiskAssessment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createHealthRiskAssessment = createHealthRiskAssessment;
    _resultData['createHealthRiskAssessment'] =
        l$createHealthRiskAssessment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createHealthRiskAssessment = createHealthRiskAssessment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createHealthRiskAssessment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createHealthRiskAssessment = createHealthRiskAssessment;
    final lOther$createHealthRiskAssessment = other.createHealthRiskAssessment;
    if (l$createHealthRiskAssessment != lOther$createHealthRiskAssessment) {
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

extension UtilityExtension$Mutation$CreateHealthRiskAssessment
    on Mutation$CreateHealthRiskAssessment {
  CopyWith$Mutation$CreateHealthRiskAssessment<
          Mutation$CreateHealthRiskAssessment>
      get copyWith => CopyWith$Mutation$CreateHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateHealthRiskAssessment<TRes> {
  factory CopyWith$Mutation$CreateHealthRiskAssessment(
    Mutation$CreateHealthRiskAssessment instance,
    TRes Function(Mutation$CreateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Mutation$CreateHealthRiskAssessment;

  factory CopyWith$Mutation$CreateHealthRiskAssessment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment;

  TRes call({
    Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment?
        createHealthRiskAssessment,
    String? $__typename,
  });
  CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<TRes>
      get createHealthRiskAssessment;
}

class _CopyWithImpl$Mutation$CreateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$CreateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Mutation$CreateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$CreateHealthRiskAssessment _instance;

  final TRes Function(Mutation$CreateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createHealthRiskAssessment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateHealthRiskAssessment(
        createHealthRiskAssessment: createHealthRiskAssessment == _undefined
            ? _instance.createHealthRiskAssessment
            : (createHealthRiskAssessment
                as Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<TRes>
      get createHealthRiskAssessment {
    final local$createHealthRiskAssessment =
        _instance.createHealthRiskAssessment;
    return local$createHealthRiskAssessment == null
        ? CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment
            .stub(_then(_instance))
        : CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
            local$createHealthRiskAssessment,
            (e) => call(createHealthRiskAssessment: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$CreateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment(this._res);

  TRes _res;

  call({
    Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment?
        createHealthRiskAssessment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<TRes>
      get createHealthRiskAssessment =>
          CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment
              .stub(_res);
}

const documentNodeMutationCreateHealthRiskAssessment =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateHealthRiskAssessment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'questionnaireData')),
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
        name: NameNode(value: 'createHealthRiskAssessment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'questionnaireData'),
            value: VariableNode(name: NameNode(value: 'questionnaireData')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'assessmentId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'riskLevel'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recommendations'),
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
Mutation$CreateHealthRiskAssessment
    _parserFn$Mutation$CreateHealthRiskAssessment(Map<String, dynamic> data) =>
        Mutation$CreateHealthRiskAssessment.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateHealthRiskAssessment = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateHealthRiskAssessment?,
);

class Options$Mutation$CreateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$CreateHealthRiskAssessment> {
  Options$Mutation$CreateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$CreateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$CreateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$CreateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$CreateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateHealthRiskAssessment
    extends graphql.WatchQueryOptions<Mutation$CreateHealthRiskAssessment> {
  WatchOptions$Mutation$CreateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$CreateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateHealthRiskAssessment? typedOptimisticResult,
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
          document: documentNodeMutationCreateHealthRiskAssessment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateHealthRiskAssessment,
        );
}

extension ClientExtension$Mutation$CreateHealthRiskAssessment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateHealthRiskAssessment>>
      mutate$CreateHealthRiskAssessment(
              Options$Mutation$CreateHealthRiskAssessment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateHealthRiskAssessment>
      watchMutation$CreateHealthRiskAssessment(
              WatchOptions$Mutation$CreateHealthRiskAssessment options) =>
          this.watchMutation(options);
}

class Mutation$CreateHealthRiskAssessment$HookResult {
  Mutation$CreateHealthRiskAssessment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateHealthRiskAssessment runMutation;

  final graphql.QueryResult<Mutation$CreateHealthRiskAssessment> result;
}

Mutation$CreateHealthRiskAssessment$HookResult
    useMutation$CreateHealthRiskAssessment(
        [WidgetOptions$Mutation$CreateHealthRiskAssessment? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$CreateHealthRiskAssessment());
  return Mutation$CreateHealthRiskAssessment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateHealthRiskAssessment>
    useWatchMutation$CreateHealthRiskAssessment(
            WatchOptions$Mutation$CreateHealthRiskAssessment options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$CreateHealthRiskAssessment> {
  WidgetOptions$Mutation$CreateHealthRiskAssessment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$CreateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$CreateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$CreateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateHealthRiskAssessment
    = graphql.MultiSourceResult<Mutation$CreateHealthRiskAssessment> Function(
  Variables$Mutation$CreateHealthRiskAssessment, {
  Object? optimisticResult,
  Mutation$CreateHealthRiskAssessment? typedOptimisticResult,
});
typedef Builder$Mutation$CreateHealthRiskAssessment = widgets.Widget Function(
  RunMutation$Mutation$CreateHealthRiskAssessment,
  graphql.QueryResult<Mutation$CreateHealthRiskAssessment>?,
);

class Mutation$CreateHealthRiskAssessment$Widget
    extends graphql_flutter.Mutation<Mutation$CreateHealthRiskAssessment> {
  Mutation$CreateHealthRiskAssessment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateHealthRiskAssessment? options,
    required Builder$Mutation$CreateHealthRiskAssessment builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$CreateHealthRiskAssessment(),
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

class Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment {
  Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment({
    required this.assessmentId,
    required this.riskLevel,
    required this.recommendations,
    this.$__typename = 'HealthRiskAssessmentResponse',
  });

  factory Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$assessmentId = json['assessmentId'];
    final l$riskLevel = json['riskLevel'];
    final l$recommendations = json['recommendations'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
      assessmentId: (l$assessmentId as String),
      riskLevel: (l$riskLevel as String),
      recommendations: (l$recommendations as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String assessmentId;

  final String riskLevel;

  final String recommendations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$assessmentId = assessmentId;
    _resultData['assessmentId'] = l$assessmentId;
    final l$riskLevel = riskLevel;
    _resultData['riskLevel'] = l$riskLevel;
    final l$recommendations = recommendations;
    _resultData['recommendations'] = l$recommendations;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$assessmentId = assessmentId;
    final l$riskLevel = riskLevel;
    final l$recommendations = recommendations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$assessmentId,
      l$riskLevel,
      l$recommendations,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$assessmentId = assessmentId;
    final lOther$assessmentId = other.assessmentId;
    if (l$assessmentId != lOther$assessmentId) {
      return false;
    }
    final l$riskLevel = riskLevel;
    final lOther$riskLevel = other.riskLevel;
    if (l$riskLevel != lOther$riskLevel) {
      return false;
    }
    final l$recommendations = recommendations;
    final lOther$recommendations = other.recommendations;
    if (l$recommendations != lOther$recommendations) {
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

extension UtilityExtension$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment
    on Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment {
  CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
          Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment>
      get copyWith =>
          CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
    TRes> {
  factory CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
    Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment instance,
    TRes Function(
            Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment)
        then,
  ) = _CopyWithImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment;

  factory CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment;

  TRes call({
    String? assessmentId,
    String? riskLevel,
    String? recommendations,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
            TRes> {
  _CopyWithImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment
      _instance;

  final TRes Function(
      Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assessmentId = _undefined,
    Object? riskLevel = _undefined,
    Object? recommendations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
        assessmentId: assessmentId == _undefined || assessmentId == null
            ? _instance.assessmentId
            : (assessmentId as String),
        riskLevel: riskLevel == _undefined || riskLevel == null
            ? _instance.riskLevel
            : (riskLevel as String),
        recommendations:
            recommendations == _undefined || recommendations == null
                ? _instance.recommendations
                : (recommendations as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateHealthRiskAssessment$createHealthRiskAssessment(
      this._res);

  TRes _res;

  call({
    String? assessmentId,
    String? riskLevel,
    String? recommendations,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateHealthRiskAssessment {
  factory Variables$Mutation$UpdateHealthRiskAssessment({
    required String assessmentId,
    required String questionnaireData,
  }) =>
      Variables$Mutation$UpdateHealthRiskAssessment._({
        r'assessmentId': assessmentId,
        r'questionnaireData': questionnaireData,
      });

  Variables$Mutation$UpdateHealthRiskAssessment._(this._$data);

  factory Variables$Mutation$UpdateHealthRiskAssessment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$assessmentId = data['assessmentId'];
    result$data['assessmentId'] = (l$assessmentId as String);
    final l$questionnaireData = data['questionnaireData'];
    result$data['questionnaireData'] = (l$questionnaireData as String);
    return Variables$Mutation$UpdateHealthRiskAssessment._(result$data);
  }

  Map<String, dynamic> _$data;

  String get assessmentId => (_$data['assessmentId'] as String);

  String get questionnaireData => (_$data['questionnaireData'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$assessmentId = assessmentId;
    result$data['assessmentId'] = l$assessmentId;
    final l$questionnaireData = questionnaireData;
    result$data['questionnaireData'] = l$questionnaireData;
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateHealthRiskAssessment<
          Variables$Mutation$UpdateHealthRiskAssessment>
      get copyWith => CopyWith$Variables$Mutation$UpdateHealthRiskAssessment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$assessmentId = assessmentId;
    final lOther$assessmentId = other.assessmentId;
    if (l$assessmentId != lOther$assessmentId) {
      return false;
    }
    final l$questionnaireData = questionnaireData;
    final lOther$questionnaireData = other.questionnaireData;
    if (l$questionnaireData != lOther$questionnaireData) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$assessmentId = assessmentId;
    final l$questionnaireData = questionnaireData;
    return Object.hashAll([
      l$assessmentId,
      l$questionnaireData,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateHealthRiskAssessment<TRes> {
  factory CopyWith$Variables$Mutation$UpdateHealthRiskAssessment(
    Variables$Mutation$UpdateHealthRiskAssessment instance,
    TRes Function(Variables$Mutation$UpdateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateHealthRiskAssessment;

  factory CopyWith$Variables$Mutation$UpdateHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateHealthRiskAssessment;

  TRes call({
    String? assessmentId,
    String? questionnaireData,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$UpdateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateHealthRiskAssessment _instance;

  final TRes Function(Variables$Mutation$UpdateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assessmentId = _undefined,
    Object? questionnaireData = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateHealthRiskAssessment._({
        ..._instance._$data,
        if (assessmentId != _undefined && assessmentId != null)
          'assessmentId': (assessmentId as String),
        if (questionnaireData != _undefined && questionnaireData != null)
          'questionnaireData': (questionnaireData as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$UpdateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateHealthRiskAssessment(this._res);

  TRes _res;

  call({
    String? assessmentId,
    String? questionnaireData,
  }) =>
      _res;
}

class Mutation$UpdateHealthRiskAssessment {
  Mutation$UpdateHealthRiskAssessment({
    this.updateHealthRiskAssessment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$updateHealthRiskAssessment = json['updateHealthRiskAssessment'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateHealthRiskAssessment(
      updateHealthRiskAssessment: l$updateHealthRiskAssessment == null
          ? null
          : Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment
              .fromJson((l$updateHealthRiskAssessment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment?
      updateHealthRiskAssessment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateHealthRiskAssessment = updateHealthRiskAssessment;
    _resultData['updateHealthRiskAssessment'] =
        l$updateHealthRiskAssessment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateHealthRiskAssessment = updateHealthRiskAssessment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateHealthRiskAssessment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateHealthRiskAssessment = updateHealthRiskAssessment;
    final lOther$updateHealthRiskAssessment = other.updateHealthRiskAssessment;
    if (l$updateHealthRiskAssessment != lOther$updateHealthRiskAssessment) {
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

extension UtilityExtension$Mutation$UpdateHealthRiskAssessment
    on Mutation$UpdateHealthRiskAssessment {
  CopyWith$Mutation$UpdateHealthRiskAssessment<
          Mutation$UpdateHealthRiskAssessment>
      get copyWith => CopyWith$Mutation$UpdateHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateHealthRiskAssessment<TRes> {
  factory CopyWith$Mutation$UpdateHealthRiskAssessment(
    Mutation$UpdateHealthRiskAssessment instance,
    TRes Function(Mutation$UpdateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Mutation$UpdateHealthRiskAssessment;

  factory CopyWith$Mutation$UpdateHealthRiskAssessment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment;

  TRes call({
    Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment?
        updateHealthRiskAssessment,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<TRes>
      get updateHealthRiskAssessment;
}

class _CopyWithImpl$Mutation$UpdateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$UpdateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Mutation$UpdateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$UpdateHealthRiskAssessment _instance;

  final TRes Function(Mutation$UpdateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateHealthRiskAssessment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateHealthRiskAssessment(
        updateHealthRiskAssessment: updateHealthRiskAssessment == _undefined
            ? _instance.updateHealthRiskAssessment
            : (updateHealthRiskAssessment
                as Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<TRes>
      get updateHealthRiskAssessment {
    final local$updateHealthRiskAssessment =
        _instance.updateHealthRiskAssessment;
    return local$updateHealthRiskAssessment == null
        ? CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment
            .stub(_then(_instance))
        : CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
            local$updateHealthRiskAssessment,
            (e) => call(updateHealthRiskAssessment: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$UpdateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment(this._res);

  TRes _res;

  call({
    Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment?
        updateHealthRiskAssessment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<TRes>
      get updateHealthRiskAssessment =>
          CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment
              .stub(_res);
}

const documentNodeMutationUpdateHealthRiskAssessment =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateHealthRiskAssessment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'assessmentId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'questionnaireData')),
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
        name: NameNode(value: 'updateHealthRiskAssessment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'assessmentId'),
            value: VariableNode(name: NameNode(value: 'assessmentId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'questionnaireData'),
            value: VariableNode(name: NameNode(value: 'questionnaireData')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'assessmentId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'riskLevel'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recommendations'),
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
Mutation$UpdateHealthRiskAssessment
    _parserFn$Mutation$UpdateHealthRiskAssessment(Map<String, dynamic> data) =>
        Mutation$UpdateHealthRiskAssessment.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateHealthRiskAssessment = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateHealthRiskAssessment?,
);

class Options$Mutation$UpdateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$UpdateHealthRiskAssessment> {
  Options$Mutation$UpdateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$UpdateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$UpdateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$UpdateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$UpdateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateHealthRiskAssessment
    extends graphql.WatchQueryOptions<Mutation$UpdateHealthRiskAssessment> {
  WatchOptions$Mutation$UpdateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$UpdateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthRiskAssessment? typedOptimisticResult,
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
          document: documentNodeMutationUpdateHealthRiskAssessment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateHealthRiskAssessment,
        );
}

extension ClientExtension$Mutation$UpdateHealthRiskAssessment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateHealthRiskAssessment>>
      mutate$UpdateHealthRiskAssessment(
              Options$Mutation$UpdateHealthRiskAssessment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateHealthRiskAssessment>
      watchMutation$UpdateHealthRiskAssessment(
              WatchOptions$Mutation$UpdateHealthRiskAssessment options) =>
          this.watchMutation(options);
}

class Mutation$UpdateHealthRiskAssessment$HookResult {
  Mutation$UpdateHealthRiskAssessment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateHealthRiskAssessment runMutation;

  final graphql.QueryResult<Mutation$UpdateHealthRiskAssessment> result;
}

Mutation$UpdateHealthRiskAssessment$HookResult
    useMutation$UpdateHealthRiskAssessment(
        [WidgetOptions$Mutation$UpdateHealthRiskAssessment? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$UpdateHealthRiskAssessment());
  return Mutation$UpdateHealthRiskAssessment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateHealthRiskAssessment>
    useWatchMutation$UpdateHealthRiskAssessment(
            WatchOptions$Mutation$UpdateHealthRiskAssessment options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$UpdateHealthRiskAssessment> {
  WidgetOptions$Mutation$UpdateHealthRiskAssessment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$UpdateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$UpdateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$UpdateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateHealthRiskAssessment
    = graphql.MultiSourceResult<Mutation$UpdateHealthRiskAssessment> Function(
  Variables$Mutation$UpdateHealthRiskAssessment, {
  Object? optimisticResult,
  Mutation$UpdateHealthRiskAssessment? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateHealthRiskAssessment = widgets.Widget Function(
  RunMutation$Mutation$UpdateHealthRiskAssessment,
  graphql.QueryResult<Mutation$UpdateHealthRiskAssessment>?,
);

class Mutation$UpdateHealthRiskAssessment$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateHealthRiskAssessment> {
  Mutation$UpdateHealthRiskAssessment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateHealthRiskAssessment? options,
    required Builder$Mutation$UpdateHealthRiskAssessment builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$UpdateHealthRiskAssessment(),
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

class Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment {
  Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment({
    required this.assessmentId,
    required this.riskLevel,
    required this.recommendations,
    this.$__typename = 'UpdateHealthRiskAssessmentResponse',
  });

  factory Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$assessmentId = json['assessmentId'];
    final l$riskLevel = json['riskLevel'];
    final l$recommendations = json['recommendations'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
      assessmentId: (l$assessmentId as String),
      riskLevel: (l$riskLevel as String),
      recommendations: (l$recommendations as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String assessmentId;

  final String riskLevel;

  final String recommendations;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$assessmentId = assessmentId;
    _resultData['assessmentId'] = l$assessmentId;
    final l$riskLevel = riskLevel;
    _resultData['riskLevel'] = l$riskLevel;
    final l$recommendations = recommendations;
    _resultData['recommendations'] = l$recommendations;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$assessmentId = assessmentId;
    final l$riskLevel = riskLevel;
    final l$recommendations = recommendations;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$assessmentId,
      l$riskLevel,
      l$recommendations,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$assessmentId = assessmentId;
    final lOther$assessmentId = other.assessmentId;
    if (l$assessmentId != lOther$assessmentId) {
      return false;
    }
    final l$riskLevel = riskLevel;
    final lOther$riskLevel = other.riskLevel;
    if (l$riskLevel != lOther$riskLevel) {
      return false;
    }
    final l$recommendations = recommendations;
    final lOther$recommendations = other.recommendations;
    if (l$recommendations != lOther$recommendations) {
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

extension UtilityExtension$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment
    on Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment {
  CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
          Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment>
      get copyWith =>
          CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
    TRes> {
  factory CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
    Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment instance,
    TRes Function(
            Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment)
        then,
  ) = _CopyWithImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment;

  factory CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment;

  TRes call({
    String? assessmentId,
    String? riskLevel,
    String? recommendations,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
            TRes> {
  _CopyWithImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment
      _instance;

  final TRes Function(
      Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assessmentId = _undefined,
    Object? riskLevel = _undefined,
    Object? recommendations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
        assessmentId: assessmentId == _undefined || assessmentId == null
            ? _instance.assessmentId
            : (assessmentId as String),
        riskLevel: riskLevel == _undefined || riskLevel == null
            ? _instance.riskLevel
            : (riskLevel as String),
        recommendations:
            recommendations == _undefined || recommendations == null
                ? _instance.recommendations
                : (recommendations as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment<
            TRes> {
  _CopyWithStubImpl$Mutation$UpdateHealthRiskAssessment$updateHealthRiskAssessment(
      this._res);

  TRes _res;

  call({
    String? assessmentId,
    String? riskLevel,
    String? recommendations,
    String? $__typename,
  }) =>
      _res;
}
