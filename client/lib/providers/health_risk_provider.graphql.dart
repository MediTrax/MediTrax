import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';
import 'schemas/assessment.graphqls.dart';

class Query$GetHealthRiskAssessment {
  Query$GetHealthRiskAssessment({
    this.getHealthRiskAssessment,
    this.$__typename = 'Query',
  });

  factory Query$GetHealthRiskAssessment.fromJson(Map<String, dynamic> json) {
    final l$getHealthRiskAssessment = json['getHealthRiskAssessment'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessment(
      getHealthRiskAssessment: (l$getHealthRiskAssessment as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetHealthRiskAssessment$getHealthRiskAssessment.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>?
      getHealthRiskAssessment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    _resultData['getHealthRiskAssessment'] =
        l$getHealthRiskAssessment?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getHealthRiskAssessment == null
          ? null
          : Object.hashAll(l$getHealthRiskAssessment.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetHealthRiskAssessment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getHealthRiskAssessment = getHealthRiskAssessment;
    final lOther$getHealthRiskAssessment = other.getHealthRiskAssessment;
    if (l$getHealthRiskAssessment != null &&
        lOther$getHealthRiskAssessment != null) {
      if (l$getHealthRiskAssessment.length !=
          lOther$getHealthRiskAssessment.length) {
        return false;
      }
      for (int i = 0; i < l$getHealthRiskAssessment.length; i++) {
        final l$getHealthRiskAssessment$entry = l$getHealthRiskAssessment[i];
        final lOther$getHealthRiskAssessment$entry =
            lOther$getHealthRiskAssessment[i];
        if (l$getHealthRiskAssessment$entry !=
            lOther$getHealthRiskAssessment$entry) {
          return false;
        }
      }
    } else if (l$getHealthRiskAssessment != lOther$getHealthRiskAssessment) {
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
    List<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>?
        getHealthRiskAssessment,
    String? $__typename,
  });
  TRes getHealthRiskAssessment(
      Iterable<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>? Function(
              Iterable<
                  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<
                      Query$GetHealthRiskAssessment$getHealthRiskAssessment>?>?)
          _fn);
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
            : (getHealthRiskAssessment as List<
                Query$GetHealthRiskAssessment$getHealthRiskAssessment?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getHealthRiskAssessment(
          Iterable<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>? Function(
                  Iterable<
                      CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment<
                          Query$GetHealthRiskAssessment$getHealthRiskAssessment>?>?)
              _fn) =>
      call(
          getHealthRiskAssessment:
              _fn(_instance.getHealthRiskAssessment?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessment<TRes>
    implements CopyWith$Query$GetHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessment(this._res);

  TRes _res;

  call({
    List<Query$GetHealthRiskAssessment$getHealthRiskAssessment?>?
        getHealthRiskAssessment,
    String? $__typename,
  }) =>
      _res;

  getHealthRiskAssessment(_fn) => _res;
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
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'questionId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'choice'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'answer'),
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
      questionnaireData: (l$questionnaireData as List<dynamic>)
          .map((e) =>
              Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      riskLevel: (l$riskLevel as String),
      recommendations: (l$recommendations as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String assessmentId;

  final List<
          Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>
      questionnaireData;

  final String riskLevel;

  final String recommendations;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$assessmentId = assessmentId;
    _resultData['assessmentId'] = l$assessmentId;
    final l$questionnaireData = questionnaireData;
    _resultData['questionnaireData'] =
        l$questionnaireData.map((e) => e.toJson()).toList();
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
      Object.hashAll(l$questionnaireData.map((v) => v)),
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
    if (other is! Query$GetHealthRiskAssessment$getHealthRiskAssessment ||
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
    if (l$questionnaireData.length != lOther$questionnaireData.length) {
      return false;
    }
    for (int i = 0; i < l$questionnaireData.length; i++) {
      final l$questionnaireData$entry = l$questionnaireData[i];
      final lOther$questionnaireData$entry = lOther$questionnaireData[i];
      if (l$questionnaireData$entry != lOther$questionnaireData$entry) {
        return false;
      }
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
    List<Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>?
        questionnaireData,
    String? riskLevel,
    String? recommendations,
    DateTime? createdAt,
    String? $__typename,
  });
  TRes questionnaireData(
      Iterable<Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData> Function(
              Iterable<
                  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
                      Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>>)
          _fn);
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
        questionnaireData: questionnaireData == _undefined ||
                questionnaireData == null
            ? _instance.questionnaireData
            : (questionnaireData as List<
                Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>),
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

  TRes questionnaireData(
          Iterable<Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData> Function(
                  Iterable<
                      CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
                          Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>>)
              _fn) =>
      call(
          questionnaireData: _fn(_instance.questionnaireData.map((e) =>
              CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
                e,
                (i) => i,
              ))).toList());
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
    List<Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>?
        questionnaireData,
    String? riskLevel,
    String? recommendations,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;

  questionnaireData(_fn) => _res;
}

class Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData {
  Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData({
    required this.questionId,
    required this.choice,
    this.answer,
    this.$__typename = 'HealthResponse',
  });

  factory Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData.fromJson(
      Map<String, dynamic> json) {
    final l$questionId = json['questionId'];
    final l$choice = json['choice'];
    final l$answer = json['answer'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
      questionId: (l$questionId as int),
      choice: (l$choice as String),
      answer: (l$answer as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final int questionId;

  final String choice;

  final String? answer;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$questionId = questionId;
    _resultData['questionId'] = l$questionId;
    final l$choice = choice;
    _resultData['choice'] = l$choice;
    final l$answer = answer;
    _resultData['answer'] = l$answer;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$questionId = questionId;
    final l$choice = choice;
    final l$answer = answer;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$questionId,
      l$choice,
      l$answer,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionId = questionId;
    final lOther$questionId = other.questionId;
    if (l$questionId != lOther$questionId) {
      return false;
    }
    final l$choice = choice;
    final lOther$choice = other.choice;
    if (l$choice != lOther$choice) {
      return false;
    }
    final l$answer = answer;
    final lOther$answer = other.answer;
    if (l$answer != lOther$answer) {
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

extension UtilityExtension$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData
    on Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData {
  CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
          Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData>
      get copyWith =>
          CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
    TRes> {
  factory CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
    Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData
        instance,
    TRes Function(
            Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData)
        then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData;

  factory CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData;

  TRes call({
    int? questionId,
    String? choice,
    String? answer,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
            TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData
      _instance;

  final TRes Function(
          Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? questionId = _undefined,
    Object? choice = _undefined,
    Object? answer = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
        questionId: questionId == _undefined || questionId == null
            ? _instance.questionId
            : (questionId as int),
        choice: choice == _undefined || choice == null
            ? _instance.choice
            : (choice as String),
        answer: answer == _undefined ? _instance.answer : (answer as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData<
            TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessment$getHealthRiskAssessment$questionnaireData(
      this._res);

  TRes _res;

  call({
    int? questionId,
    String? choice,
    String? answer,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetHealthRiskAssessmentQuestion {
  Query$GetHealthRiskAssessmentQuestion({
    this.getHealthRiskAssessmentQuestion,
    this.$__typename = 'Query',
  });

  factory Query$GetHealthRiskAssessmentQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$getHealthRiskAssessmentQuestion =
        json['getHealthRiskAssessmentQuestion'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessmentQuestion(
      getHealthRiskAssessmentQuestion: l$getHealthRiskAssessmentQuestion == null
          ? null
          : Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
              .fromJson(
                  (l$getHealthRiskAssessmentQuestion as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion?
      getHealthRiskAssessmentQuestion;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getHealthRiskAssessmentQuestion = getHealthRiskAssessmentQuestion;
    _resultData['getHealthRiskAssessmentQuestion'] =
        l$getHealthRiskAssessmentQuestion?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getHealthRiskAssessmentQuestion = getHealthRiskAssessmentQuestion;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getHealthRiskAssessmentQuestion,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetHealthRiskAssessmentQuestion ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getHealthRiskAssessmentQuestion = getHealthRiskAssessmentQuestion;
    final lOther$getHealthRiskAssessmentQuestion =
        other.getHealthRiskAssessmentQuestion;
    if (l$getHealthRiskAssessmentQuestion !=
        lOther$getHealthRiskAssessmentQuestion) {
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

extension UtilityExtension$Query$GetHealthRiskAssessmentQuestion
    on Query$GetHealthRiskAssessmentQuestion {
  CopyWith$Query$GetHealthRiskAssessmentQuestion<
          Query$GetHealthRiskAssessmentQuestion>
      get copyWith => CopyWith$Query$GetHealthRiskAssessmentQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessmentQuestion<TRes> {
  factory CopyWith$Query$GetHealthRiskAssessmentQuestion(
    Query$GetHealthRiskAssessmentQuestion instance,
    TRes Function(Query$GetHealthRiskAssessmentQuestion) then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion;

  factory CopyWith$Query$GetHealthRiskAssessmentQuestion.stub(TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion;

  TRes call({
    Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion?
        getHealthRiskAssessmentQuestion,
    String? $__typename,
  });
  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
      TRes> get getHealthRiskAssessmentQuestion;
}

class _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion<TRes>
    implements CopyWith$Query$GetHealthRiskAssessmentQuestion<TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessmentQuestion _instance;

  final TRes Function(Query$GetHealthRiskAssessmentQuestion) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getHealthRiskAssessmentQuestion = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetHealthRiskAssessmentQuestion(
        getHealthRiskAssessmentQuestion: getHealthRiskAssessmentQuestion ==
                _undefined
            ? _instance.getHealthRiskAssessmentQuestion
            : (getHealthRiskAssessmentQuestion
                as Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
      TRes> get getHealthRiskAssessmentQuestion {
    final local$getHealthRiskAssessmentQuestion =
        _instance.getHealthRiskAssessmentQuestion;
    return local$getHealthRiskAssessmentQuestion == null
        ? CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
            .stub(_then(_instance))
        : CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
            local$getHealthRiskAssessmentQuestion,
            (e) => call(getHealthRiskAssessmentQuestion: e));
  }
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion<TRes>
    implements CopyWith$Query$GetHealthRiskAssessmentQuestion<TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion(this._res);

  TRes _res;

  call({
    Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion?
        getHealthRiskAssessmentQuestion,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
          TRes>
      get getHealthRiskAssessmentQuestion =>
          CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
              .stub(_res);
}

const documentNodeQueryGetHealthRiskAssessmentQuestion =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetHealthRiskAssessmentQuestion'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getHealthRiskAssessmentQuestion'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'questionnaireId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'data'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'questionId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'question'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'questionType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'choices'),
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
Query$GetHealthRiskAssessmentQuestion
    _parserFn$Query$GetHealthRiskAssessmentQuestion(
            Map<String, dynamic> data) =>
        Query$GetHealthRiskAssessmentQuestion.fromJson(data);
typedef OnQueryComplete$Query$GetHealthRiskAssessmentQuestion = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Query$GetHealthRiskAssessmentQuestion?,
);

class Options$Query$GetHealthRiskAssessmentQuestion
    extends graphql.QueryOptions<Query$GetHealthRiskAssessmentQuestion> {
  Options$Query$GetHealthRiskAssessmentQuestion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthRiskAssessmentQuestion? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetHealthRiskAssessmentQuestion? onComplete,
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
                        : _parserFn$Query$GetHealthRiskAssessmentQuestion(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetHealthRiskAssessmentQuestion,
          parserFn: _parserFn$Query$GetHealthRiskAssessmentQuestion,
        );

  final OnQueryComplete$Query$GetHealthRiskAssessmentQuestion?
      onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetHealthRiskAssessmentQuestion
    extends graphql.WatchQueryOptions<Query$GetHealthRiskAssessmentQuestion> {
  WatchOptions$Query$GetHealthRiskAssessmentQuestion({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetHealthRiskAssessmentQuestion? typedOptimisticResult,
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
          document: documentNodeQueryGetHealthRiskAssessmentQuestion,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetHealthRiskAssessmentQuestion,
        );
}

class FetchMoreOptions$Query$GetHealthRiskAssessmentQuestion
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetHealthRiskAssessmentQuestion(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetHealthRiskAssessmentQuestion,
        );
}

extension ClientExtension$Query$GetHealthRiskAssessmentQuestion
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetHealthRiskAssessmentQuestion>>
      query$GetHealthRiskAssessmentQuestion(
              [Options$Query$GetHealthRiskAssessmentQuestion? options]) async =>
          await this.query(
              options ?? Options$Query$GetHealthRiskAssessmentQuestion());
  graphql.ObservableQuery<Query$GetHealthRiskAssessmentQuestion>
      watchQuery$GetHealthRiskAssessmentQuestion(
              [WatchOptions$Query$GetHealthRiskAssessmentQuestion? options]) =>
          this.watchQuery(
              options ?? WatchOptions$Query$GetHealthRiskAssessmentQuestion());
  void writeQuery$GetHealthRiskAssessmentQuestion({
    required Query$GetHealthRiskAssessmentQuestion data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetHealthRiskAssessmentQuestion)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetHealthRiskAssessmentQuestion?
      readQuery$GetHealthRiskAssessmentQuestion({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetHealthRiskAssessmentQuestion)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetHealthRiskAssessmentQuestion.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetHealthRiskAssessmentQuestion>
    useQuery$GetHealthRiskAssessmentQuestion(
            [Options$Query$GetHealthRiskAssessmentQuestion? options]) =>
        graphql_flutter.useQuery(
            options ?? Options$Query$GetHealthRiskAssessmentQuestion());
graphql.ObservableQuery<Query$GetHealthRiskAssessmentQuestion>
    useWatchQuery$GetHealthRiskAssessmentQuestion(
            [WatchOptions$Query$GetHealthRiskAssessmentQuestion? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$GetHealthRiskAssessmentQuestion());

class Query$GetHealthRiskAssessmentQuestion$Widget
    extends graphql_flutter.Query<Query$GetHealthRiskAssessmentQuestion> {
  Query$GetHealthRiskAssessmentQuestion$Widget({
    widgets.Key? key,
    Options$Query$GetHealthRiskAssessmentQuestion? options,
    required graphql_flutter.QueryBuilder<Query$GetHealthRiskAssessmentQuestion>
        builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetHealthRiskAssessmentQuestion(),
          builder: builder,
        );
}

class Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion {
  Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion({
    required this.questionnaireId,
    required this.data,
    this.$__typename = 'QuestionnaireObject',
  });

  factory Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion.fromJson(
      Map<String, dynamic> json) {
    final l$questionnaireId = json['questionnaireId'];
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
      questionnaireId: (l$questionnaireId as int),
      data: (l$data as List<dynamic>)
          .map((e) =>
              Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int questionnaireId;

  final List<
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>
      data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$questionnaireId = questionnaireId;
    _resultData['questionnaireId'] = l$questionnaireId;
    final l$data = data;
    _resultData['data'] = l$data.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$questionnaireId = questionnaireId;
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$questionnaireId,
      Object.hashAll(l$data.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionnaireId = questionnaireId;
    final lOther$questionnaireId = other.questionnaireId;
    if (l$questionnaireId != lOther$questionnaireId) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data.length != lOther$data.length) {
      return false;
    }
    for (int i = 0; i < l$data.length; i++) {
      final l$data$entry = l$data[i];
      final lOther$data$entry = lOther$data[i];
      if (l$data$entry != lOther$data$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
    on Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion {
  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion>
      get copyWith =>
          CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
    TRes> {
  factory CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
    Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
        instance,
    TRes Function(
            Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion)
        then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion;

  factory CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion;

  TRes call({
    int? questionnaireId,
    List<Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>?
        data,
    String? $__typename,
  });
  TRes data(
      Iterable<Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data> Function(
              Iterable<
                  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
                      Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>>)
          _fn);
}

class _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
            TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion
      _instance;

  final TRes Function(
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? questionnaireId = _undefined,
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
        questionnaireId:
            questionnaireId == _undefined || questionnaireId == null
                ? _instance.questionnaireId
                : (questionnaireId as int),
        data: data == _undefined || data == null
            ? _instance.data
            : (data as List<
                Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes data(
          Iterable<Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data> Function(
                  Iterable<
                      CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
                          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>>)
              _fn) =>
      call(
          data: _fn(_instance.data.map((e) =>
              CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion<
            TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion(
      this._res);

  TRes _res;

  call({
    int? questionnaireId,
    List<Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>?
        data,
    String? $__typename,
  }) =>
      _res;

  data(_fn) => _res;
}

class Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data {
  Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data({
    required this.questionId,
    required this.question,
    required this.questionType,
    this.choices,
    this.$__typename = 'Question',
  });

  factory Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data.fromJson(
      Map<String, dynamic> json) {
    final l$questionId = json['questionId'];
    final l$question = json['question'];
    final l$questionType = json['questionType'];
    final l$choices = json['choices'];
    final l$$__typename = json['__typename'];
    return Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
      questionId: (l$questionId as int),
      question: (l$question as String),
      questionType: (l$questionType as int),
      choices:
          (l$choices as List<dynamic>?)?.map((e) => (e as String)).toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final int questionId;

  final String question;

  final int questionType;

  final List<String>? choices;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$questionId = questionId;
    _resultData['questionId'] = l$questionId;
    final l$question = question;
    _resultData['question'] = l$question;
    final l$questionType = questionType;
    _resultData['questionType'] = l$questionType;
    final l$choices = choices;
    _resultData['choices'] = l$choices?.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$questionId = questionId;
    final l$question = question;
    final l$questionType = questionType;
    final l$choices = choices;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$questionId,
      l$question,
      l$questionType,
      l$choices == null ? null : Object.hashAll(l$choices.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionId = questionId;
    final lOther$questionId = other.questionId;
    if (l$questionId != lOther$questionId) {
      return false;
    }
    final l$question = question;
    final lOther$question = other.question;
    if (l$question != lOther$question) {
      return false;
    }
    final l$questionType = questionType;
    final lOther$questionType = other.questionType;
    if (l$questionType != lOther$questionType) {
      return false;
    }
    final l$choices = choices;
    final lOther$choices = other.choices;
    if (l$choices != null && lOther$choices != null) {
      if (l$choices.length != lOther$choices.length) {
        return false;
      }
      for (int i = 0; i < l$choices.length; i++) {
        final l$choices$entry = l$choices[i];
        final lOther$choices$entry = lOther$choices[i];
        if (l$choices$entry != lOther$choices$entry) {
          return false;
        }
      }
    } else if (l$choices != lOther$choices) {
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

extension UtilityExtension$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data
    on Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data {
  CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data>
      get copyWith =>
          CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
    TRes> {
  factory CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
    Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data
        instance,
    TRes Function(
            Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data)
        then,
  ) = _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data;

  factory CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data;

  TRes call({
    int? questionId,
    String? question,
    int? questionType,
    List<String>? choices,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
            TRes> {
  _CopyWithImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
    this._instance,
    this._then,
  );

  final Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data
      _instance;

  final TRes Function(
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? questionId = _undefined,
    Object? question = _undefined,
    Object? questionType = _undefined,
    Object? choices = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
        questionId: questionId == _undefined || questionId == null
            ? _instance.questionId
            : (questionId as int),
        question: question == _undefined || question == null
            ? _instance.question
            : (question as String),
        questionType: questionType == _undefined || questionType == null
            ? _instance.questionType
            : (questionType as int),
        choices: choices == _undefined
            ? _instance.choices
            : (choices as List<String>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
        TRes>
    implements
        CopyWith$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data<
            TRes> {
  _CopyWithStubImpl$Query$GetHealthRiskAssessmentQuestion$getHealthRiskAssessmentQuestion$data(
      this._res);

  TRes _res;

  call({
    int? questionId,
    String? question,
    int? questionType,
    List<String>? choices,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$EvaluateHealthRiskAssessment {
  factory Variables$Mutation$EvaluateHealthRiskAssessment(
          {required Input$FilledQuestionnaire filledQuestionnaire}) =>
      Variables$Mutation$EvaluateHealthRiskAssessment._({
        r'filledQuestionnaire': filledQuestionnaire,
      });

  Variables$Mutation$EvaluateHealthRiskAssessment._(this._$data);

  factory Variables$Mutation$EvaluateHealthRiskAssessment.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$filledQuestionnaire = data['filledQuestionnaire'];
    result$data['filledQuestionnaire'] = Input$FilledQuestionnaire.fromJson(
        (l$filledQuestionnaire as Map<String, dynamic>));
    return Variables$Mutation$EvaluateHealthRiskAssessment._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$FilledQuestionnaire get filledQuestionnaire =>
      (_$data['filledQuestionnaire'] as Input$FilledQuestionnaire);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$filledQuestionnaire = filledQuestionnaire;
    result$data['filledQuestionnaire'] = l$filledQuestionnaire.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment<
          Variables$Mutation$EvaluateHealthRiskAssessment>
      get copyWith => CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$EvaluateHealthRiskAssessment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$filledQuestionnaire = filledQuestionnaire;
    final lOther$filledQuestionnaire = other.filledQuestionnaire;
    if (l$filledQuestionnaire != lOther$filledQuestionnaire) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$filledQuestionnaire = filledQuestionnaire;
    return Object.hashAll([l$filledQuestionnaire]);
  }
}

abstract class CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment<TRes> {
  factory CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment(
    Variables$Mutation$EvaluateHealthRiskAssessment instance,
    TRes Function(Variables$Mutation$EvaluateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Variables$Mutation$EvaluateHealthRiskAssessment;

  factory CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EvaluateHealthRiskAssessment;

  TRes call({Input$FilledQuestionnaire? filledQuestionnaire});
}

class _CopyWithImpl$Variables$Mutation$EvaluateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Variables$Mutation$EvaluateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Variables$Mutation$EvaluateHealthRiskAssessment _instance;

  final TRes Function(Variables$Mutation$EvaluateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? filledQuestionnaire = _undefined}) =>
      _then(Variables$Mutation$EvaluateHealthRiskAssessment._({
        ..._instance._$data,
        if (filledQuestionnaire != _undefined && filledQuestionnaire != null)
          'filledQuestionnaire':
              (filledQuestionnaire as Input$FilledQuestionnaire),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$EvaluateHealthRiskAssessment<TRes>
    implements CopyWith$Variables$Mutation$EvaluateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EvaluateHealthRiskAssessment(this._res);

  TRes _res;

  call({Input$FilledQuestionnaire? filledQuestionnaire}) => _res;
}

class Mutation$EvaluateHealthRiskAssessment {
  Mutation$EvaluateHealthRiskAssessment({
    this.evaluateHealthRiskAssessment,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EvaluateHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$evaluateHealthRiskAssessment = json['evaluateHealthRiskAssessment'];
    final l$$__typename = json['__typename'];
    return Mutation$EvaluateHealthRiskAssessment(
      evaluateHealthRiskAssessment: l$evaluateHealthRiskAssessment == null
          ? null
          : Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment
              .fromJson(
                  (l$evaluateHealthRiskAssessment as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment?
      evaluateHealthRiskAssessment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$evaluateHealthRiskAssessment = evaluateHealthRiskAssessment;
    _resultData['evaluateHealthRiskAssessment'] =
        l$evaluateHealthRiskAssessment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$evaluateHealthRiskAssessment = evaluateHealthRiskAssessment;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$evaluateHealthRiskAssessment,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$EvaluateHealthRiskAssessment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$evaluateHealthRiskAssessment = evaluateHealthRiskAssessment;
    final lOther$evaluateHealthRiskAssessment =
        other.evaluateHealthRiskAssessment;
    if (l$evaluateHealthRiskAssessment != lOther$evaluateHealthRiskAssessment) {
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

extension UtilityExtension$Mutation$EvaluateHealthRiskAssessment
    on Mutation$EvaluateHealthRiskAssessment {
  CopyWith$Mutation$EvaluateHealthRiskAssessment<
          Mutation$EvaluateHealthRiskAssessment>
      get copyWith => CopyWith$Mutation$EvaluateHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EvaluateHealthRiskAssessment<TRes> {
  factory CopyWith$Mutation$EvaluateHealthRiskAssessment(
    Mutation$EvaluateHealthRiskAssessment instance,
    TRes Function(Mutation$EvaluateHealthRiskAssessment) then,
  ) = _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment;

  factory CopyWith$Mutation$EvaluateHealthRiskAssessment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment;

  TRes call({
    Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment?
        evaluateHealthRiskAssessment,
    String? $__typename,
  });
  CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
      TRes> get evaluateHealthRiskAssessment;
}

class _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$EvaluateHealthRiskAssessment<TRes> {
  _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$EvaluateHealthRiskAssessment _instance;

  final TRes Function(Mutation$EvaluateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? evaluateHealthRiskAssessment = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EvaluateHealthRiskAssessment(
        evaluateHealthRiskAssessment: evaluateHealthRiskAssessment == _undefined
            ? _instance.evaluateHealthRiskAssessment
            : (evaluateHealthRiskAssessment
                as Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
      TRes> get evaluateHealthRiskAssessment {
    final local$evaluateHealthRiskAssessment =
        _instance.evaluateHealthRiskAssessment;
    return local$evaluateHealthRiskAssessment == null
        ? CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment
            .stub(_then(_instance))
        : CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
            local$evaluateHealthRiskAssessment,
            (e) => call(evaluateHealthRiskAssessment: e));
  }
}

class _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment<TRes>
    implements CopyWith$Mutation$EvaluateHealthRiskAssessment<TRes> {
  _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment(this._res);

  TRes _res;

  call({
    Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment?
        evaluateHealthRiskAssessment,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
          TRes>
      get evaluateHealthRiskAssessment =>
          CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment
              .stub(_res);
}

const documentNodeMutationEvaluateHealthRiskAssessment =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'EvaluateHealthRiskAssessment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'filledQuestionnaire')),
        type: NamedTypeNode(
          name: NameNode(value: 'FilledQuestionnaire'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'evaluateHealthRiskAssessment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'filledQuestionnaire'),
            value: VariableNode(name: NameNode(value: 'filledQuestionnaire')),
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
Mutation$EvaluateHealthRiskAssessment
    _parserFn$Mutation$EvaluateHealthRiskAssessment(
            Map<String, dynamic> data) =>
        Mutation$EvaluateHealthRiskAssessment.fromJson(data);
typedef OnMutationCompleted$Mutation$EvaluateHealthRiskAssessment
    = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$EvaluateHealthRiskAssessment?,
);

class Options$Mutation$EvaluateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$EvaluateHealthRiskAssessment> {
  Options$Mutation$EvaluateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$EvaluateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EvaluateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EvaluateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$EvaluateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$EvaluateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEvaluateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$EvaluateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$EvaluateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$EvaluateHealthRiskAssessment
    extends graphql.WatchQueryOptions<Mutation$EvaluateHealthRiskAssessment> {
  WatchOptions$Mutation$EvaluateHealthRiskAssessment({
    String? operationName,
    required Variables$Mutation$EvaluateHealthRiskAssessment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EvaluateHealthRiskAssessment? typedOptimisticResult,
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
          document: documentNodeMutationEvaluateHealthRiskAssessment,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$EvaluateHealthRiskAssessment,
        );
}

extension ClientExtension$Mutation$EvaluateHealthRiskAssessment
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EvaluateHealthRiskAssessment>>
      mutate$EvaluateHealthRiskAssessment(
              Options$Mutation$EvaluateHealthRiskAssessment options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$EvaluateHealthRiskAssessment>
      watchMutation$EvaluateHealthRiskAssessment(
              WatchOptions$Mutation$EvaluateHealthRiskAssessment options) =>
          this.watchMutation(options);
}

class Mutation$EvaluateHealthRiskAssessment$HookResult {
  Mutation$EvaluateHealthRiskAssessment$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$EvaluateHealthRiskAssessment runMutation;

  final graphql.QueryResult<Mutation$EvaluateHealthRiskAssessment> result;
}

Mutation$EvaluateHealthRiskAssessment$HookResult
    useMutation$EvaluateHealthRiskAssessment(
        [WidgetOptions$Mutation$EvaluateHealthRiskAssessment? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$EvaluateHealthRiskAssessment());
  return Mutation$EvaluateHealthRiskAssessment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$EvaluateHealthRiskAssessment>
    useWatchMutation$EvaluateHealthRiskAssessment(
            WatchOptions$Mutation$EvaluateHealthRiskAssessment options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$EvaluateHealthRiskAssessment
    extends graphql.MutationOptions<Mutation$EvaluateHealthRiskAssessment> {
  WidgetOptions$Mutation$EvaluateHealthRiskAssessment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EvaluateHealthRiskAssessment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EvaluateHealthRiskAssessment? onCompleted,
    graphql.OnMutationUpdate<Mutation$EvaluateHealthRiskAssessment>? update,
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
                        : _parserFn$Mutation$EvaluateHealthRiskAssessment(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationEvaluateHealthRiskAssessment,
          parserFn: _parserFn$Mutation$EvaluateHealthRiskAssessment,
        );

  final OnMutationCompleted$Mutation$EvaluateHealthRiskAssessment?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$EvaluateHealthRiskAssessment
    = graphql.MultiSourceResult<Mutation$EvaluateHealthRiskAssessment> Function(
  Variables$Mutation$EvaluateHealthRiskAssessment, {
  Object? optimisticResult,
  Mutation$EvaluateHealthRiskAssessment? typedOptimisticResult,
});
typedef Builder$Mutation$EvaluateHealthRiskAssessment = widgets.Widget Function(
  RunMutation$Mutation$EvaluateHealthRiskAssessment,
  graphql.QueryResult<Mutation$EvaluateHealthRiskAssessment>?,
);

class Mutation$EvaluateHealthRiskAssessment$Widget
    extends graphql_flutter.Mutation<Mutation$EvaluateHealthRiskAssessment> {
  Mutation$EvaluateHealthRiskAssessment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$EvaluateHealthRiskAssessment? options,
    required Builder$Mutation$EvaluateHealthRiskAssessment builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$EvaluateHealthRiskAssessment(),
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

class Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment {
  Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment({
    required this.assessmentId,
    required this.riskLevel,
    required this.recommendations,
    this.$__typename = 'EvaluateHealthRiskAssessmentResponse',
  });

  factory Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment.fromJson(
      Map<String, dynamic> json) {
    final l$assessmentId = json['assessmentId'];
    final l$riskLevel = json['riskLevel'];
    final l$recommendations = json['recommendations'];
    final l$$__typename = json['__typename'];
    return Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
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
    if (other
            is! Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment ||
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

extension UtilityExtension$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment
    on Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment {
  CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
          Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment>
      get copyWith =>
          CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
    TRes> {
  factory CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
    Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment instance,
    TRes Function(
            Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment)
        then,
  ) = _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment;

  factory CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment;

  TRes call({
    String? assessmentId,
    String? riskLevel,
    String? recommendations,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
            TRes> {
  _CopyWithImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
    this._instance,
    this._then,
  );

  final Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment
      _instance;

  final TRes Function(
      Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assessmentId = _undefined,
    Object? riskLevel = _undefined,
    Object? recommendations = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
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

class _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
        TRes>
    implements
        CopyWith$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment<
            TRes> {
  _CopyWithStubImpl$Mutation$EvaluateHealthRiskAssessment$evaluateHealthRiskAssessment(
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
