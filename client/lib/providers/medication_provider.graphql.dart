import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetMedications {
  Query$GetMedications({
    this.getMedications,
    this.$__typename = 'Query',
  });

  factory Query$GetMedications.fromJson(Map<String, dynamic> json) {
    final l$getMedications = json['getMedications'];
    final l$$__typename = json['__typename'];
    return Query$GetMedications(
      getMedications: (l$getMedications as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetMedications$getMedications.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMedications$getMedications?>? getMedications;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMedications = getMedications;
    _resultData['getMedications'] =
        l$getMedications?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMedications = getMedications;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMedications == null
          ? null
          : Object.hashAll(l$getMedications.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedications) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMedications = getMedications;
    final lOther$getMedications = other.getMedications;
    if (l$getMedications != null && lOther$getMedications != null) {
      if (l$getMedications.length != lOther$getMedications.length) {
        return false;
      }
      for (int i = 0; i < l$getMedications.length; i++) {
        final l$getMedications$entry = l$getMedications[i];
        final lOther$getMedications$entry = lOther$getMedications[i];
        if (l$getMedications$entry != lOther$getMedications$entry) {
          return false;
        }
      }
    } else if (l$getMedications != lOther$getMedications) {
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

extension UtilityExtension$Query$GetMedications on Query$GetMedications {
  CopyWith$Query$GetMedications<Query$GetMedications> get copyWith =>
      CopyWith$Query$GetMedications(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMedications<TRes> {
  factory CopyWith$Query$GetMedications(
    Query$GetMedications instance,
    TRes Function(Query$GetMedications) then,
  ) = _CopyWithImpl$Query$GetMedications;

  factory CopyWith$Query$GetMedications.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedications;

  TRes call({
    List<Query$GetMedications$getMedications?>? getMedications,
    String? $__typename,
  });
  TRes getMedications(
      Iterable<Query$GetMedications$getMedications?>? Function(
              Iterable<
                  CopyWith$Query$GetMedications$getMedications<
                      Query$GetMedications$getMedications>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetMedications<TRes>
    implements CopyWith$Query$GetMedications<TRes> {
  _CopyWithImpl$Query$GetMedications(
    this._instance,
    this._then,
  );

  final Query$GetMedications _instance;

  final TRes Function(Query$GetMedications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMedications = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedications(
        getMedications: getMedications == _undefined
            ? _instance.getMedications
            : (getMedications as List<Query$GetMedications$getMedications?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getMedications(
          Iterable<Query$GetMedications$getMedications?>? Function(
                  Iterable<
                      CopyWith$Query$GetMedications$getMedications<
                          Query$GetMedications$getMedications>?>?)
              _fn) =>
      call(
          getMedications: _fn(_instance.getMedications?.map((e) => e == null
              ? null
              : CopyWith$Query$GetMedications$getMedications(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Query$GetMedications<TRes>
    implements CopyWith$Query$GetMedications<TRes> {
  _CopyWithStubImpl$Query$GetMedications(this._res);

  TRes _res;

  call({
    List<Query$GetMedications$getMedications?>? getMedications,
    String? $__typename,
  }) =>
      _res;

  getMedications(_fn) => _res;
}

const documentNodeQueryGetMedications = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMedications'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getMedications'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'medicationId'),
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
            name: NameNode(value: 'dosage'),
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
            name: NameNode(value: 'frequency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'inventory'),
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
Query$GetMedications _parserFn$Query$GetMedications(
        Map<String, dynamic> data) =>
    Query$GetMedications.fromJson(data);
typedef OnQueryComplete$Query$GetMedications = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMedications?,
);

class Options$Query$GetMedications
    extends graphql.QueryOptions<Query$GetMedications> {
  Options$Query$GetMedications({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedications? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMedications? onComplete,
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
                    data == null ? null : _parserFn$Query$GetMedications(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMedications,
          parserFn: _parserFn$Query$GetMedications,
        );

  final OnQueryComplete$Query$GetMedications? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMedications
    extends graphql.WatchQueryOptions<Query$GetMedications> {
  WatchOptions$Query$GetMedications({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedications? typedOptimisticResult,
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
          document: documentNodeQueryGetMedications,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMedications,
        );
}

class FetchMoreOptions$Query$GetMedications extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMedications(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMedications,
        );
}

extension ClientExtension$Query$GetMedications on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMedications>> query$GetMedications(
          [Options$Query$GetMedications? options]) async =>
      await this.query(options ?? Options$Query$GetMedications());
  graphql.ObservableQuery<Query$GetMedications> watchQuery$GetMedications(
          [WatchOptions$Query$GetMedications? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMedications());
  void writeQuery$GetMedications({
    required Query$GetMedications data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetMedications)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMedications? readQuery$GetMedications({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetMedications)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMedications.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMedications> useQuery$GetMedications(
        [Options$Query$GetMedications? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetMedications());
graphql.ObservableQuery<Query$GetMedications> useWatchQuery$GetMedications(
        [WatchOptions$Query$GetMedications? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$GetMedications());

class Query$GetMedications$Widget
    extends graphql_flutter.Query<Query$GetMedications> {
  Query$GetMedications$Widget({
    widgets.Key? key,
    Options$Query$GetMedications? options,
    required graphql_flutter.QueryBuilder<Query$GetMedications> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMedications(),
          builder: builder,
        );
}

class Query$GetMedications$getMedications {
  Query$GetMedications$getMedications({
    required this.medicationId,
    required this.name,
    required this.dosage,
    required this.unit,
    required this.frequency,
    required this.inventory,
    this.$__typename = 'MedicationDetail',
  });

  factory Query$GetMedications$getMedications.fromJson(
      Map<String, dynamic> json) {
    final l$medicationId = json['medicationId'];
    final l$name = json['name'];
    final l$dosage = json['dosage'];
    final l$unit = json['unit'];
    final l$frequency = json['frequency'];
    final l$inventory = json['inventory'];
    final l$$__typename = json['__typename'];
    return Query$GetMedications$getMedications(
      medicationId: (l$medicationId as String),
      name: (l$name as String),
      dosage: (l$dosage as num).toDouble(),
      unit: (l$unit as String),
      frequency: (l$frequency as String),
      inventory: (l$inventory as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String medicationId;

  final String name;

  final double dosage;

  final String unit;

  final String frequency;

  final double inventory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$medicationId = medicationId;
    _resultData['medicationId'] = l$medicationId;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$dosage = dosage;
    _resultData['dosage'] = l$dosage;
    final l$unit = unit;
    _resultData['unit'] = l$unit;
    final l$frequency = frequency;
    _resultData['frequency'] = l$frequency;
    final l$inventory = inventory;
    _resultData['inventory'] = l$inventory;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    final l$name = name;
    final l$dosage = dosage;
    final l$unit = unit;
    final l$frequency = frequency;
    final l$inventory = inventory;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$medicationId,
      l$name,
      l$dosage,
      l$unit,
      l$frequency,
      l$inventory,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedications$getMedications) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$dosage = dosage;
    final lOther$dosage = other.dosage;
    if (l$dosage != lOther$dosage) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$inventory = inventory;
    final lOther$inventory = other.inventory;
    if (l$inventory != lOther$inventory) {
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

extension UtilityExtension$Query$GetMedications$getMedications
    on Query$GetMedications$getMedications {
  CopyWith$Query$GetMedications$getMedications<
          Query$GetMedications$getMedications>
      get copyWith => CopyWith$Query$GetMedications$getMedications(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMedications$getMedications<TRes> {
  factory CopyWith$Query$GetMedications$getMedications(
    Query$GetMedications$getMedications instance,
    TRes Function(Query$GetMedications$getMedications) then,
  ) = _CopyWithImpl$Query$GetMedications$getMedications;

  factory CopyWith$Query$GetMedications$getMedications.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedications$getMedications;

  TRes call({
    String? medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMedications$getMedications<TRes>
    implements CopyWith$Query$GetMedications$getMedications<TRes> {
  _CopyWithImpl$Query$GetMedications$getMedications(
    this._instance,
    this._then,
  );

  final Query$GetMedications$getMedications _instance;

  final TRes Function(Query$GetMedications$getMedications) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medicationId = _undefined,
    Object? name = _undefined,
    Object? dosage = _undefined,
    Object? unit = _undefined,
    Object? frequency = _undefined,
    Object? inventory = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedications$getMedications(
        medicationId: medicationId == _undefined || medicationId == null
            ? _instance.medicationId
            : (medicationId as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        dosage: dosage == _undefined || dosage == null
            ? _instance.dosage
            : (dosage as double),
        unit: unit == _undefined || unit == null
            ? _instance.unit
            : (unit as String),
        frequency: frequency == _undefined || frequency == null
            ? _instance.frequency
            : (frequency as String),
        inventory: inventory == _undefined || inventory == null
            ? _instance.inventory
            : (inventory as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMedications$getMedications<TRes>
    implements CopyWith$Query$GetMedications$getMedications<TRes> {
  _CopyWithStubImpl$Query$GetMedications$getMedications(this._res);

  TRes _res;

  call({
    String? medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$AddMedication {
  factory Variables$Mutation$AddMedication({
    required String name,
    required double dosage,
    required String unit,
    required String frequency,
    required double inventory,
  }) =>
      Variables$Mutation$AddMedication._({
        r'name': name,
        r'dosage': dosage,
        r'unit': unit,
        r'frequency': frequency,
        r'inventory': inventory,
      });

  Variables$Mutation$AddMedication._(this._$data);

  factory Variables$Mutation$AddMedication.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$dosage = data['dosage'];
    result$data['dosage'] = (l$dosage as num).toDouble();
    final l$unit = data['unit'];
    result$data['unit'] = (l$unit as String);
    final l$frequency = data['frequency'];
    result$data['frequency'] = (l$frequency as String);
    final l$inventory = data['inventory'];
    result$data['inventory'] = (l$inventory as num).toDouble();
    return Variables$Mutation$AddMedication._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  double get dosage => (_$data['dosage'] as double);

  String get unit => (_$data['unit'] as String);

  String get frequency => (_$data['frequency'] as String);

  double get inventory => (_$data['inventory'] as double);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$dosage = dosage;
    result$data['dosage'] = l$dosage;
    final l$unit = unit;
    result$data['unit'] = l$unit;
    final l$frequency = frequency;
    result$data['frequency'] = l$frequency;
    final l$inventory = inventory;
    result$data['inventory'] = l$inventory;
    return result$data;
  }

  CopyWith$Variables$Mutation$AddMedication<Variables$Mutation$AddMedication>
      get copyWith => CopyWith$Variables$Mutation$AddMedication(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$AddMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$dosage = dosage;
    final lOther$dosage = other.dosage;
    if (l$dosage != lOther$dosage) {
      return false;
    }
    final l$unit = unit;
    final lOther$unit = other.unit;
    if (l$unit != lOther$unit) {
      return false;
    }
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$inventory = inventory;
    final lOther$inventory = other.inventory;
    if (l$inventory != lOther$inventory) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$dosage = dosage;
    final l$unit = unit;
    final l$frequency = frequency;
    final l$inventory = inventory;
    return Object.hashAll([
      l$name,
      l$dosage,
      l$unit,
      l$frequency,
      l$inventory,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$AddMedication<TRes> {
  factory CopyWith$Variables$Mutation$AddMedication(
    Variables$Mutation$AddMedication instance,
    TRes Function(Variables$Mutation$AddMedication) then,
  ) = _CopyWithImpl$Variables$Mutation$AddMedication;

  factory CopyWith$Variables$Mutation$AddMedication.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddMedication;

  TRes call({
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  });
}

class _CopyWithImpl$Variables$Mutation$AddMedication<TRes>
    implements CopyWith$Variables$Mutation$AddMedication<TRes> {
  _CopyWithImpl$Variables$Mutation$AddMedication(
    this._instance,
    this._then,
  );

  final Variables$Mutation$AddMedication _instance;

  final TRes Function(Variables$Mutation$AddMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? dosage = _undefined,
    Object? unit = _undefined,
    Object? frequency = _undefined,
    Object? inventory = _undefined,
  }) =>
      _then(Variables$Mutation$AddMedication._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (dosage != _undefined && dosage != null)
          'dosage': (dosage as double),
        if (unit != _undefined && unit != null) 'unit': (unit as String),
        if (frequency != _undefined && frequency != null)
          'frequency': (frequency as String),
        if (inventory != _undefined && inventory != null)
          'inventory': (inventory as double),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$AddMedication<TRes>
    implements CopyWith$Variables$Mutation$AddMedication<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddMedication(this._res);

  TRes _res;

  call({
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) =>
      _res;
}

class Mutation$AddMedication {
  Mutation$AddMedication({
    this.addMedication,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddMedication.fromJson(Map<String, dynamic> json) {
    final l$addMedication = json['addMedication'];
    final l$$__typename = json['__typename'];
    return Mutation$AddMedication(
      addMedication: l$addMedication == null
          ? null
          : Mutation$AddMedication$addMedication.fromJson(
              (l$addMedication as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddMedication$addMedication? addMedication;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addMedication = addMedication;
    _resultData['addMedication'] = l$addMedication?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addMedication = addMedication;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$addMedication,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$addMedication = addMedication;
    final lOther$addMedication = other.addMedication;
    if (l$addMedication != lOther$addMedication) {
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

extension UtilityExtension$Mutation$AddMedication on Mutation$AddMedication {
  CopyWith$Mutation$AddMedication<Mutation$AddMedication> get copyWith =>
      CopyWith$Mutation$AddMedication(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$AddMedication<TRes> {
  factory CopyWith$Mutation$AddMedication(
    Mutation$AddMedication instance,
    TRes Function(Mutation$AddMedication) then,
  ) = _CopyWithImpl$Mutation$AddMedication;

  factory CopyWith$Mutation$AddMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddMedication;

  TRes call({
    Mutation$AddMedication$addMedication? addMedication,
    String? $__typename,
  });
  CopyWith$Mutation$AddMedication$addMedication<TRes> get addMedication;
}

class _CopyWithImpl$Mutation$AddMedication<TRes>
    implements CopyWith$Mutation$AddMedication<TRes> {
  _CopyWithImpl$Mutation$AddMedication(
    this._instance,
    this._then,
  );

  final Mutation$AddMedication _instance;

  final TRes Function(Mutation$AddMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addMedication = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddMedication(
        addMedication: addMedication == _undefined
            ? _instance.addMedication
            : (addMedication as Mutation$AddMedication$addMedication?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$AddMedication$addMedication<TRes> get addMedication {
    final local$addMedication = _instance.addMedication;
    return local$addMedication == null
        ? CopyWith$Mutation$AddMedication$addMedication.stub(_then(_instance))
        : CopyWith$Mutation$AddMedication$addMedication(
            local$addMedication, (e) => call(addMedication: e));
  }
}

class _CopyWithStubImpl$Mutation$AddMedication<TRes>
    implements CopyWith$Mutation$AddMedication<TRes> {
  _CopyWithStubImpl$Mutation$AddMedication(this._res);

  TRes _res;

  call({
    Mutation$AddMedication$addMedication? addMedication,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$AddMedication$addMedication<TRes> get addMedication =>
      CopyWith$Mutation$AddMedication$addMedication.stub(_res);
}

const documentNodeMutationAddMedication = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'AddMedication'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'dosage')),
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
        variable: VariableNode(name: NameNode(value: 'frequency')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inventory')),
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
        name: NameNode(value: 'addMedication'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'dosage'),
            value: VariableNode(name: NameNode(value: 'dosage')),
          ),
          ArgumentNode(
            name: NameNode(value: 'unit'),
            value: VariableNode(name: NameNode(value: 'unit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'frequency'),
            value: VariableNode(name: NameNode(value: 'frequency')),
          ),
          ArgumentNode(
            name: NameNode(value: 'inventory'),
            value: VariableNode(name: NameNode(value: 'inventory')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'medicationId'),
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
Mutation$AddMedication _parserFn$Mutation$AddMedication(
        Map<String, dynamic> data) =>
    Mutation$AddMedication.fromJson(data);
typedef OnMutationCompleted$Mutation$AddMedication = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$AddMedication?,
);

class Options$Mutation$AddMedication
    extends graphql.MutationOptions<Mutation$AddMedication> {
  Options$Mutation$AddMedication({
    String? operationName,
    required Variables$Mutation$AddMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddMedication>? update,
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
                        : _parserFn$Mutation$AddMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddMedication,
          parserFn: _parserFn$Mutation$AddMedication,
        );

  final OnMutationCompleted$Mutation$AddMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$AddMedication
    extends graphql.WatchQueryOptions<Mutation$AddMedication> {
  WatchOptions$Mutation$AddMedication({
    String? operationName,
    required Variables$Mutation$AddMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedication? typedOptimisticResult,
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
          document: documentNodeMutationAddMedication,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$AddMedication,
        );
}

extension ClientExtension$Mutation$AddMedication on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddMedication>> mutate$AddMedication(
          Options$Mutation$AddMedication options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$AddMedication> watchMutation$AddMedication(
          WatchOptions$Mutation$AddMedication options) =>
      this.watchMutation(options);
}

class Mutation$AddMedication$HookResult {
  Mutation$AddMedication$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$AddMedication runMutation;

  final graphql.QueryResult<Mutation$AddMedication> result;
}

Mutation$AddMedication$HookResult useMutation$AddMedication(
    [WidgetOptions$Mutation$AddMedication? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$AddMedication());
  return Mutation$AddMedication$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddMedication> useWatchMutation$AddMedication(
        WatchOptions$Mutation$AddMedication options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddMedication
    extends graphql.MutationOptions<Mutation$AddMedication> {
  WidgetOptions$Mutation$AddMedication({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddMedication>? update,
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
                        : _parserFn$Mutation$AddMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationAddMedication,
          parserFn: _parserFn$Mutation$AddMedication,
        );

  final OnMutationCompleted$Mutation$AddMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$AddMedication
    = graphql.MultiSourceResult<Mutation$AddMedication> Function(
  Variables$Mutation$AddMedication, {
  Object? optimisticResult,
  Mutation$AddMedication? typedOptimisticResult,
});
typedef Builder$Mutation$AddMedication = widgets.Widget Function(
  RunMutation$Mutation$AddMedication,
  graphql.QueryResult<Mutation$AddMedication>?,
);

class Mutation$AddMedication$Widget
    extends graphql_flutter.Mutation<Mutation$AddMedication> {
  Mutation$AddMedication$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddMedication? options,
    required Builder$Mutation$AddMedication builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$AddMedication(),
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

class Mutation$AddMedication$addMedication {
  Mutation$AddMedication$addMedication({
    required this.medicationId,
    required this.message,
    this.$__typename = 'AddMedicationResponse',
  });

  factory Mutation$AddMedication$addMedication.fromJson(
      Map<String, dynamic> json) {
    final l$medicationId = json['medicationId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$AddMedication$addMedication(
      medicationId: (l$medicationId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String medicationId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$medicationId = medicationId;
    _resultData['medicationId'] = l$medicationId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$medicationId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$AddMedication$addMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
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

extension UtilityExtension$Mutation$AddMedication$addMedication
    on Mutation$AddMedication$addMedication {
  CopyWith$Mutation$AddMedication$addMedication<
          Mutation$AddMedication$addMedication>
      get copyWith => CopyWith$Mutation$AddMedication$addMedication(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$AddMedication$addMedication<TRes> {
  factory CopyWith$Mutation$AddMedication$addMedication(
    Mutation$AddMedication$addMedication instance,
    TRes Function(Mutation$AddMedication$addMedication) then,
  ) = _CopyWithImpl$Mutation$AddMedication$addMedication;

  factory CopyWith$Mutation$AddMedication$addMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddMedication$addMedication;

  TRes call({
    String? medicationId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddMedication$addMedication<TRes>
    implements CopyWith$Mutation$AddMedication$addMedication<TRes> {
  _CopyWithImpl$Mutation$AddMedication$addMedication(
    this._instance,
    this._then,
  );

  final Mutation$AddMedication$addMedication _instance;

  final TRes Function(Mutation$AddMedication$addMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medicationId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$AddMedication$addMedication(
        medicationId: medicationId == _undefined || medicationId == null
            ? _instance.medicationId
            : (medicationId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$AddMedication$addMedication<TRes>
    implements CopyWith$Mutation$AddMedication$addMedication<TRes> {
  _CopyWithStubImpl$Mutation$AddMedication$addMedication(this._res);

  TRes _res;

  call({
    String? medicationId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateMedication {
  factory Variables$Mutation$UpdateMedication({
    required String medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) =>
      Variables$Mutation$UpdateMedication._({
        r'medicationId': medicationId,
        if (name != null) r'name': name,
        if (dosage != null) r'dosage': dosage,
        if (unit != null) r'unit': unit,
        if (frequency != null) r'frequency': frequency,
        if (inventory != null) r'inventory': inventory,
      });

  Variables$Mutation$UpdateMedication._(this._$data);

  factory Variables$Mutation$UpdateMedication.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$medicationId = data['medicationId'];
    result$data['medicationId'] = (l$medicationId as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('dosage')) {
      final l$dosage = data['dosage'];
      result$data['dosage'] = (l$dosage as num?)?.toDouble();
    }
    if (data.containsKey('unit')) {
      final l$unit = data['unit'];
      result$data['unit'] = (l$unit as String?);
    }
    if (data.containsKey('frequency')) {
      final l$frequency = data['frequency'];
      result$data['frequency'] = (l$frequency as String?);
    }
    if (data.containsKey('inventory')) {
      final l$inventory = data['inventory'];
      result$data['inventory'] = (l$inventory as num?)?.toDouble();
    }
    return Variables$Mutation$UpdateMedication._(result$data);
  }

  Map<String, dynamic> _$data;

  String get medicationId => (_$data['medicationId'] as String);

  String? get name => (_$data['name'] as String?);

  double? get dosage => (_$data['dosage'] as double?);

  String? get unit => (_$data['unit'] as String?);

  String? get frequency => (_$data['frequency'] as String?);

  double? get inventory => (_$data['inventory'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$medicationId = medicationId;
    result$data['medicationId'] = l$medicationId;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('dosage')) {
      final l$dosage = dosage;
      result$data['dosage'] = l$dosage;
    }
    if (_$data.containsKey('unit')) {
      final l$unit = unit;
      result$data['unit'] = l$unit;
    }
    if (_$data.containsKey('frequency')) {
      final l$frequency = frequency;
      result$data['frequency'] = l$frequency;
    }
    if (_$data.containsKey('inventory')) {
      final l$inventory = inventory;
      result$data['inventory'] = l$inventory;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMedication<
          Variables$Mutation$UpdateMedication>
      get copyWith => CopyWith$Variables$Mutation$UpdateMedication(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
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
    final l$dosage = dosage;
    final lOther$dosage = other.dosage;
    if (_$data.containsKey('dosage') != other._$data.containsKey('dosage')) {
      return false;
    }
    if (l$dosage != lOther$dosage) {
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
    final l$frequency = frequency;
    final lOther$frequency = other.frequency;
    if (_$data.containsKey('frequency') !=
        other._$data.containsKey('frequency')) {
      return false;
    }
    if (l$frequency != lOther$frequency) {
      return false;
    }
    final l$inventory = inventory;
    final lOther$inventory = other.inventory;
    if (_$data.containsKey('inventory') !=
        other._$data.containsKey('inventory')) {
      return false;
    }
    if (l$inventory != lOther$inventory) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    final l$name = name;
    final l$dosage = dosage;
    final l$unit = unit;
    final l$frequency = frequency;
    final l$inventory = inventory;
    return Object.hashAll([
      l$medicationId,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('dosage') ? l$dosage : const {},
      _$data.containsKey('unit') ? l$unit : const {},
      _$data.containsKey('frequency') ? l$frequency : const {},
      _$data.containsKey('inventory') ? l$inventory : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateMedication<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMedication(
    Variables$Mutation$UpdateMedication instance,
    TRes Function(Variables$Mutation$UpdateMedication) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMedication;

  factory CopyWith$Variables$Mutation$UpdateMedication.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMedication;

  TRes call({
    String? medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateMedication<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedication<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMedication(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateMedication _instance;

  final TRes Function(Variables$Mutation$UpdateMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medicationId = _undefined,
    Object? name = _undefined,
    Object? dosage = _undefined,
    Object? unit = _undefined,
    Object? frequency = _undefined,
    Object? inventory = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateMedication._({
        ..._instance._$data,
        if (medicationId != _undefined && medicationId != null)
          'medicationId': (medicationId as String),
        if (name != _undefined) 'name': (name as String?),
        if (dosage != _undefined) 'dosage': (dosage as double?),
        if (unit != _undefined) 'unit': (unit as String?),
        if (frequency != _undefined) 'frequency': (frequency as String?),
        if (inventory != _undefined) 'inventory': (inventory as double?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMedication<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedication<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMedication(this._res);

  TRes _res;

  call({
    String? medicationId,
    String? name,
    double? dosage,
    String? unit,
    String? frequency,
    double? inventory,
  }) =>
      _res;
}

class Mutation$UpdateMedication {
  Mutation$UpdateMedication({
    this.updateMedication,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateMedication.fromJson(Map<String, dynamic> json) {
    final l$updateMedication = json['updateMedication'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedication(
      updateMedication: l$updateMedication == null
          ? null
          : Mutation$UpdateMedication$updateMedication.fromJson(
              (l$updateMedication as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMedication$updateMedication? updateMedication;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMedication = updateMedication;
    _resultData['updateMedication'] = l$updateMedication?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMedication = updateMedication;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateMedication,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMedication = updateMedication;
    final lOther$updateMedication = other.updateMedication;
    if (l$updateMedication != lOther$updateMedication) {
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

extension UtilityExtension$Mutation$UpdateMedication
    on Mutation$UpdateMedication {
  CopyWith$Mutation$UpdateMedication<Mutation$UpdateMedication> get copyWith =>
      CopyWith$Mutation$UpdateMedication(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateMedication<TRes> {
  factory CopyWith$Mutation$UpdateMedication(
    Mutation$UpdateMedication instance,
    TRes Function(Mutation$UpdateMedication) then,
  ) = _CopyWithImpl$Mutation$UpdateMedication;

  factory CopyWith$Mutation$UpdateMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedication;

  TRes call({
    Mutation$UpdateMedication$updateMedication? updateMedication,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMedication$updateMedication<TRes>
      get updateMedication;
}

class _CopyWithImpl$Mutation$UpdateMedication<TRes>
    implements CopyWith$Mutation$UpdateMedication<TRes> {
  _CopyWithImpl$Mutation$UpdateMedication(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedication _instance;

  final TRes Function(Mutation$UpdateMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMedication = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedication(
        updateMedication: updateMedication == _undefined
            ? _instance.updateMedication
            : (updateMedication as Mutation$UpdateMedication$updateMedication?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateMedication$updateMedication<TRes>
      get updateMedication {
    final local$updateMedication = _instance.updateMedication;
    return local$updateMedication == null
        ? CopyWith$Mutation$UpdateMedication$updateMedication.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateMedication$updateMedication(
            local$updateMedication, (e) => call(updateMedication: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateMedication<TRes>
    implements CopyWith$Mutation$UpdateMedication<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedication(this._res);

  TRes _res;

  call({
    Mutation$UpdateMedication$updateMedication? updateMedication,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateMedication$updateMedication<TRes>
      get updateMedication =>
          CopyWith$Mutation$UpdateMedication$updateMedication.stub(_res);
}

const documentNodeMutationUpdateMedication = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateMedication'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'medicationId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        variable: VariableNode(name: NameNode(value: 'dosage')),
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
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'frequency')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'inventory')),
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
        name: NameNode(value: 'updateMedication'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'medicationId'),
            value: VariableNode(name: NameNode(value: 'medicationId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'dosage'),
            value: VariableNode(name: NameNode(value: 'dosage')),
          ),
          ArgumentNode(
            name: NameNode(value: 'unit'),
            value: VariableNode(name: NameNode(value: 'unit')),
          ),
          ArgumentNode(
            name: NameNode(value: 'frequency'),
            value: VariableNode(name: NameNode(value: 'frequency')),
          ),
          ArgumentNode(
            name: NameNode(value: 'inventory'),
            value: VariableNode(name: NameNode(value: 'inventory')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'medicationId'),
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
Mutation$UpdateMedication _parserFn$Mutation$UpdateMedication(
        Map<String, dynamic> data) =>
    Mutation$UpdateMedication.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMedication = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$UpdateMedication?,
);

class Options$Mutation$UpdateMedication
    extends graphql.MutationOptions<Mutation$UpdateMedication> {
  Options$Mutation$UpdateMedication({
    String? operationName,
    required Variables$Mutation$UpdateMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedication>? update,
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
                        : _parserFn$Mutation$UpdateMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedication,
          parserFn: _parserFn$Mutation$UpdateMedication,
        );

  final OnMutationCompleted$Mutation$UpdateMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateMedication
    extends graphql.WatchQueryOptions<Mutation$UpdateMedication> {
  WatchOptions$Mutation$UpdateMedication({
    String? operationName,
    required Variables$Mutation$UpdateMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedication? typedOptimisticResult,
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
          document: documentNodeMutationUpdateMedication,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateMedication,
        );
}

extension ClientExtension$Mutation$UpdateMedication on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMedication>>
      mutate$UpdateMedication(
              Options$Mutation$UpdateMedication options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateMedication>
      watchMutation$UpdateMedication(
              WatchOptions$Mutation$UpdateMedication options) =>
          this.watchMutation(options);
}

class Mutation$UpdateMedication$HookResult {
  Mutation$UpdateMedication$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateMedication runMutation;

  final graphql.QueryResult<Mutation$UpdateMedication> result;
}

Mutation$UpdateMedication$HookResult useMutation$UpdateMedication(
    [WidgetOptions$Mutation$UpdateMedication? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateMedication());
  return Mutation$UpdateMedication$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateMedication>
    useWatchMutation$UpdateMedication(
            WatchOptions$Mutation$UpdateMedication options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateMedication
    extends graphql.MutationOptions<Mutation$UpdateMedication> {
  WidgetOptions$Mutation$UpdateMedication({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedication>? update,
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
                        : _parserFn$Mutation$UpdateMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedication,
          parserFn: _parserFn$Mutation$UpdateMedication,
        );

  final OnMutationCompleted$Mutation$UpdateMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateMedication
    = graphql.MultiSourceResult<Mutation$UpdateMedication> Function(
  Variables$Mutation$UpdateMedication, {
  Object? optimisticResult,
  Mutation$UpdateMedication? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateMedication = widgets.Widget Function(
  RunMutation$Mutation$UpdateMedication,
  graphql.QueryResult<Mutation$UpdateMedication>?,
);

class Mutation$UpdateMedication$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateMedication> {
  Mutation$UpdateMedication$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateMedication? options,
    required Builder$Mutation$UpdateMedication builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateMedication(),
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

class Mutation$UpdateMedication$updateMedication {
  Mutation$UpdateMedication$updateMedication({
    required this.medicationId,
    required this.message,
    this.$__typename = 'UpdateMedicationResponse',
  });

  factory Mutation$UpdateMedication$updateMedication.fromJson(
      Map<String, dynamic> json) {
    final l$medicationId = json['medicationId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedication$updateMedication(
      medicationId: (l$medicationId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String medicationId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$medicationId = medicationId;
    _resultData['medicationId'] = l$medicationId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$medicationId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateMedication$updateMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
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

extension UtilityExtension$Mutation$UpdateMedication$updateMedication
    on Mutation$UpdateMedication$updateMedication {
  CopyWith$Mutation$UpdateMedication$updateMedication<
          Mutation$UpdateMedication$updateMedication>
      get copyWith => CopyWith$Mutation$UpdateMedication$updateMedication(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMedication$updateMedication<TRes> {
  factory CopyWith$Mutation$UpdateMedication$updateMedication(
    Mutation$UpdateMedication$updateMedication instance,
    TRes Function(Mutation$UpdateMedication$updateMedication) then,
  ) = _CopyWithImpl$Mutation$UpdateMedication$updateMedication;

  factory CopyWith$Mutation$UpdateMedication$updateMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedication$updateMedication;

  TRes call({
    String? medicationId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateMedication$updateMedication<TRes>
    implements CopyWith$Mutation$UpdateMedication$updateMedication<TRes> {
  _CopyWithImpl$Mutation$UpdateMedication$updateMedication(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedication$updateMedication _instance;

  final TRes Function(Mutation$UpdateMedication$updateMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medicationId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedication$updateMedication(
        medicationId: medicationId == _undefined || medicationId == null
            ? _instance.medicationId
            : (medicationId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateMedication$updateMedication<TRes>
    implements CopyWith$Mutation$UpdateMedication$updateMedication<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedication$updateMedication(this._res);

  TRes _res;

  call({
    String? medicationId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$DeleteMedication {
  factory Variables$Mutation$DeleteMedication({required String medicationId}) =>
      Variables$Mutation$DeleteMedication._({
        r'medicationId': medicationId,
      });

  Variables$Mutation$DeleteMedication._(this._$data);

  factory Variables$Mutation$DeleteMedication.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$medicationId = data['medicationId'];
    result$data['medicationId'] = (l$medicationId as String);
    return Variables$Mutation$DeleteMedication._(result$data);
  }

  Map<String, dynamic> _$data;

  String get medicationId => (_$data['medicationId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$medicationId = medicationId;
    result$data['medicationId'] = l$medicationId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMedication<
          Variables$Mutation$DeleteMedication>
      get copyWith => CopyWith$Variables$Mutation$DeleteMedication(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$DeleteMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    return Object.hashAll([l$medicationId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteMedication<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMedication(
    Variables$Mutation$DeleteMedication instance,
    TRes Function(Variables$Mutation$DeleteMedication) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMedication;

  factory CopyWith$Variables$Mutation$DeleteMedication.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMedication;

  TRes call({String? medicationId});
}

class _CopyWithImpl$Variables$Mutation$DeleteMedication<TRes>
    implements CopyWith$Variables$Mutation$DeleteMedication<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMedication(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteMedication _instance;

  final TRes Function(Variables$Mutation$DeleteMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? medicationId = _undefined}) =>
      _then(Variables$Mutation$DeleteMedication._({
        ..._instance._$data,
        if (medicationId != _undefined && medicationId != null)
          'medicationId': (medicationId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMedication<TRes>
    implements CopyWith$Variables$Mutation$DeleteMedication<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMedication(this._res);

  TRes _res;

  call({String? medicationId}) => _res;
}

class Mutation$DeleteMedication {
  Mutation$DeleteMedication({
    this.deleteMedication,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteMedication.fromJson(Map<String, dynamic> json) {
    final l$deleteMedication = json['deleteMedication'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMedication(
      deleteMedication: l$deleteMedication == null
          ? null
          : Mutation$DeleteMedication$deleteMedication.fromJson(
              (l$deleteMedication as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMedication$deleteMedication? deleteMedication;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMedication = deleteMedication;
    _resultData['deleteMedication'] = l$deleteMedication?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMedication = deleteMedication;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$deleteMedication,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$DeleteMedication) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMedication = deleteMedication;
    final lOther$deleteMedication = other.deleteMedication;
    if (l$deleteMedication != lOther$deleteMedication) {
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

extension UtilityExtension$Mutation$DeleteMedication
    on Mutation$DeleteMedication {
  CopyWith$Mutation$DeleteMedication<Mutation$DeleteMedication> get copyWith =>
      CopyWith$Mutation$DeleteMedication(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteMedication<TRes> {
  factory CopyWith$Mutation$DeleteMedication(
    Mutation$DeleteMedication instance,
    TRes Function(Mutation$DeleteMedication) then,
  ) = _CopyWithImpl$Mutation$DeleteMedication;

  factory CopyWith$Mutation$DeleteMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMedication;

  TRes call({
    Mutation$DeleteMedication$deleteMedication? deleteMedication,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteMedication$deleteMedication<TRes>
      get deleteMedication;
}

class _CopyWithImpl$Mutation$DeleteMedication<TRes>
    implements CopyWith$Mutation$DeleteMedication<TRes> {
  _CopyWithImpl$Mutation$DeleteMedication(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMedication _instance;

  final TRes Function(Mutation$DeleteMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMedication = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteMedication(
        deleteMedication: deleteMedication == _undefined
            ? _instance.deleteMedication
            : (deleteMedication as Mutation$DeleteMedication$deleteMedication?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$DeleteMedication$deleteMedication<TRes>
      get deleteMedication {
    final local$deleteMedication = _instance.deleteMedication;
    return local$deleteMedication == null
        ? CopyWith$Mutation$DeleteMedication$deleteMedication.stub(
            _then(_instance))
        : CopyWith$Mutation$DeleteMedication$deleteMedication(
            local$deleteMedication, (e) => call(deleteMedication: e));
  }
}

class _CopyWithStubImpl$Mutation$DeleteMedication<TRes>
    implements CopyWith$Mutation$DeleteMedication<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMedication(this._res);

  TRes _res;

  call({
    Mutation$DeleteMedication$deleteMedication? deleteMedication,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$DeleteMedication$deleteMedication<TRes>
      get deleteMedication =>
          CopyWith$Mutation$DeleteMedication$deleteMedication.stub(_res);
}

const documentNodeMutationDeleteMedication = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteMedication'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'medicationId')),
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
        name: NameNode(value: 'deleteMedication'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'medicationId'),
            value: VariableNode(name: NameNode(value: 'medicationId')),
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
Mutation$DeleteMedication _parserFn$Mutation$DeleteMedication(
        Map<String, dynamic> data) =>
    Mutation$DeleteMedication.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMedication = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$DeleteMedication?,
);

class Options$Mutation$DeleteMedication
    extends graphql.MutationOptions<Mutation$DeleteMedication> {
  Options$Mutation$DeleteMedication({
    String? operationName,
    required Variables$Mutation$DeleteMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMedication>? update,
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
                        : _parserFn$Mutation$DeleteMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteMedication,
          parserFn: _parserFn$Mutation$DeleteMedication,
        );

  final OnMutationCompleted$Mutation$DeleteMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$DeleteMedication
    extends graphql.WatchQueryOptions<Mutation$DeleteMedication> {
  WatchOptions$Mutation$DeleteMedication({
    String? operationName,
    required Variables$Mutation$DeleteMedication variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedication? typedOptimisticResult,
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
          document: documentNodeMutationDeleteMedication,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$DeleteMedication,
        );
}

extension ClientExtension$Mutation$DeleteMedication on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMedication>>
      mutate$DeleteMedication(
              Options$Mutation$DeleteMedication options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$DeleteMedication>
      watchMutation$DeleteMedication(
              WatchOptions$Mutation$DeleteMedication options) =>
          this.watchMutation(options);
}

class Mutation$DeleteMedication$HookResult {
  Mutation$DeleteMedication$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$DeleteMedication runMutation;

  final graphql.QueryResult<Mutation$DeleteMedication> result;
}

Mutation$DeleteMedication$HookResult useMutation$DeleteMedication(
    [WidgetOptions$Mutation$DeleteMedication? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$DeleteMedication());
  return Mutation$DeleteMedication$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMedication>
    useWatchMutation$DeleteMedication(
            WatchOptions$Mutation$DeleteMedication options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMedication
    extends graphql.MutationOptions<Mutation$DeleteMedication> {
  WidgetOptions$Mutation$DeleteMedication({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMedication? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMedication? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMedication>? update,
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
                        : _parserFn$Mutation$DeleteMedication(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationDeleteMedication,
          parserFn: _parserFn$Mutation$DeleteMedication,
        );

  final OnMutationCompleted$Mutation$DeleteMedication? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$DeleteMedication
    = graphql.MultiSourceResult<Mutation$DeleteMedication> Function(
  Variables$Mutation$DeleteMedication, {
  Object? optimisticResult,
  Mutation$DeleteMedication? typedOptimisticResult,
});
typedef Builder$Mutation$DeleteMedication = widgets.Widget Function(
  RunMutation$Mutation$DeleteMedication,
  graphql.QueryResult<Mutation$DeleteMedication>?,
);

class Mutation$DeleteMedication$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMedication> {
  Mutation$DeleteMedication$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMedication? options,
    required Builder$Mutation$DeleteMedication builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$DeleteMedication(),
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

class Mutation$DeleteMedication$deleteMedication {
  Mutation$DeleteMedication$deleteMedication({
    required this.message,
    this.$__typename = 'DeleteMedicationResponse',
  });

  factory Mutation$DeleteMedication$deleteMedication.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMedication$deleteMedication(
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
    if (!(other is Mutation$DeleteMedication$deleteMedication) ||
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

extension UtilityExtension$Mutation$DeleteMedication$deleteMedication
    on Mutation$DeleteMedication$deleteMedication {
  CopyWith$Mutation$DeleteMedication$deleteMedication<
          Mutation$DeleteMedication$deleteMedication>
      get copyWith => CopyWith$Mutation$DeleteMedication$deleteMedication(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$DeleteMedication$deleteMedication<TRes> {
  factory CopyWith$Mutation$DeleteMedication$deleteMedication(
    Mutation$DeleteMedication$deleteMedication instance,
    TRes Function(Mutation$DeleteMedication$deleteMedication) then,
  ) = _CopyWithImpl$Mutation$DeleteMedication$deleteMedication;

  factory CopyWith$Mutation$DeleteMedication$deleteMedication.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMedication$deleteMedication;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteMedication$deleteMedication<TRes>
    implements CopyWith$Mutation$DeleteMedication$deleteMedication<TRes> {
  _CopyWithImpl$Mutation$DeleteMedication$deleteMedication(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMedication$deleteMedication _instance;

  final TRes Function(Mutation$DeleteMedication$deleteMedication) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$DeleteMedication$deleteMedication(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$DeleteMedication$deleteMedication<TRes>
    implements CopyWith$Mutation$DeleteMedication$deleteMedication<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMedication$deleteMedication(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
