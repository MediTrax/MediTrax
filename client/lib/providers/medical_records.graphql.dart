import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Query$GetMedicalRecords {
  Query$GetMedicalRecords({
    this.getMedicalRecords,
    this.$__typename = 'Query',
  });

  factory Query$GetMedicalRecords.fromJson(Map<String, dynamic> json) {
    final l$getMedicalRecords = json['getMedicalRecords'];
    final l$$__typename = json['__typename'];
    return Query$GetMedicalRecords(
      getMedicalRecords: (l$getMedicalRecords as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetMedicalRecords$getMedicalRecords.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMedicalRecords$getMedicalRecords?>? getMedicalRecords;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMedicalRecords = getMedicalRecords;
    _resultData['getMedicalRecords'] =
        l$getMedicalRecords?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMedicalRecords = getMedicalRecords;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMedicalRecords == null
          ? null
          : Object.hashAll(l$getMedicalRecords.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedicalRecords) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMedicalRecords = getMedicalRecords;
    final lOther$getMedicalRecords = other.getMedicalRecords;
    if (l$getMedicalRecords != null && lOther$getMedicalRecords != null) {
      if (l$getMedicalRecords.length != lOther$getMedicalRecords.length) {
        return false;
      }
      for (int i = 0; i < l$getMedicalRecords.length; i++) {
        final l$getMedicalRecords$entry = l$getMedicalRecords[i];
        final lOther$getMedicalRecords$entry = lOther$getMedicalRecords[i];
        if (l$getMedicalRecords$entry != lOther$getMedicalRecords$entry) {
          return false;
        }
      }
    } else if (l$getMedicalRecords != lOther$getMedicalRecords) {
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

extension UtilityExtension$Query$GetMedicalRecords on Query$GetMedicalRecords {
  CopyWith$Query$GetMedicalRecords<Query$GetMedicalRecords> get copyWith =>
      CopyWith$Query$GetMedicalRecords(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMedicalRecords<TRes> {
  factory CopyWith$Query$GetMedicalRecords(
    Query$GetMedicalRecords instance,
    TRes Function(Query$GetMedicalRecords) then,
  ) = _CopyWithImpl$Query$GetMedicalRecords;

  factory CopyWith$Query$GetMedicalRecords.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedicalRecords;

  TRes call({
    List<Query$GetMedicalRecords$getMedicalRecords?>? getMedicalRecords,
    String? $__typename,
  });
  TRes getMedicalRecords(
      Iterable<Query$GetMedicalRecords$getMedicalRecords?>? Function(
              Iterable<
                  CopyWith$Query$GetMedicalRecords$getMedicalRecords<
                      Query$GetMedicalRecords$getMedicalRecords>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetMedicalRecords<TRes>
    implements CopyWith$Query$GetMedicalRecords<TRes> {
  _CopyWithImpl$Query$GetMedicalRecords(
    this._instance,
    this._then,
  );

  final Query$GetMedicalRecords _instance;

  final TRes Function(Query$GetMedicalRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMedicalRecords = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedicalRecords(
        getMedicalRecords: getMedicalRecords == _undefined
            ? _instance.getMedicalRecords
            : (getMedicalRecords
                as List<Query$GetMedicalRecords$getMedicalRecords?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getMedicalRecords(
          Iterable<Query$GetMedicalRecords$getMedicalRecords?>? Function(
                  Iterable<
                      CopyWith$Query$GetMedicalRecords$getMedicalRecords<
                          Query$GetMedicalRecords$getMedicalRecords>?>?)
              _fn) =>
      call(
          getMedicalRecords:
              _fn(_instance.getMedicalRecords?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetMedicalRecords$getMedicalRecords(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetMedicalRecords<TRes>
    implements CopyWith$Query$GetMedicalRecords<TRes> {
  _CopyWithStubImpl$Query$GetMedicalRecords(this._res);

  TRes _res;

  call({
    List<Query$GetMedicalRecords$getMedicalRecords?>? getMedicalRecords,
    String? $__typename,
  }) =>
      _res;

  getMedicalRecords(_fn) => _res;
}

const documentNodeQueryGetMedicalRecords = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMedicalRecords'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getMedicalRecords'),
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
            name: NameNode(value: 'recordType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
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
Query$GetMedicalRecords _parserFn$Query$GetMedicalRecords(
        Map<String, dynamic> data) =>
    Query$GetMedicalRecords.fromJson(data);
typedef OnQueryComplete$Query$GetMedicalRecords = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMedicalRecords?,
);

class Options$Query$GetMedicalRecords
    extends graphql.QueryOptions<Query$GetMedicalRecords> {
  Options$Query$GetMedicalRecords({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedicalRecords? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMedicalRecords? onComplete,
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
                        : _parserFn$Query$GetMedicalRecords(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMedicalRecords,
          parserFn: _parserFn$Query$GetMedicalRecords,
        );

  final OnQueryComplete$Query$GetMedicalRecords? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMedicalRecords
    extends graphql.WatchQueryOptions<Query$GetMedicalRecords> {
  WatchOptions$Query$GetMedicalRecords({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedicalRecords? typedOptimisticResult,
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
          document: documentNodeQueryGetMedicalRecords,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMedicalRecords,
        );
}

class FetchMoreOptions$Query$GetMedicalRecords
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMedicalRecords(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMedicalRecords,
        );
}

extension ClientExtension$Query$GetMedicalRecords on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMedicalRecords>> query$GetMedicalRecords(
          [Options$Query$GetMedicalRecords? options]) async =>
      await this.query(options ?? Options$Query$GetMedicalRecords());
  graphql.ObservableQuery<Query$GetMedicalRecords> watchQuery$GetMedicalRecords(
          [WatchOptions$Query$GetMedicalRecords? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMedicalRecords());
  void writeQuery$GetMedicalRecords({
    required Query$GetMedicalRecords data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetMedicalRecords)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMedicalRecords? readQuery$GetMedicalRecords(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetMedicalRecords)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMedicalRecords.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMedicalRecords>
    useQuery$GetMedicalRecords([Options$Query$GetMedicalRecords? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$GetMedicalRecords());
graphql.ObservableQuery<Query$GetMedicalRecords>
    useWatchQuery$GetMedicalRecords(
            [WatchOptions$Query$GetMedicalRecords? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$GetMedicalRecords());

class Query$GetMedicalRecords$Widget
    extends graphql_flutter.Query<Query$GetMedicalRecords> {
  Query$GetMedicalRecords$Widget({
    widgets.Key? key,
    Options$Query$GetMedicalRecords? options,
    required graphql_flutter.QueryBuilder<Query$GetMedicalRecords> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMedicalRecords(),
          builder: builder,
        );
}

class Query$GetMedicalRecords$getMedicalRecords {
  Query$GetMedicalRecords$getMedicalRecords({
    required this.recordId,
    required this.recordType,
    required this.content,
    required this.createdAt,
    this.$__typename = 'MedicalRecordDetail',
  });

  factory Query$GetMedicalRecords$getMedicalRecords.fromJson(
      Map<String, dynamic> json) {
    final l$recordId = json['recordId'];
    final l$recordType = json['recordType'];
    final l$content = json['content'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetMedicalRecords$getMedicalRecords(
      recordId: (l$recordId as String),
      recordType: (l$recordType as String),
      content: (l$content as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String recordId;

  final String recordType;

  final String content;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordId = recordId;
    _resultData['recordId'] = l$recordId;
    final l$recordType = recordType;
    _resultData['recordType'] = l$recordType;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$recordType = recordType;
    final l$content = content;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$recordId,
      l$recordType,
      l$content,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedicalRecords$getMedicalRecords) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
      return false;
    }
    final l$recordType = recordType;
    final lOther$recordType = other.recordType;
    if (l$recordType != lOther$recordType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
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

extension UtilityExtension$Query$GetMedicalRecords$getMedicalRecords
    on Query$GetMedicalRecords$getMedicalRecords {
  CopyWith$Query$GetMedicalRecords$getMedicalRecords<
          Query$GetMedicalRecords$getMedicalRecords>
      get copyWith => CopyWith$Query$GetMedicalRecords$getMedicalRecords(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMedicalRecords$getMedicalRecords<TRes> {
  factory CopyWith$Query$GetMedicalRecords$getMedicalRecords(
    Query$GetMedicalRecords$getMedicalRecords instance,
    TRes Function(Query$GetMedicalRecords$getMedicalRecords) then,
  ) = _CopyWithImpl$Query$GetMedicalRecords$getMedicalRecords;

  factory CopyWith$Query$GetMedicalRecords$getMedicalRecords.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedicalRecords$getMedicalRecords;

  TRes call({
    String? recordId,
    String? recordType,
    String? content,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMedicalRecords$getMedicalRecords<TRes>
    implements CopyWith$Query$GetMedicalRecords$getMedicalRecords<TRes> {
  _CopyWithImpl$Query$GetMedicalRecords$getMedicalRecords(
    this._instance,
    this._then,
  );

  final Query$GetMedicalRecords$getMedicalRecords _instance;

  final TRes Function(Query$GetMedicalRecords$getMedicalRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? recordType = _undefined,
    Object? content = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedicalRecords$getMedicalRecords(
        recordId: recordId == _undefined || recordId == null
            ? _instance.recordId
            : (recordId as String),
        recordType: recordType == _undefined || recordType == null
            ? _instance.recordType
            : (recordType as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMedicalRecords$getMedicalRecords<TRes>
    implements CopyWith$Query$GetMedicalRecords$getMedicalRecords<TRes> {
  _CopyWithStubImpl$Query$GetMedicalRecords$getMedicalRecords(this._res);

  TRes _res;

  call({
    String? recordId,
    String? recordType,
    String? content,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Query$GetSharedMedicalRecords {
  factory Variables$Query$GetSharedMedicalRecords(
          {required String patientId}) =>
      Variables$Query$GetSharedMedicalRecords._({
        r'patientId': patientId,
      });

  Variables$Query$GetSharedMedicalRecords._(this._$data);

  factory Variables$Query$GetSharedMedicalRecords.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$patientId = data['patientId'];
    result$data['patientId'] = (l$patientId as String);
    return Variables$Query$GetSharedMedicalRecords._(result$data);
  }

  Map<String, dynamic> _$data;

  String get patientId => (_$data['patientId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$patientId = patientId;
    result$data['patientId'] = l$patientId;
    return result$data;
  }

  CopyWith$Variables$Query$GetSharedMedicalRecords<
          Variables$Query$GetSharedMedicalRecords>
      get copyWith => CopyWith$Variables$Query$GetSharedMedicalRecords(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSharedMedicalRecords) ||
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

abstract class CopyWith$Variables$Query$GetSharedMedicalRecords<TRes> {
  factory CopyWith$Variables$Query$GetSharedMedicalRecords(
    Variables$Query$GetSharedMedicalRecords instance,
    TRes Function(Variables$Query$GetSharedMedicalRecords) then,
  ) = _CopyWithImpl$Variables$Query$GetSharedMedicalRecords;

  factory CopyWith$Variables$Query$GetSharedMedicalRecords.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSharedMedicalRecords;

  TRes call({String? patientId});
}

class _CopyWithImpl$Variables$Query$GetSharedMedicalRecords<TRes>
    implements CopyWith$Variables$Query$GetSharedMedicalRecords<TRes> {
  _CopyWithImpl$Variables$Query$GetSharedMedicalRecords(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSharedMedicalRecords _instance;

  final TRes Function(Variables$Query$GetSharedMedicalRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? patientId = _undefined}) =>
      _then(Variables$Query$GetSharedMedicalRecords._({
        ..._instance._$data,
        if (patientId != _undefined && patientId != null)
          'patientId': (patientId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSharedMedicalRecords<TRes>
    implements CopyWith$Variables$Query$GetSharedMedicalRecords<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSharedMedicalRecords(this._res);

  TRes _res;

  call({String? patientId}) => _res;
}

class Query$GetSharedMedicalRecords {
  Query$GetSharedMedicalRecords({
    this.getSharedMedicalRecords,
    this.$__typename = 'Query',
  });

  factory Query$GetSharedMedicalRecords.fromJson(Map<String, dynamic> json) {
    final l$getSharedMedicalRecords = json['getSharedMedicalRecords'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedMedicalRecords(
      getSharedMedicalRecords: (l$getSharedMedicalRecords as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetSharedMedicalRecords$getSharedMedicalRecords.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSharedMedicalRecords$getSharedMedicalRecords?>?
      getSharedMedicalRecords;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSharedMedicalRecords = getSharedMedicalRecords;
    _resultData['getSharedMedicalRecords'] =
        l$getSharedMedicalRecords?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSharedMedicalRecords = getSharedMedicalRecords;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSharedMedicalRecords == null
          ? null
          : Object.hashAll(l$getSharedMedicalRecords.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSharedMedicalRecords) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSharedMedicalRecords = getSharedMedicalRecords;
    final lOther$getSharedMedicalRecords = other.getSharedMedicalRecords;
    if (l$getSharedMedicalRecords != null &&
        lOther$getSharedMedicalRecords != null) {
      if (l$getSharedMedicalRecords.length !=
          lOther$getSharedMedicalRecords.length) {
        return false;
      }
      for (int i = 0; i < l$getSharedMedicalRecords.length; i++) {
        final l$getSharedMedicalRecords$entry = l$getSharedMedicalRecords[i];
        final lOther$getSharedMedicalRecords$entry =
            lOther$getSharedMedicalRecords[i];
        if (l$getSharedMedicalRecords$entry !=
            lOther$getSharedMedicalRecords$entry) {
          return false;
        }
      }
    } else if (l$getSharedMedicalRecords != lOther$getSharedMedicalRecords) {
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

extension UtilityExtension$Query$GetSharedMedicalRecords
    on Query$GetSharedMedicalRecords {
  CopyWith$Query$GetSharedMedicalRecords<Query$GetSharedMedicalRecords>
      get copyWith => CopyWith$Query$GetSharedMedicalRecords(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedMedicalRecords<TRes> {
  factory CopyWith$Query$GetSharedMedicalRecords(
    Query$GetSharedMedicalRecords instance,
    TRes Function(Query$GetSharedMedicalRecords) then,
  ) = _CopyWithImpl$Query$GetSharedMedicalRecords;

  factory CopyWith$Query$GetSharedMedicalRecords.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSharedMedicalRecords;

  TRes call({
    List<Query$GetSharedMedicalRecords$getSharedMedicalRecords?>?
        getSharedMedicalRecords,
    String? $__typename,
  });
  TRes getSharedMedicalRecords(
      Iterable<Query$GetSharedMedicalRecords$getSharedMedicalRecords?>? Function(
              Iterable<
                  CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<
                      Query$GetSharedMedicalRecords$getSharedMedicalRecords>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetSharedMedicalRecords<TRes>
    implements CopyWith$Query$GetSharedMedicalRecords<TRes> {
  _CopyWithImpl$Query$GetSharedMedicalRecords(
    this._instance,
    this._then,
  );

  final Query$GetSharedMedicalRecords _instance;

  final TRes Function(Query$GetSharedMedicalRecords) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSharedMedicalRecords = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedMedicalRecords(
        getSharedMedicalRecords: getSharedMedicalRecords == _undefined
            ? _instance.getSharedMedicalRecords
            : (getSharedMedicalRecords as List<
                Query$GetSharedMedicalRecords$getSharedMedicalRecords?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getSharedMedicalRecords(
          Iterable<Query$GetSharedMedicalRecords$getSharedMedicalRecords?>? Function(
                  Iterable<
                      CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<
                          Query$GetSharedMedicalRecords$getSharedMedicalRecords>?>?)
              _fn) =>
      call(
          getSharedMedicalRecords:
              _fn(_instance.getSharedMedicalRecords?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetSharedMedicalRecords<TRes>
    implements CopyWith$Query$GetSharedMedicalRecords<TRes> {
  _CopyWithStubImpl$Query$GetSharedMedicalRecords(this._res);

  TRes _res;

  call({
    List<Query$GetSharedMedicalRecords$getSharedMedicalRecords?>?
        getSharedMedicalRecords,
    String? $__typename,
  }) =>
      _res;

  getSharedMedicalRecords(_fn) => _res;
}

const documentNodeQueryGetSharedMedicalRecords = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSharedMedicalRecords'),
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
        name: NameNode(value: 'getSharedMedicalRecords'),
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
            name: NameNode(value: 'recordId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recordType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
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
Query$GetSharedMedicalRecords _parserFn$Query$GetSharedMedicalRecords(
        Map<String, dynamic> data) =>
    Query$GetSharedMedicalRecords.fromJson(data);
typedef OnQueryComplete$Query$GetSharedMedicalRecords = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSharedMedicalRecords?,
);

class Options$Query$GetSharedMedicalRecords
    extends graphql.QueryOptions<Query$GetSharedMedicalRecords> {
  Options$Query$GetSharedMedicalRecords({
    String? operationName,
    required Variables$Query$GetSharedMedicalRecords variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedMedicalRecords? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSharedMedicalRecords? onComplete,
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
                        : _parserFn$Query$GetSharedMedicalRecords(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSharedMedicalRecords,
          parserFn: _parserFn$Query$GetSharedMedicalRecords,
        );

  final OnQueryComplete$Query$GetSharedMedicalRecords? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSharedMedicalRecords
    extends graphql.WatchQueryOptions<Query$GetSharedMedicalRecords> {
  WatchOptions$Query$GetSharedMedicalRecords({
    String? operationName,
    required Variables$Query$GetSharedMedicalRecords variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSharedMedicalRecords? typedOptimisticResult,
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
          document: documentNodeQueryGetSharedMedicalRecords,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSharedMedicalRecords,
        );
}

class FetchMoreOptions$Query$GetSharedMedicalRecords
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSharedMedicalRecords({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSharedMedicalRecords variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSharedMedicalRecords,
        );
}

extension ClientExtension$Query$GetSharedMedicalRecords
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSharedMedicalRecords>>
      query$GetSharedMedicalRecords(
              Options$Query$GetSharedMedicalRecords options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$GetSharedMedicalRecords>
      watchQuery$GetSharedMedicalRecords(
              WatchOptions$Query$GetSharedMedicalRecords options) =>
          this.watchQuery(options);
  void writeQuery$GetSharedMedicalRecords({
    required Query$GetSharedMedicalRecords data,
    required Variables$Query$GetSharedMedicalRecords variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetSharedMedicalRecords),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSharedMedicalRecords? readQuery$GetSharedMedicalRecords({
    required Variables$Query$GetSharedMedicalRecords variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQueryGetSharedMedicalRecords),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetSharedMedicalRecords.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSharedMedicalRecords>
    useQuery$GetSharedMedicalRecords(
            Options$Query$GetSharedMedicalRecords options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSharedMedicalRecords>
    useWatchQuery$GetSharedMedicalRecords(
            WatchOptions$Query$GetSharedMedicalRecords options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetSharedMedicalRecords$Widget
    extends graphql_flutter.Query<Query$GetSharedMedicalRecords> {
  Query$GetSharedMedicalRecords$Widget({
    widgets.Key? key,
    required Options$Query$GetSharedMedicalRecords options,
    required graphql_flutter.QueryBuilder<Query$GetSharedMedicalRecords>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSharedMedicalRecords$getSharedMedicalRecords {
  Query$GetSharedMedicalRecords$getSharedMedicalRecords({
    required this.recordId,
    required this.recordType,
    required this.content,
    required this.createdAt,
    this.$__typename = 'MedicalRecordDetail',
  });

  factory Query$GetSharedMedicalRecords$getSharedMedicalRecords.fromJson(
      Map<String, dynamic> json) {
    final l$recordId = json['recordId'];
    final l$recordType = json['recordType'];
    final l$content = json['content'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetSharedMedicalRecords$getSharedMedicalRecords(
      recordId: (l$recordId as String),
      recordType: (l$recordType as String),
      content: (l$content as String),
      createdAt: dateTimeFromJson(l$createdAt),
      $__typename: (l$$__typename as String),
    );
  }

  final String recordId;

  final String recordType;

  final String content;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordId = recordId;
    _resultData['recordId'] = l$recordId;
    final l$recordType = recordType;
    _resultData['recordType'] = l$recordType;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = dateTimeToJson(l$createdAt);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$recordType = recordType;
    final l$content = content;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$recordId,
      l$recordType,
      l$content,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSharedMedicalRecords$getSharedMedicalRecords) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
      return false;
    }
    final l$recordType = recordType;
    final lOther$recordType = other.recordType;
    if (l$recordType != lOther$recordType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
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

extension UtilityExtension$Query$GetSharedMedicalRecords$getSharedMedicalRecords
    on Query$GetSharedMedicalRecords$getSharedMedicalRecords {
  CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<
          Query$GetSharedMedicalRecords$getSharedMedicalRecords>
      get copyWith =>
          CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<
    TRes> {
  factory CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords(
    Query$GetSharedMedicalRecords$getSharedMedicalRecords instance,
    TRes Function(Query$GetSharedMedicalRecords$getSharedMedicalRecords) then,
  ) = _CopyWithImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords;

  factory CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords;

  TRes call({
    String? recordId,
    String? recordType,
    String? content,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords<TRes>
    implements
        CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<TRes> {
  _CopyWithImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords(
    this._instance,
    this._then,
  );

  final Query$GetSharedMedicalRecords$getSharedMedicalRecords _instance;

  final TRes Function(Query$GetSharedMedicalRecords$getSharedMedicalRecords)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? recordType = _undefined,
    Object? content = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSharedMedicalRecords$getSharedMedicalRecords(
        recordId: recordId == _undefined || recordId == null
            ? _instance.recordId
            : (recordId as String),
        recordType: recordType == _undefined || recordType == null
            ? _instance.recordType
            : (recordType as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords<
        TRes>
    implements
        CopyWith$Query$GetSharedMedicalRecords$getSharedMedicalRecords<TRes> {
  _CopyWithStubImpl$Query$GetSharedMedicalRecords$getSharedMedicalRecords(
      this._res);

  TRes _res;

  call({
    String? recordId,
    String? recordType,
    String? content,
    DateTime? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddMedicalRecord {
  factory Variables$Mutation$AddMedicalRecord({
    required String recordType,
    required String content,
  }) =>
      Variables$Mutation$AddMedicalRecord._({
        r'recordType': recordType,
        r'content': content,
      });

  Variables$Mutation$AddMedicalRecord._(this._$data);

  factory Variables$Mutation$AddMedicalRecord.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$recordType = data['recordType'];
    result$data['recordType'] = (l$recordType as String);
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    return Variables$Mutation$AddMedicalRecord._(result$data);
  }

  Map<String, dynamic> _$data;

  String get recordType => (_$data['recordType'] as String);

  String get content => (_$data['content'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$recordType = recordType;
    result$data['recordType'] = l$recordType;
    final l$content = content;
    result$data['content'] = l$content;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddMedicalRecord<
          Variables$Mutation$AddMedicalRecord>
      get copyWith => CopyWith$Variables$Mutation$AddMedicalRecord(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordType = recordType;
    final lOther$recordType = other.recordType;
    if (l$recordType != lOther$recordType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$recordType = recordType;
    final l$content = content;
    return Object.hashAll([
      l$recordType,
      l$content,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddMedicalRecord<TRes> {
  factory CopyWith$Variables$Mutation$AddMedicalRecord(
    Variables$Mutation$AddMedicalRecord instance,
    TRes Function(Variables$Mutation$AddMedicalRecord) then,
  ) = _CopyWithImpl$Variables$Mutation$AddMedicalRecord;

  factory CopyWith$Variables$Mutation$AddMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddMedicalRecord;

  TRes call({
    String? recordType,
    String? content,
  });
}

class _CopyWithImpl$Variables$Mutation$AddMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$AddMedicalRecord<TRes> {
  _CopyWithImpl$Variables$Mutation$AddMedicalRecord(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddMedicalRecord _instance;

  final TRes Function(Variables$Mutation$AddMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordType = _undefined,
    Object? content = _undefined,
  }) =>
      _then(Variables$Mutation$AddMedicalRecord._({
        ..._instance._$data,
        if (recordType != _undefined && recordType != null)
          'recordType': (recordType as String),
        if (content != _undefined && content != null)
          'content': (content as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$AddMedicalRecord<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddMedicalRecord(this._res);

  TRes _res;

  call({
    String? recordType,
    String? content,
  }) =>
      _res;
}

class Mutation$AddMedicalRecord {
  Mutation$AddMedicalRecord({
    this.addMedicalRecord,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddMedicalRecord.fromJson(Map<String, dynamic> json) {
    final l$addMedicalRecord = json['addMedicalRecord'];
    final l$$__typename = json['__typename'];
    return Mutation$AddMedicalRecord(
      addMedicalRecord: l$addMedicalRecord == null
          ? null
          : Mutation$AddMedicalRecord$addMedicalRecord.fromJson(
              (l$addMedicalRecord as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddMedicalRecord$addMedicalRecord? addMedicalRecord;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addMedicalRecord = addMedicalRecord;
    _resultData['addMedicalRecord'] = l$addMedicalRecord?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addMedicalRecord = addMedicalRecord;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addMedicalRecord,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addMedicalRecord = addMedicalRecord;
    final lOther$addMedicalRecord = other.addMedicalRecord;
    if (l$addMedicalRecord != lOther$addMedicalRecord) {
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

extension UtilityExtension$Mutation$AddMedicalRecord
    on Mutation$AddMedicalRecord {
  CopyWith$Mutation$AddMedicalRecord<Mutation$AddMedicalRecord> get copyWith =>
      CopyWith$Mutation$AddMedicalRecord(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddMedicalRecord<TRes> {
  factory CopyWith$Mutation$AddMedicalRecord(
    Mutation$AddMedicalRecord instance,
    TRes Function(Mutation$AddMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$AddMedicalRecord;

  factory CopyWith$Mutation$AddMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddMedicalRecord;

  TRes call({
    Mutation$AddMedicalRecord$addMedicalRecord? addMedicalRecord,
    String? $__typename,
  });
  CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes>
      get addMedicalRecord;
}

class _CopyWithImpl$Mutation$AddMedicalRecord<TRes>
    implements CopyWith$Mutation$AddMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$AddMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$AddMedicalRecord _instance;

  final TRes Function(Mutation$AddMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addMedicalRecord = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddMedicalRecord(
        addMedicalRecord: addMedicalRecord == _undefined
            ? _instance.addMedicalRecord
            : (addMedicalRecord as Mutation$AddMedicalRecord$addMedicalRecord?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes>
      get addMedicalRecord {
    final local$addMedicalRecord = _instance.addMedicalRecord;
    return local$addMedicalRecord == null
        ? CopyWith$Mutation$AddMedicalRecord$addMedicalRecord.stub(
            _then(_instance))
        : CopyWith$Mutation$AddMedicalRecord$addMedicalRecord(
            local$addMedicalRecord, (e) => call(addMedicalRecord: e));
  }
}

class _CopyWithStubImpl$Mutation$AddMedicalRecord<TRes>
    implements CopyWith$Mutation$AddMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$AddMedicalRecord(this._res);

  TRes _res;

  call({
    Mutation$AddMedicalRecord$addMedicalRecord? addMedicalRecord,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes>
      get addMedicalRecord =>
          CopyWith$Mutation$AddMedicalRecord$addMedicalRecord.stub(_res);
}

const documentNodeMutationAddMedicalRecord = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddMedicalRecord'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'recordType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
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
        name: NameNode(value: 'addMedicalRecord'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'recordType'),
            value: VariableNode(name: NameNode(value: 'recordType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'content'),
            value: VariableNode(name: NameNode(value: 'content')),
          ),
        ],
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
Mutation$AddMedicalRecord _parserFn$Mutation$AddMedicalRecord(
        Map<String, dynamic> data) =>
    Mutation$AddMedicalRecord.fromJson(data);
typedef OnMutationCompleted$Mutation$AddMedicalRecord = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddMedicalRecord?,
);

class Options$Mutation$AddMedicalRecord
    extends graphql.MutationOptions<Mutation$AddMedicalRecord> {
  Options$Mutation$AddMedicalRecord({
    String? operationName,
    required Variables$Mutation$AddMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddMedicalRecord>? update,
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
                        : _parserFn$Mutation$AddMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddMedicalRecord,
          parserFn: _parserFn$Mutation$AddMedicalRecord,
        );

  final OnMutationCompleted$Mutation$AddMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddMedicalRecord
    extends graphql.WatchQueryOptions<Mutation$AddMedicalRecord> {
  WatchOptions$Mutation$AddMedicalRecord({
    String? operationName,
    required Variables$Mutation$AddMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedicalRecord? typedOptimisticResult,
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
          document: documentNodeMutationAddMedicalRecord,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddMedicalRecord,
        );
}

extension ClientExtension$Mutation$AddMedicalRecord on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddMedicalRecord>>
      mutate$AddMedicalRecord(
              Options$Mutation$AddMedicalRecord options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddMedicalRecord>
      watchMutation$AddMedicalRecord(
              WatchOptions$Mutation$AddMedicalRecord options) =>
          this.watchMutation(options);
}

class Mutation$AddMedicalRecord$HookResult {
  Mutation$AddMedicalRecord$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddMedicalRecord runMutation;

  final graphql.QueryResult<Mutation$AddMedicalRecord> result;
}

Mutation$AddMedicalRecord$HookResult useMutation$AddMedicalRecord(
    [WidgetOptions$Mutation$AddMedicalRecord? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddMedicalRecord());
  return Mutation$AddMedicalRecord$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddMedicalRecord>
    useWatchMutation$AddMedicalRecord(
            WatchOptions$Mutation$AddMedicalRecord options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddMedicalRecord
    extends graphql.MutationOptions<Mutation$AddMedicalRecord> {
  WidgetOptions$Mutation$AddMedicalRecord({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddMedicalRecord>? update,
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
                        : _parserFn$Mutation$AddMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddMedicalRecord,
          parserFn: _parserFn$Mutation$AddMedicalRecord,
        );

  final OnMutationCompleted$Mutation$AddMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddMedicalRecord
    = graphql.MultiSourceResult<Mutation$AddMedicalRecord> Function(
  Variables$Mutation$AddMedicalRecord, {
  Object? optimisticResult,
  Mutation$AddMedicalRecord? typedOptimisticResult,
});
typedef Builder$Mutation$AddMedicalRecord = widgets.Widget Function(
  RunMutation$Mutation$AddMedicalRecord,
  graphql.QueryResult<Mutation$AddMedicalRecord>?,
);

class Mutation$AddMedicalRecord$Widget
    extends graphql_flutter.Mutation<Mutation$AddMedicalRecord> {
  Mutation$AddMedicalRecord$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddMedicalRecord? options,
    required Builder$Mutation$AddMedicalRecord builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddMedicalRecord(),
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

class Mutation$AddMedicalRecord$addMedicalRecord {
  Mutation$AddMedicalRecord$addMedicalRecord({
    required this.recordId,
    required this.message,
    this.$__typename = 'AddMedicalRecordResponse',
  });

  factory Mutation$AddMedicalRecord$addMedicalRecord.fromJson(
      Map<String, dynamic> json) {
    final l$recordId = json['recordId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$AddMedicalRecord$addMedicalRecord(
      recordId: (l$recordId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String recordId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordId = recordId;
    _resultData['recordId'] = l$recordId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$recordId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddMedicalRecord$addMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
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

extension UtilityExtension$Mutation$AddMedicalRecord$addMedicalRecord
    on Mutation$AddMedicalRecord$addMedicalRecord {
  CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<
          Mutation$AddMedicalRecord$addMedicalRecord>
      get copyWith => CopyWith$Mutation$AddMedicalRecord$addMedicalRecord(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes> {
  factory CopyWith$Mutation$AddMedicalRecord$addMedicalRecord(
    Mutation$AddMedicalRecord$addMedicalRecord instance,
    TRes Function(Mutation$AddMedicalRecord$addMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$AddMedicalRecord$addMedicalRecord;

  factory CopyWith$Mutation$AddMedicalRecord$addMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddMedicalRecord$addMedicalRecord;

  TRes call({
    String? recordId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddMedicalRecord$addMedicalRecord<TRes>
    implements CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$AddMedicalRecord$addMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$AddMedicalRecord$addMedicalRecord _instance;

  final TRes Function(Mutation$AddMedicalRecord$addMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddMedicalRecord$addMedicalRecord(
        recordId: recordId == _undefined || recordId == null
            ? _instance.recordId
            : (recordId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddMedicalRecord$addMedicalRecord<TRes>
    implements CopyWith$Mutation$AddMedicalRecord$addMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$AddMedicalRecord$addMedicalRecord(this._res);

  TRes _res;

  call({
    String? recordId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateMedicalRecord {
  factory Variables$Mutation$UpdateMedicalRecord({
    required String recordId,
    String? recordType,
    String? content,
  }) =>
      Variables$Mutation$UpdateMedicalRecord._({
        r'recordId': recordId,
        if (recordType != null) r'recordType': recordType,
        if (content != null) r'content': content,
      });

  Variables$Mutation$UpdateMedicalRecord._(this._$data);

  factory Variables$Mutation$UpdateMedicalRecord.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$recordId = data['recordId'];
    result$data['recordId'] = (l$recordId as String);
    if (data.containsKey('recordType')) {
      final l$recordType = data['recordType'];
      result$data['recordType'] = (l$recordType as String?);
    }
    if (data.containsKey('content')) {
      final l$content = data['content'];
      result$data['content'] = (l$content as String?);
    }
    return Variables$Mutation$UpdateMedicalRecord._(result$data);
  }

  Map<String, dynamic> _$data;

  String get recordId => (_$data['recordId'] as String);

  String? get recordType => (_$data['recordType'] as String?);

  String? get content => (_$data['content'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$recordId = recordId;
    result$data['recordId'] = l$recordId;
    if (_$data.containsKey('recordType')) {
      final l$recordType = recordType;
      result$data['recordType'] = l$recordType;
    }
    if (_$data.containsKey('content')) {
      final l$content = content;
      result$data['content'] = l$content;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMedicalRecord<
          Variables$Mutation$UpdateMedicalRecord>
      get copyWith => CopyWith$Variables$Mutation$UpdateMedicalRecord(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
      return false;
    }
    final l$recordType = recordType;
    final lOther$recordType = other.recordType;
    if (_$data.containsKey('recordType') !=
        other._$data.containsKey('recordType')) {
      return false;
    }
    if (l$recordType != lOther$recordType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (_$data.containsKey('content') != other._$data.containsKey('content')) {
      return false;
    }
    if (l$content != lOther$content) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$recordType = recordType;
    final l$content = content;
    return Object.hashAll([
      l$recordId,
      _$data.containsKey('recordType') ? l$recordType : const {},
      _$data.containsKey('content') ? l$content : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateMedicalRecord<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMedicalRecord(
    Variables$Mutation$UpdateMedicalRecord instance,
    TRes Function(Variables$Mutation$UpdateMedicalRecord) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMedicalRecord;

  factory CopyWith$Variables$Mutation$UpdateMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMedicalRecord;

  TRes call({
    String? recordId,
    String? recordType,
    String? content,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedicalRecord<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMedicalRecord(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateMedicalRecord _instance;

  final TRes Function(Variables$Mutation$UpdateMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? recordType = _undefined,
    Object? content = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateMedicalRecord._({
        ..._instance._$data,
        if (recordId != _undefined && recordId != null)
          'recordId': (recordId as String),
        if (recordType != _undefined) 'recordType': (recordType as String?),
        if (content != _undefined) 'content': (content as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedicalRecord<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMedicalRecord(this._res);

  TRes _res;

  call({
    String? recordId,
    String? recordType,
    String? content,
  }) =>
      _res;
}

class Mutation$UpdateMedicalRecord {
  Mutation$UpdateMedicalRecord({
    this.updateMedicalRecord,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateMedicalRecord.fromJson(Map<String, dynamic> json) {
    final l$updateMedicalRecord = json['updateMedicalRecord'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedicalRecord(
      updateMedicalRecord: l$updateMedicalRecord == null
          ? null
          : Mutation$UpdateMedicalRecord$updateMedicalRecord.fromJson(
              (l$updateMedicalRecord as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMedicalRecord$updateMedicalRecord? updateMedicalRecord;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMedicalRecord = updateMedicalRecord;
    _resultData['updateMedicalRecord'] = l$updateMedicalRecord?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMedicalRecord = updateMedicalRecord;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateMedicalRecord,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMedicalRecord = updateMedicalRecord;
    final lOther$updateMedicalRecord = other.updateMedicalRecord;
    if (l$updateMedicalRecord != lOther$updateMedicalRecord) {
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

extension UtilityExtension$Mutation$UpdateMedicalRecord
    on Mutation$UpdateMedicalRecord {
  CopyWith$Mutation$UpdateMedicalRecord<Mutation$UpdateMedicalRecord>
      get copyWith => CopyWith$Mutation$UpdateMedicalRecord(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMedicalRecord<TRes> {
  factory CopyWith$Mutation$UpdateMedicalRecord(
    Mutation$UpdateMedicalRecord instance,
    TRes Function(Mutation$UpdateMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$UpdateMedicalRecord;

  factory CopyWith$Mutation$UpdateMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedicalRecord;

  TRes call({
    Mutation$UpdateMedicalRecord$updateMedicalRecord? updateMedicalRecord,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes>
      get updateMedicalRecord;
}

class _CopyWithImpl$Mutation$UpdateMedicalRecord<TRes>
    implements CopyWith$Mutation$UpdateMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$UpdateMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedicalRecord _instance;

  final TRes Function(Mutation$UpdateMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMedicalRecord = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedicalRecord(
        updateMedicalRecord: updateMedicalRecord == _undefined
            ? _instance.updateMedicalRecord
            : (updateMedicalRecord
                as Mutation$UpdateMedicalRecord$updateMedicalRecord?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes>
      get updateMedicalRecord {
    final local$updateMedicalRecord = _instance.updateMedicalRecord;
    return local$updateMedicalRecord == null
        ? CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord(
            local$updateMedicalRecord, (e) => call(updateMedicalRecord: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateMedicalRecord<TRes>
    implements CopyWith$Mutation$UpdateMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedicalRecord(this._res);

  TRes _res;

  call({
    Mutation$UpdateMedicalRecord$updateMedicalRecord? updateMedicalRecord,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes>
      get updateMedicalRecord =>
          CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord.stub(_res);
}

const documentNodeMutationUpdateMedicalRecord = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateMedicalRecord'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'recordId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'recordType')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
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
        name: NameNode(value: 'updateMedicalRecord'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'recordId'),
            value: VariableNode(name: NameNode(value: 'recordId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'recordType'),
            value: VariableNode(name: NameNode(value: 'recordType')),
          ),
          ArgumentNode(
            name: NameNode(value: 'content'),
            value: VariableNode(name: NameNode(value: 'content')),
          ),
        ],
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
Mutation$UpdateMedicalRecord _parserFn$Mutation$UpdateMedicalRecord(
        Map<String, dynamic> data) =>
    Mutation$UpdateMedicalRecord.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMedicalRecord = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateMedicalRecord?,
);

class Options$Mutation$UpdateMedicalRecord
    extends graphql.MutationOptions<Mutation$UpdateMedicalRecord> {
  Options$Mutation$UpdateMedicalRecord({
    String? operationName,
    required Variables$Mutation$UpdateMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedicalRecord>? update,
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
                        : _parserFn$Mutation$UpdateMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedicalRecord,
          parserFn: _parserFn$Mutation$UpdateMedicalRecord,
        );

  final OnMutationCompleted$Mutation$UpdateMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateMedicalRecord
    extends graphql.WatchQueryOptions<Mutation$UpdateMedicalRecord> {
  WatchOptions$Mutation$UpdateMedicalRecord({
    String? operationName,
    required Variables$Mutation$UpdateMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicalRecord? typedOptimisticResult,
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
          document: documentNodeMutationUpdateMedicalRecord,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateMedicalRecord,
        );
}

extension ClientExtension$Mutation$UpdateMedicalRecord
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMedicalRecord>>
      mutate$UpdateMedicalRecord(
              Options$Mutation$UpdateMedicalRecord options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateMedicalRecord>
      watchMutation$UpdateMedicalRecord(
              WatchOptions$Mutation$UpdateMedicalRecord options) =>
          this.watchMutation(options);
}

class Mutation$UpdateMedicalRecord$HookResult {
  Mutation$UpdateMedicalRecord$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateMedicalRecord runMutation;

  final graphql.QueryResult<Mutation$UpdateMedicalRecord> result;
}

Mutation$UpdateMedicalRecord$HookResult useMutation$UpdateMedicalRecord(
    [WidgetOptions$Mutation$UpdateMedicalRecord? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateMedicalRecord());
  return Mutation$UpdateMedicalRecord$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateMedicalRecord>
    useWatchMutation$UpdateMedicalRecord(
            WatchOptions$Mutation$UpdateMedicalRecord options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateMedicalRecord
    extends graphql.MutationOptions<Mutation$UpdateMedicalRecord> {
  WidgetOptions$Mutation$UpdateMedicalRecord({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedicalRecord>? update,
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
                        : _parserFn$Mutation$UpdateMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedicalRecord,
          parserFn: _parserFn$Mutation$UpdateMedicalRecord,
        );

  final OnMutationCompleted$Mutation$UpdateMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateMedicalRecord
    = graphql.MultiSourceResult<Mutation$UpdateMedicalRecord> Function(
  Variables$Mutation$UpdateMedicalRecord, {
  Object? optimisticResult,
  Mutation$UpdateMedicalRecord? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateMedicalRecord = widgets.Widget Function(
  RunMutation$Mutation$UpdateMedicalRecord,
  graphql.QueryResult<Mutation$UpdateMedicalRecord>?,
);

class Mutation$UpdateMedicalRecord$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateMedicalRecord> {
  Mutation$UpdateMedicalRecord$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateMedicalRecord? options,
    required Builder$Mutation$UpdateMedicalRecord builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateMedicalRecord(),
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

class Mutation$UpdateMedicalRecord$updateMedicalRecord {
  Mutation$UpdateMedicalRecord$updateMedicalRecord({
    required this.recordId,
    required this.message,
    this.$__typename = 'UpdateMedicalRecordResponse',
  });

  factory Mutation$UpdateMedicalRecord$updateMedicalRecord.fromJson(
      Map<String, dynamic> json) {
    final l$recordId = json['recordId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedicalRecord$updateMedicalRecord(
      recordId: (l$recordId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String recordId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordId = recordId;
    _resultData['recordId'] = l$recordId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$recordId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateMedicalRecord$updateMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
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

extension UtilityExtension$Mutation$UpdateMedicalRecord$updateMedicalRecord
    on Mutation$UpdateMedicalRecord$updateMedicalRecord {
  CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<
          Mutation$UpdateMedicalRecord$updateMedicalRecord>
      get copyWith => CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes> {
  factory CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord(
    Mutation$UpdateMedicalRecord$updateMedicalRecord instance,
    TRes Function(Mutation$UpdateMedicalRecord$updateMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord;

  factory CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord;

  TRes call({
    String? recordId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes>
    implements CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedicalRecord$updateMedicalRecord _instance;

  final TRes Function(Mutation$UpdateMedicalRecord$updateMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedicalRecord$updateMedicalRecord(
        recordId: recordId == _undefined || recordId == null
            ? _instance.recordId
            : (recordId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes>
    implements CopyWith$Mutation$UpdateMedicalRecord$updateMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedicalRecord$updateMedicalRecord(this._res);

  TRes _res;

  call({
    String? recordId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteMedicalRecord {
  factory Variables$Mutation$DeleteMedicalRecord({required String recordId}) =>
      Variables$Mutation$DeleteMedicalRecord._({
        r'recordId': recordId,
      });

  Variables$Mutation$DeleteMedicalRecord._(this._$data);

  factory Variables$Mutation$DeleteMedicalRecord.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$recordId = data['recordId'];
    result$data['recordId'] = (l$recordId as String);
    return Variables$Mutation$DeleteMedicalRecord._(result$data);
  }

  Map<String, dynamic> _$data;

  String get recordId => (_$data['recordId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$recordId = recordId;
    result$data['recordId'] = l$recordId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMedicalRecord<
          Variables$Mutation$DeleteMedicalRecord>
      get copyWith => CopyWith$Variables$Mutation$DeleteMedicalRecord(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordId = recordId;
    final lOther$recordId = other.recordId;
    if (l$recordId != lOther$recordId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$recordId = recordId;
    return Object.hashAll([l$recordId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteMedicalRecord<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMedicalRecord(
    Variables$Mutation$DeleteMedicalRecord instance,
    TRes Function(Variables$Mutation$DeleteMedicalRecord) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMedicalRecord;

  factory CopyWith$Variables$Mutation$DeleteMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMedicalRecord;

  TRes call({String? recordId});
}

class _CopyWithImpl$Variables$Mutation$DeleteMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$DeleteMedicalRecord<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMedicalRecord(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteMedicalRecord _instance;

  final TRes Function(Variables$Mutation$DeleteMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? recordId = _undefined}) =>
      _then(Variables$Mutation$DeleteMedicalRecord._({
        ..._instance._$data,
        if (recordId != _undefined && recordId != null)
          'recordId': (recordId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMedicalRecord<TRes>
    implements CopyWith$Variables$Mutation$DeleteMedicalRecord<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMedicalRecord(this._res);

  TRes _res;

  call({String? recordId}) => _res;
}

class Mutation$DeleteMedicalRecord {
  Mutation$DeleteMedicalRecord({
    this.deleteMedicalRecord,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteMedicalRecord.fromJson(Map<String, dynamic> json) {
    final l$deleteMedicalRecord = json['deleteMedicalRecord'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMedicalRecord(
      deleteMedicalRecord: l$deleteMedicalRecord == null
          ? null
          : Mutation$DeleteMedicalRecord$deleteMedicalRecord.fromJson(
              (l$deleteMedicalRecord as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMedicalRecord$deleteMedicalRecord? deleteMedicalRecord;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMedicalRecord = deleteMedicalRecord;
    _resultData['deleteMedicalRecord'] = l$deleteMedicalRecord?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMedicalRecord = deleteMedicalRecord;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteMedicalRecord,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteMedicalRecord) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMedicalRecord = deleteMedicalRecord;
    final lOther$deleteMedicalRecord = other.deleteMedicalRecord;
    if (l$deleteMedicalRecord != lOther$deleteMedicalRecord) {
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

extension UtilityExtension$Mutation$DeleteMedicalRecord
    on Mutation$DeleteMedicalRecord {
  CopyWith$Mutation$DeleteMedicalRecord<Mutation$DeleteMedicalRecord>
      get copyWith => CopyWith$Mutation$DeleteMedicalRecord(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteMedicalRecord<TRes> {
  factory CopyWith$Mutation$DeleteMedicalRecord(
    Mutation$DeleteMedicalRecord instance,
    TRes Function(Mutation$DeleteMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$DeleteMedicalRecord;

  factory CopyWith$Mutation$DeleteMedicalRecord.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMedicalRecord;

  TRes call({
    Mutation$DeleteMedicalRecord$deleteMedicalRecord? deleteMedicalRecord,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes>
      get deleteMedicalRecord;
}

class _CopyWithImpl$Mutation$DeleteMedicalRecord<TRes>
    implements CopyWith$Mutation$DeleteMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$DeleteMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMedicalRecord _instance;

  final TRes Function(Mutation$DeleteMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMedicalRecord = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteMedicalRecord(
        deleteMedicalRecord: deleteMedicalRecord == _undefined
            ? _instance.deleteMedicalRecord
            : (deleteMedicalRecord
                as Mutation$DeleteMedicalRecord$deleteMedicalRecord?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes>
      get deleteMedicalRecord {
    final local$deleteMedicalRecord = _instance.deleteMedicalRecord;
    return local$deleteMedicalRecord == null
        ? CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord(
            local$deleteMedicalRecord, (e) => call(deleteMedicalRecord: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteMedicalRecord<TRes>
    implements CopyWith$Mutation$DeleteMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMedicalRecord(this._res);

  TRes _res;

  call({
    Mutation$DeleteMedicalRecord$deleteMedicalRecord? deleteMedicalRecord,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes>
      get deleteMedicalRecord =>
          CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord.stub(_res);
}

const documentNodeMutationDeleteMedicalRecord = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteMedicalRecord'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'recordId')),
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
        name: NameNode(value: 'deleteMedicalRecord'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'recordId'),
            value: VariableNode(name: NameNode(value: 'recordId')),
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
Mutation$DeleteMedicalRecord _parserFn$Mutation$DeleteMedicalRecord(
        Map<String, dynamic> data) =>
    Mutation$DeleteMedicalRecord.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMedicalRecord = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$DeleteMedicalRecord?,
);

class Options$Mutation$DeleteMedicalRecord
    extends graphql.MutationOptions<Mutation$DeleteMedicalRecord> {
  Options$Mutation$DeleteMedicalRecord({
    String? operationName,
    required Variables$Mutation$DeleteMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMedicalRecord>? update,
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
                        : _parserFn$Mutation$DeleteMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteMedicalRecord,
          parserFn: _parserFn$Mutation$DeleteMedicalRecord,
        );

  final OnMutationCompleted$Mutation$DeleteMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteMedicalRecord
    extends graphql.WatchQueryOptions<Mutation$DeleteMedicalRecord> {
  WatchOptions$Mutation$DeleteMedicalRecord({
    String? operationName,
    required Variables$Mutation$DeleteMedicalRecord variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedicalRecord? typedOptimisticResult,
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
          document: documentNodeMutationDeleteMedicalRecord,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteMedicalRecord,
        );
}

extension ClientExtension$Mutation$DeleteMedicalRecord
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMedicalRecord>>
      mutate$DeleteMedicalRecord(
              Options$Mutation$DeleteMedicalRecord options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteMedicalRecord>
      watchMutation$DeleteMedicalRecord(
              WatchOptions$Mutation$DeleteMedicalRecord options) =>
          this.watchMutation(options);
}

class Mutation$DeleteMedicalRecord$HookResult {
  Mutation$DeleteMedicalRecord$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteMedicalRecord runMutation;

  final graphql.QueryResult<Mutation$DeleteMedicalRecord> result;
}

Mutation$DeleteMedicalRecord$HookResult useMutation$DeleteMedicalRecord(
    [WidgetOptions$Mutation$DeleteMedicalRecord? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteMedicalRecord());
  return Mutation$DeleteMedicalRecord$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMedicalRecord>
    useWatchMutation$DeleteMedicalRecord(
            WatchOptions$Mutation$DeleteMedicalRecord options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMedicalRecord
    extends graphql.MutationOptions<Mutation$DeleteMedicalRecord> {
  WidgetOptions$Mutation$DeleteMedicalRecord({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedicalRecord? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMedicalRecord? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMedicalRecord>? update,
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
                        : _parserFn$Mutation$DeleteMedicalRecord(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteMedicalRecord,
          parserFn: _parserFn$Mutation$DeleteMedicalRecord,
        );

  final OnMutationCompleted$Mutation$DeleteMedicalRecord? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteMedicalRecord
    = graphql.MultiSourceResult<Mutation$DeleteMedicalRecord> Function(
  Variables$Mutation$DeleteMedicalRecord, {
  Object? optimisticResult,
  Mutation$DeleteMedicalRecord? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteMedicalRecord = widgets.Widget Function(
  RunMutation$Mutation$DeleteMedicalRecord,
  graphql.QueryResult<Mutation$DeleteMedicalRecord>?,
);

class Mutation$DeleteMedicalRecord$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMedicalRecord> {
  Mutation$DeleteMedicalRecord$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMedicalRecord? options,
    required Builder$Mutation$DeleteMedicalRecord builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteMedicalRecord(),
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

class Mutation$DeleteMedicalRecord$deleteMedicalRecord {
  Mutation$DeleteMedicalRecord$deleteMedicalRecord({
    required this.message,
    this.$__typename = 'DeleteMedicalRecordResponse',
  });

  factory Mutation$DeleteMedicalRecord$deleteMedicalRecord.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMedicalRecord$deleteMedicalRecord(
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
    if (!(other is Mutation$DeleteMedicalRecord$deleteMedicalRecord) ||
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

extension UtilityExtension$Mutation$DeleteMedicalRecord$deleteMedicalRecord
    on Mutation$DeleteMedicalRecord$deleteMedicalRecord {
  CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<
          Mutation$DeleteMedicalRecord$deleteMedicalRecord>
      get copyWith => CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes> {
  factory CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord(
    Mutation$DeleteMedicalRecord$deleteMedicalRecord instance,
    TRes Function(Mutation$DeleteMedicalRecord$deleteMedicalRecord) then,
  ) = _CopyWithImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord;

  factory CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes>
    implements CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes> {
  _CopyWithImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMedicalRecord$deleteMedicalRecord _instance;

  final TRes Function(Mutation$DeleteMedicalRecord$deleteMedicalRecord) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteMedicalRecord$deleteMedicalRecord(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes>
    implements CopyWith$Mutation$DeleteMedicalRecord$deleteMedicalRecord<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMedicalRecord$deleteMedicalRecord(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
