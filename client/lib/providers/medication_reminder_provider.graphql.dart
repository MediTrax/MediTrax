import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:meditrax/scalar.dart';

class Query$GetMedicationReminders {
  Query$GetMedicationReminders({
    this.getMedicationReminders,
    this.$__typename = 'Query',
  });

  factory Query$GetMedicationReminders.fromJson(Map<String, dynamic> json) {
    final l$getMedicationReminders = json['getMedicationReminders'];
    final l$$__typename = json['__typename'];
    return Query$GetMedicationReminders(
      getMedicationReminders: (l$getMedicationReminders as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$GetMedicationReminders$getMedicationReminders.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMedicationReminders$getMedicationReminders?>?
      getMedicationReminders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getMedicationReminders = getMedicationReminders;
    _resultData['getMedicationReminders'] =
        l$getMedicationReminders?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getMedicationReminders = getMedicationReminders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getMedicationReminders == null
          ? null
          : Object.hashAll(l$getMedicationReminders.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedicationReminders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$getMedicationReminders = getMedicationReminders;
    final lOther$getMedicationReminders = other.getMedicationReminders;
    if (l$getMedicationReminders != null &&
        lOther$getMedicationReminders != null) {
      if (l$getMedicationReminders.length !=
          lOther$getMedicationReminders.length) {
        return false;
      }
      for (int i = 0; i < l$getMedicationReminders.length; i++) {
        final l$getMedicationReminders$entry = l$getMedicationReminders[i];
        final lOther$getMedicationReminders$entry =
            lOther$getMedicationReminders[i];
        if (l$getMedicationReminders$entry !=
            lOther$getMedicationReminders$entry) {
          return false;
        }
      }
    } else if (l$getMedicationReminders != lOther$getMedicationReminders) {
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

extension UtilityExtension$Query$GetMedicationReminders
    on Query$GetMedicationReminders {
  CopyWith$Query$GetMedicationReminders<Query$GetMedicationReminders>
      get copyWith => CopyWith$Query$GetMedicationReminders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMedicationReminders<TRes> {
  factory CopyWith$Query$GetMedicationReminders(
    Query$GetMedicationReminders instance,
    TRes Function(Query$GetMedicationReminders) then,
  ) = _CopyWithImpl$Query$GetMedicationReminders;

  factory CopyWith$Query$GetMedicationReminders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMedicationReminders;

  TRes call({
    List<Query$GetMedicationReminders$getMedicationReminders?>?
        getMedicationReminders,
    String? $__typename,
  });
  TRes getMedicationReminders(
      Iterable<Query$GetMedicationReminders$getMedicationReminders?>? Function(
              Iterable<
                  CopyWith$Query$GetMedicationReminders$getMedicationReminders<
                      Query$GetMedicationReminders$getMedicationReminders>?>?)
          _fn);
}

class _CopyWithImpl$Query$GetMedicationReminders<TRes>
    implements CopyWith$Query$GetMedicationReminders<TRes> {
  _CopyWithImpl$Query$GetMedicationReminders(
    this._instance,
    this._then,
  );

  final Query$GetMedicationReminders _instance;

  final TRes Function(Query$GetMedicationReminders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getMedicationReminders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedicationReminders(
        getMedicationReminders: getMedicationReminders == _undefined
            ? _instance.getMedicationReminders
            : (getMedicationReminders
                as List<Query$GetMedicationReminders$getMedicationReminders?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes getMedicationReminders(
          Iterable<Query$GetMedicationReminders$getMedicationReminders?>? Function(
                  Iterable<
                      CopyWith$Query$GetMedicationReminders$getMedicationReminders<
                          Query$GetMedicationReminders$getMedicationReminders>?>?)
              _fn) =>
      call(
          getMedicationReminders:
              _fn(_instance.getMedicationReminders?.map((e) => e == null
                  ? null
                  : CopyWith$Query$GetMedicationReminders$getMedicationReminders(
                      e,
                      (i) => i,
                    )))?.toList());
}

class _CopyWithStubImpl$Query$GetMedicationReminders<TRes>
    implements CopyWith$Query$GetMedicationReminders<TRes> {
  _CopyWithStubImpl$Query$GetMedicationReminders(this._res);

  TRes _res;

  call({
    List<Query$GetMedicationReminders$getMedicationReminders?>?
        getMedicationReminders,
    String? $__typename,
  }) =>
      _res;

  getMedicationReminders(_fn) => _res;
}

const documentNodeQueryGetMedicationReminders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMedicationReminders'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getMedicationReminders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reminderId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'medicationId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reminderTime'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isTaken'),
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
Query$GetMedicationReminders _parserFn$Query$GetMedicationReminders(
        Map<String, dynamic> data) =>
    Query$GetMedicationReminders.fromJson(data);
typedef OnQueryComplete$Query$GetMedicationReminders = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMedicationReminders?,
);

class Options$Query$GetMedicationReminders
    extends graphql.QueryOptions<Query$GetMedicationReminders> {
  Options$Query$GetMedicationReminders({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedicationReminders? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMedicationReminders? onComplete,
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
                        : _parserFn$Query$GetMedicationReminders(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMedicationReminders,
          parserFn: _parserFn$Query$GetMedicationReminders,
        );

  final OnQueryComplete$Query$GetMedicationReminders? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMedicationReminders
    extends graphql.WatchQueryOptions<Query$GetMedicationReminders> {
  WatchOptions$Query$GetMedicationReminders({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMedicationReminders? typedOptimisticResult,
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
          document: documentNodeQueryGetMedicationReminders,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMedicationReminders,
        );
}

class FetchMoreOptions$Query$GetMedicationReminders
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMedicationReminders(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMedicationReminders,
        );
}

extension ClientExtension$Query$GetMedicationReminders
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMedicationReminders>>
      query$GetMedicationReminders(
              [Options$Query$GetMedicationReminders? options]) async =>
          await this.query(options ?? Options$Query$GetMedicationReminders());
  graphql.ObservableQuery<
      Query$GetMedicationReminders> watchQuery$GetMedicationReminders(
          [WatchOptions$Query$GetMedicationReminders? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMedicationReminders());
  void writeQuery$GetMedicationReminders({
    required Query$GetMedicationReminders data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryGetMedicationReminders)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMedicationReminders? readQuery$GetMedicationReminders(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQueryGetMedicationReminders)),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetMedicationReminders.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMedicationReminders>
    useQuery$GetMedicationReminders(
            [Options$Query$GetMedicationReminders? options]) =>
        graphql_flutter
            .useQuery(options ?? Options$Query$GetMedicationReminders());
graphql.ObservableQuery<Query$GetMedicationReminders>
    useWatchQuery$GetMedicationReminders(
            [WatchOptions$Query$GetMedicationReminders? options]) =>
        graphql_flutter.useWatchQuery(
            options ?? WatchOptions$Query$GetMedicationReminders());

class Query$GetMedicationReminders$Widget
    extends graphql_flutter.Query<Query$GetMedicationReminders> {
  Query$GetMedicationReminders$Widget({
    widgets.Key? key,
    Options$Query$GetMedicationReminders? options,
    required graphql_flutter.QueryBuilder<Query$GetMedicationReminders> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMedicationReminders(),
          builder: builder,
        );
}

class Query$GetMedicationReminders$getMedicationReminders {
  Query$GetMedicationReminders$getMedicationReminders({
    required this.reminderId,
    required this.medicationId,
    required this.reminderTime,
    required this.isTaken,
    this.$__typename = 'MedicationReminderDetail',
  });

  factory Query$GetMedicationReminders$getMedicationReminders.fromJson(
      Map<String, dynamic> json) {
    final l$reminderId = json['reminderId'];
    final l$medicationId = json['medicationId'];
    final l$reminderTime = json['reminderTime'];
    final l$isTaken = json['isTaken'];
    final l$$__typename = json['__typename'];
    return Query$GetMedicationReminders$getMedicationReminders(
      reminderId: (l$reminderId as String),
      medicationId: (l$medicationId as String),
      reminderTime: dateTimeFromJson(l$reminderTime),
      isTaken: (l$isTaken as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String reminderId;

  final String medicationId;

  final DateTime reminderTime;

  final bool isTaken;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reminderId = reminderId;
    _resultData['reminderId'] = l$reminderId;
    final l$medicationId = medicationId;
    _resultData['medicationId'] = l$medicationId;
    final l$reminderTime = reminderTime;
    _resultData['reminderTime'] = dateTimeToJson(l$reminderTime);
    final l$isTaken = isTaken;
    _resultData['isTaken'] = l$isTaken;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reminderId = reminderId;
    final l$medicationId = medicationId;
    final l$reminderTime = reminderTime;
    final l$isTaken = isTaken;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reminderId,
      l$medicationId,
      l$reminderTime,
      l$isTaken,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMedicationReminders$getMedicationReminders) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reminderId = reminderId;
    final lOther$reminderId = other.reminderId;
    if (l$reminderId != lOther$reminderId) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
      return false;
    }
    final l$reminderTime = reminderTime;
    final lOther$reminderTime = other.reminderTime;
    if (l$reminderTime != lOther$reminderTime) {
      return false;
    }
    final l$isTaken = isTaken;
    final lOther$isTaken = other.isTaken;
    if (l$isTaken != lOther$isTaken) {
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

extension UtilityExtension$Query$GetMedicationReminders$getMedicationReminders
    on Query$GetMedicationReminders$getMedicationReminders {
  CopyWith$Query$GetMedicationReminders$getMedicationReminders<
          Query$GetMedicationReminders$getMedicationReminders>
      get copyWith =>
          CopyWith$Query$GetMedicationReminders$getMedicationReminders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetMedicationReminders$getMedicationReminders<
    TRes> {
  factory CopyWith$Query$GetMedicationReminders$getMedicationReminders(
    Query$GetMedicationReminders$getMedicationReminders instance,
    TRes Function(Query$GetMedicationReminders$getMedicationReminders) then,
  ) = _CopyWithImpl$Query$GetMedicationReminders$getMedicationReminders;

  factory CopyWith$Query$GetMedicationReminders$getMedicationReminders.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetMedicationReminders$getMedicationReminders;

  TRes call({
    String? reminderId,
    String? medicationId,
    DateTime? reminderTime,
    bool? isTaken,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMedicationReminders$getMedicationReminders<TRes>
    implements
        CopyWith$Query$GetMedicationReminders$getMedicationReminders<TRes> {
  _CopyWithImpl$Query$GetMedicationReminders$getMedicationReminders(
    this._instance,
    this._then,
  );

  final Query$GetMedicationReminders$getMedicationReminders _instance;

  final TRes Function(Query$GetMedicationReminders$getMedicationReminders)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reminderId = _undefined,
    Object? medicationId = _undefined,
    Object? reminderTime = _undefined,
    Object? isTaken = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMedicationReminders$getMedicationReminders(
        reminderId: reminderId == _undefined || reminderId == null
            ? _instance.reminderId
            : (reminderId as String),
        medicationId: medicationId == _undefined || medicationId == null
            ? _instance.medicationId
            : (medicationId as String),
        reminderTime: reminderTime == _undefined || reminderTime == null
            ? _instance.reminderTime
            : (reminderTime as DateTime),
        isTaken: isTaken == _undefined || isTaken == null
            ? _instance.isTaken
            : (isTaken as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMedicationReminders$getMedicationReminders<
        TRes>
    implements
        CopyWith$Query$GetMedicationReminders$getMedicationReminders<TRes> {
  _CopyWithStubImpl$Query$GetMedicationReminders$getMedicationReminders(
      this._res);

  TRes _res;

  call({
    String? reminderId,
    String? medicationId,
    DateTime? reminderTime,
    bool? isTaken,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateMedicationReminder {
  factory Variables$Mutation$CreateMedicationReminder({
    required String medicationId,
    required DateTime reminderTime,
  }) =>
      Variables$Mutation$CreateMedicationReminder._({
        r'medicationId': medicationId,
        r'reminderTime': reminderTime,
      });

  Variables$Mutation$CreateMedicationReminder._(this._$data);

  factory Variables$Mutation$CreateMedicationReminder.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$medicationId = data['medicationId'];
    result$data['medicationId'] = (l$medicationId as String);
    final l$reminderTime = data['reminderTime'];
    result$data['reminderTime'] = dateTimeFromJson(l$reminderTime);
    return Variables$Mutation$CreateMedicationReminder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get medicationId => (_$data['medicationId'] as String);

  DateTime get reminderTime => (_$data['reminderTime'] as DateTime);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$medicationId = medicationId;
    result$data['medicationId'] = l$medicationId;
    final l$reminderTime = reminderTime;
    result$data['reminderTime'] = dateTimeToJson(l$reminderTime);
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateMedicationReminder<
          Variables$Mutation$CreateMedicationReminder>
      get copyWith => CopyWith$Variables$Mutation$CreateMedicationReminder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$medicationId = medicationId;
    final lOther$medicationId = other.medicationId;
    if (l$medicationId != lOther$medicationId) {
      return false;
    }
    final l$reminderTime = reminderTime;
    final lOther$reminderTime = other.reminderTime;
    if (l$reminderTime != lOther$reminderTime) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$medicationId = medicationId;
    final l$reminderTime = reminderTime;
    return Object.hashAll([
      l$medicationId,
      l$reminderTime,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateMedicationReminder<TRes> {
  factory CopyWith$Variables$Mutation$CreateMedicationReminder(
    Variables$Mutation$CreateMedicationReminder instance,
    TRes Function(Variables$Mutation$CreateMedicationReminder) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateMedicationReminder;

  factory CopyWith$Variables$Mutation$CreateMedicationReminder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateMedicationReminder;

  TRes call({
    String? medicationId,
    DateTime? reminderTime,
  });
}

class _CopyWithImpl$Variables$Mutation$CreateMedicationReminder<TRes>
    implements CopyWith$Variables$Mutation$CreateMedicationReminder<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateMedicationReminder(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateMedicationReminder _instance;

  final TRes Function(Variables$Mutation$CreateMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? medicationId = _undefined,
    Object? reminderTime = _undefined,
  }) =>
      _then(Variables$Mutation$CreateMedicationReminder._({
        ..._instance._$data,
        if (medicationId != _undefined && medicationId != null)
          'medicationId': (medicationId as String),
        if (reminderTime != _undefined && reminderTime != null)
          'reminderTime': (reminderTime as DateTime),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateMedicationReminder<TRes>
    implements CopyWith$Variables$Mutation$CreateMedicationReminder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateMedicationReminder(this._res);

  TRes _res;

  call({
    String? medicationId,
    DateTime? reminderTime,
  }) =>
      _res;
}

class Mutation$CreateMedicationReminder {
  Mutation$CreateMedicationReminder({
    this.createMedicationReminder,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateMedicationReminder.fromJson(
      Map<String, dynamic> json) {
    final l$createMedicationReminder = json['createMedicationReminder'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMedicationReminder(
      createMedicationReminder: l$createMedicationReminder == null
          ? null
          : Mutation$CreateMedicationReminder$createMedicationReminder.fromJson(
              (l$createMedicationReminder as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMedicationReminder$createMedicationReminder?
      createMedicationReminder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createMedicationReminder = createMedicationReminder;
    _resultData['createMedicationReminder'] =
        l$createMedicationReminder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createMedicationReminder = createMedicationReminder;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createMedicationReminder,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMedicationReminder = createMedicationReminder;
    final lOther$createMedicationReminder = other.createMedicationReminder;
    if (l$createMedicationReminder != lOther$createMedicationReminder) {
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

extension UtilityExtension$Mutation$CreateMedicationReminder
    on Mutation$CreateMedicationReminder {
  CopyWith$Mutation$CreateMedicationReminder<Mutation$CreateMedicationReminder>
      get copyWith => CopyWith$Mutation$CreateMedicationReminder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMedicationReminder<TRes> {
  factory CopyWith$Mutation$CreateMedicationReminder(
    Mutation$CreateMedicationReminder instance,
    TRes Function(Mutation$CreateMedicationReminder) then,
  ) = _CopyWithImpl$Mutation$CreateMedicationReminder;

  factory CopyWith$Mutation$CreateMedicationReminder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMedicationReminder;

  TRes call({
    Mutation$CreateMedicationReminder$createMedicationReminder?
        createMedicationReminder,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<TRes>
      get createMedicationReminder;
}

class _CopyWithImpl$Mutation$CreateMedicationReminder<TRes>
    implements CopyWith$Mutation$CreateMedicationReminder<TRes> {
  _CopyWithImpl$Mutation$CreateMedicationReminder(
    this._instance,
    this._then,
  );

  final Mutation$CreateMedicationReminder _instance;

  final TRes Function(Mutation$CreateMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createMedicationReminder = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateMedicationReminder(
        createMedicationReminder: createMedicationReminder == _undefined
            ? _instance.createMedicationReminder
            : (createMedicationReminder
                as Mutation$CreateMedicationReminder$createMedicationReminder?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<TRes>
      get createMedicationReminder {
    final local$createMedicationReminder = _instance.createMedicationReminder;
    return local$createMedicationReminder == null
        ? CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder
            .stub(_then(_instance))
        : CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder(
            local$createMedicationReminder,
            (e) => call(createMedicationReminder: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateMedicationReminder<TRes>
    implements CopyWith$Mutation$CreateMedicationReminder<TRes> {
  _CopyWithStubImpl$Mutation$CreateMedicationReminder(this._res);

  TRes _res;

  call({
    Mutation$CreateMedicationReminder$createMedicationReminder?
        createMedicationReminder,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<TRes>
      get createMedicationReminder =>
          CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder
              .stub(_res);
}

const documentNodeMutationCreateMedicationReminder = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateMedicationReminder'),
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
        variable: VariableNode(name: NameNode(value: 'reminderTime')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createMedicationReminder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'medicationId'),
            value: VariableNode(name: NameNode(value: 'medicationId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'reminderTime'),
            value: VariableNode(name: NameNode(value: 'reminderTime')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reminderId'),
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
Mutation$CreateMedicationReminder _parserFn$Mutation$CreateMedicationReminder(
        Map<String, dynamic> data) =>
    Mutation$CreateMedicationReminder.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateMedicationReminder = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$CreateMedicationReminder?,
);

class Options$Mutation$CreateMedicationReminder
    extends graphql.MutationOptions<Mutation$CreateMedicationReminder> {
  Options$Mutation$CreateMedicationReminder({
    String? operationName,
    required Variables$Mutation$CreateMedicationReminder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMedicationReminder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMedicationReminder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMedicationReminder>? update,
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
                        : _parserFn$Mutation$CreateMedicationReminder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateMedicationReminder,
          parserFn: _parserFn$Mutation$CreateMedicationReminder,
        );

  final OnMutationCompleted$Mutation$CreateMedicationReminder?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateMedicationReminder
    extends graphql.WatchQueryOptions<Mutation$CreateMedicationReminder> {
  WatchOptions$Mutation$CreateMedicationReminder({
    String? operationName,
    required Variables$Mutation$CreateMedicationReminder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMedicationReminder? typedOptimisticResult,
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
          document: documentNodeMutationCreateMedicationReminder,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateMedicationReminder,
        );
}

extension ClientExtension$Mutation$CreateMedicationReminder
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateMedicationReminder>>
      mutate$CreateMedicationReminder(
              Options$Mutation$CreateMedicationReminder options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateMedicationReminder>
      watchMutation$CreateMedicationReminder(
              WatchOptions$Mutation$CreateMedicationReminder options) =>
          this.watchMutation(options);
}

class Mutation$CreateMedicationReminder$HookResult {
  Mutation$CreateMedicationReminder$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateMedicationReminder runMutation;

  final graphql.QueryResult<Mutation$CreateMedicationReminder> result;
}

Mutation$CreateMedicationReminder$HookResult
    useMutation$CreateMedicationReminder(
        [WidgetOptions$Mutation$CreateMedicationReminder? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$CreateMedicationReminder());
  return Mutation$CreateMedicationReminder$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateMedicationReminder>
    useWatchMutation$CreateMedicationReminder(
            WatchOptions$Mutation$CreateMedicationReminder options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateMedicationReminder
    extends graphql.MutationOptions<Mutation$CreateMedicationReminder> {
  WidgetOptions$Mutation$CreateMedicationReminder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMedicationReminder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMedicationReminder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMedicationReminder>? update,
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
                        : _parserFn$Mutation$CreateMedicationReminder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateMedicationReminder,
          parserFn: _parserFn$Mutation$CreateMedicationReminder,
        );

  final OnMutationCompleted$Mutation$CreateMedicationReminder?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateMedicationReminder
    = graphql.MultiSourceResult<Mutation$CreateMedicationReminder> Function(
  Variables$Mutation$CreateMedicationReminder, {
  Object? optimisticResult,
  Mutation$CreateMedicationReminder? typedOptimisticResult,
});
typedef Builder$Mutation$CreateMedicationReminder = widgets.Widget Function(
  RunMutation$Mutation$CreateMedicationReminder,
  graphql.QueryResult<Mutation$CreateMedicationReminder>?,
);

class Mutation$CreateMedicationReminder$Widget
    extends graphql_flutter.Mutation<Mutation$CreateMedicationReminder> {
  Mutation$CreateMedicationReminder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateMedicationReminder? options,
    required Builder$Mutation$CreateMedicationReminder builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateMedicationReminder(),
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

class Mutation$CreateMedicationReminder$createMedicationReminder {
  Mutation$CreateMedicationReminder$createMedicationReminder({
    required this.reminderId,
    required this.message,
    this.$__typename = 'CreateMedicationReminderResponse',
  });

  factory Mutation$CreateMedicationReminder$createMedicationReminder.fromJson(
      Map<String, dynamic> json) {
    final l$reminderId = json['reminderId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMedicationReminder$createMedicationReminder(
      reminderId: (l$reminderId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String reminderId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reminderId = reminderId;
    _resultData['reminderId'] = l$reminderId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reminderId = reminderId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reminderId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$CreateMedicationReminder$createMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reminderId = reminderId;
    final lOther$reminderId = other.reminderId;
    if (l$reminderId != lOther$reminderId) {
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

extension UtilityExtension$Mutation$CreateMedicationReminder$createMedicationReminder
    on Mutation$CreateMedicationReminder$createMedicationReminder {
  CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<
          Mutation$CreateMedicationReminder$createMedicationReminder>
      get copyWith =>
          CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<
    TRes> {
  factory CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder(
    Mutation$CreateMedicationReminder$createMedicationReminder instance,
    TRes Function(Mutation$CreateMedicationReminder$createMedicationReminder)
        then,
  ) = _CopyWithImpl$Mutation$CreateMedicationReminder$createMedicationReminder;

  factory CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateMedicationReminder$createMedicationReminder;

  TRes call({
    String? reminderId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateMedicationReminder$createMedicationReminder<
        TRes>
    implements
        CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<
            TRes> {
  _CopyWithImpl$Mutation$CreateMedicationReminder$createMedicationReminder(
    this._instance,
    this._then,
  );

  final Mutation$CreateMedicationReminder$createMedicationReminder _instance;

  final TRes Function(
      Mutation$CreateMedicationReminder$createMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reminderId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateMedicationReminder$createMedicationReminder(
        reminderId: reminderId == _undefined || reminderId == null
            ? _instance.reminderId
            : (reminderId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateMedicationReminder$createMedicationReminder<
        TRes>
    implements
        CopyWith$Mutation$CreateMedicationReminder$createMedicationReminder<
            TRes> {
  _CopyWithStubImpl$Mutation$CreateMedicationReminder$createMedicationReminder(
      this._res);

  TRes _res;

  call({
    String? reminderId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdateMedicationReminder {
  factory Variables$Mutation$UpdateMedicationReminder({
    required String reminderId,
    DateTime? reminderTime,
    bool? isTaken,
  }) =>
      Variables$Mutation$UpdateMedicationReminder._({
        r'reminderId': reminderId,
        if (reminderTime != null) r'reminderTime': reminderTime,
        if (isTaken != null) r'isTaken': isTaken,
      });

  Variables$Mutation$UpdateMedicationReminder._(this._$data);

  factory Variables$Mutation$UpdateMedicationReminder.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$reminderId = data['reminderId'];
    result$data['reminderId'] = (l$reminderId as String);
    if (data.containsKey('reminderTime')) {
      final l$reminderTime = data['reminderTime'];
      result$data['reminderTime'] =
          l$reminderTime == null ? null : dateTimeFromJson(l$reminderTime);
    }
    if (data.containsKey('isTaken')) {
      final l$isTaken = data['isTaken'];
      result$data['isTaken'] = (l$isTaken as bool?);
    }
    return Variables$Mutation$UpdateMedicationReminder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get reminderId => (_$data['reminderId'] as String);

  DateTime? get reminderTime => (_$data['reminderTime'] as DateTime?);

  bool? get isTaken => (_$data['isTaken'] as bool?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$reminderId = reminderId;
    result$data['reminderId'] = l$reminderId;
    if (_$data.containsKey('reminderTime')) {
      final l$reminderTime = reminderTime;
      result$data['reminderTime'] =
          l$reminderTime == null ? null : dateTimeToJson(l$reminderTime);
    }
    if (_$data.containsKey('isTaken')) {
      final l$isTaken = isTaken;
      result$data['isTaken'] = l$isTaken;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMedicationReminder<
          Variables$Mutation$UpdateMedicationReminder>
      get copyWith => CopyWith$Variables$Mutation$UpdateMedicationReminder(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdateMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reminderId = reminderId;
    final lOther$reminderId = other.reminderId;
    if (l$reminderId != lOther$reminderId) {
      return false;
    }
    final l$reminderTime = reminderTime;
    final lOther$reminderTime = other.reminderTime;
    if (_$data.containsKey('reminderTime') !=
        other._$data.containsKey('reminderTime')) {
      return false;
    }
    if (l$reminderTime != lOther$reminderTime) {
      return false;
    }
    final l$isTaken = isTaken;
    final lOther$isTaken = other.isTaken;
    if (_$data.containsKey('isTaken') != other._$data.containsKey('isTaken')) {
      return false;
    }
    if (l$isTaken != lOther$isTaken) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$reminderId = reminderId;
    final l$reminderTime = reminderTime;
    final l$isTaken = isTaken;
    return Object.hashAll([
      l$reminderId,
      _$data.containsKey('reminderTime') ? l$reminderTime : const {},
      _$data.containsKey('isTaken') ? l$isTaken : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateMedicationReminder<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMedicationReminder(
    Variables$Mutation$UpdateMedicationReminder instance,
    TRes Function(Variables$Mutation$UpdateMedicationReminder) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMedicationReminder;

  factory CopyWith$Variables$Mutation$UpdateMedicationReminder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMedicationReminder;

  TRes call({
    String? reminderId,
    DateTime? reminderTime,
    bool? isTaken,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdateMedicationReminder<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedicationReminder<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMedicationReminder(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateMedicationReminder _instance;

  final TRes Function(Variables$Mutation$UpdateMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reminderId = _undefined,
    Object? reminderTime = _undefined,
    Object? isTaken = _undefined,
  }) =>
      _then(Variables$Mutation$UpdateMedicationReminder._({
        ..._instance._$data,
        if (reminderId != _undefined && reminderId != null)
          'reminderId': (reminderId as String),
        if (reminderTime != _undefined)
          'reminderTime': (reminderTime as DateTime?),
        if (isTaken != _undefined) 'isTaken': (isTaken as bool?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMedicationReminder<TRes>
    implements CopyWith$Variables$Mutation$UpdateMedicationReminder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMedicationReminder(this._res);

  TRes _res;

  call({
    String? reminderId,
    DateTime? reminderTime,
    bool? isTaken,
  }) =>
      _res;
}

class Mutation$UpdateMedicationReminder {
  Mutation$UpdateMedicationReminder({
    this.updateMedicationReminder,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateMedicationReminder.fromJson(
      Map<String, dynamic> json) {
    final l$updateMedicationReminder = json['updateMedicationReminder'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedicationReminder(
      updateMedicationReminder: l$updateMedicationReminder == null
          ? null
          : Mutation$UpdateMedicationReminder$updateMedicationReminder.fromJson(
              (l$updateMedicationReminder as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMedicationReminder$updateMedicationReminder?
      updateMedicationReminder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMedicationReminder = updateMedicationReminder;
    _resultData['updateMedicationReminder'] =
        l$updateMedicationReminder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMedicationReminder = updateMedicationReminder;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$updateMedicationReminder,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdateMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMedicationReminder = updateMedicationReminder;
    final lOther$updateMedicationReminder = other.updateMedicationReminder;
    if (l$updateMedicationReminder != lOther$updateMedicationReminder) {
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

extension UtilityExtension$Mutation$UpdateMedicationReminder
    on Mutation$UpdateMedicationReminder {
  CopyWith$Mutation$UpdateMedicationReminder<Mutation$UpdateMedicationReminder>
      get copyWith => CopyWith$Mutation$UpdateMedicationReminder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMedicationReminder<TRes> {
  factory CopyWith$Mutation$UpdateMedicationReminder(
    Mutation$UpdateMedicationReminder instance,
    TRes Function(Mutation$UpdateMedicationReminder) then,
  ) = _CopyWithImpl$Mutation$UpdateMedicationReminder;

  factory CopyWith$Mutation$UpdateMedicationReminder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedicationReminder;

  TRes call({
    Mutation$UpdateMedicationReminder$updateMedicationReminder?
        updateMedicationReminder,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<TRes>
      get updateMedicationReminder;
}

class _CopyWithImpl$Mutation$UpdateMedicationReminder<TRes>
    implements CopyWith$Mutation$UpdateMedicationReminder<TRes> {
  _CopyWithImpl$Mutation$UpdateMedicationReminder(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedicationReminder _instance;

  final TRes Function(Mutation$UpdateMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMedicationReminder = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedicationReminder(
        updateMedicationReminder: updateMedicationReminder == _undefined
            ? _instance.updateMedicationReminder
            : (updateMedicationReminder
                as Mutation$UpdateMedicationReminder$updateMedicationReminder?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<TRes>
      get updateMedicationReminder {
    final local$updateMedicationReminder = _instance.updateMedicationReminder;
    return local$updateMedicationReminder == null
        ? CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder
            .stub(_then(_instance))
        : CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder(
            local$updateMedicationReminder,
            (e) => call(updateMedicationReminder: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateMedicationReminder<TRes>
    implements CopyWith$Mutation$UpdateMedicationReminder<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedicationReminder(this._res);

  TRes _res;

  call({
    Mutation$UpdateMedicationReminder$updateMedicationReminder?
        updateMedicationReminder,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<TRes>
      get updateMedicationReminder =>
          CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder
              .stub(_res);
}

const documentNodeMutationUpdateMedicationReminder = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateMedicationReminder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'reminderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'reminderTime')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'isTaken')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateMedicationReminder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'reminderId'),
            value: VariableNode(name: NameNode(value: 'reminderId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'reminderTime'),
            value: VariableNode(name: NameNode(value: 'reminderTime')),
          ),
          ArgumentNode(
            name: NameNode(value: 'isTaken'),
            value: VariableNode(name: NameNode(value: 'isTaken')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reminderId'),
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
Mutation$UpdateMedicationReminder _parserFn$Mutation$UpdateMedicationReminder(
        Map<String, dynamic> data) =>
    Mutation$UpdateMedicationReminder.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMedicationReminder = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdateMedicationReminder?,
);

class Options$Mutation$UpdateMedicationReminder
    extends graphql.MutationOptions<Mutation$UpdateMedicationReminder> {
  Options$Mutation$UpdateMedicationReminder({
    String? operationName,
    required Variables$Mutation$UpdateMedicationReminder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicationReminder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedicationReminder? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedicationReminder>? update,
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
                        : _parserFn$Mutation$UpdateMedicationReminder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedicationReminder,
          parserFn: _parserFn$Mutation$UpdateMedicationReminder,
        );

  final OnMutationCompleted$Mutation$UpdateMedicationReminder?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdateMedicationReminder
    extends graphql.WatchQueryOptions<Mutation$UpdateMedicationReminder> {
  WatchOptions$Mutation$UpdateMedicationReminder({
    String? operationName,
    required Variables$Mutation$UpdateMedicationReminder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicationReminder? typedOptimisticResult,
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
          document: documentNodeMutationUpdateMedicationReminder,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdateMedicationReminder,
        );
}

extension ClientExtension$Mutation$UpdateMedicationReminder
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMedicationReminder>>
      mutate$UpdateMedicationReminder(
              Options$Mutation$UpdateMedicationReminder options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateMedicationReminder>
      watchMutation$UpdateMedicationReminder(
              WatchOptions$Mutation$UpdateMedicationReminder options) =>
          this.watchMutation(options);
}

class Mutation$UpdateMedicationReminder$HookResult {
  Mutation$UpdateMedicationReminder$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdateMedicationReminder runMutation;

  final graphql.QueryResult<Mutation$UpdateMedicationReminder> result;
}

Mutation$UpdateMedicationReminder$HookResult
    useMutation$UpdateMedicationReminder(
        [WidgetOptions$Mutation$UpdateMedicationReminder? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$UpdateMedicationReminder());
  return Mutation$UpdateMedicationReminder$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateMedicationReminder>
    useWatchMutation$UpdateMedicationReminder(
            WatchOptions$Mutation$UpdateMedicationReminder options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateMedicationReminder
    extends graphql.MutationOptions<Mutation$UpdateMedicationReminder> {
  WidgetOptions$Mutation$UpdateMedicationReminder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMedicationReminder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMedicationReminder? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMedicationReminder>? update,
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
                        : _parserFn$Mutation$UpdateMedicationReminder(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdateMedicationReminder,
          parserFn: _parserFn$Mutation$UpdateMedicationReminder,
        );

  final OnMutationCompleted$Mutation$UpdateMedicationReminder?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdateMedicationReminder
    = graphql.MultiSourceResult<Mutation$UpdateMedicationReminder> Function(
  Variables$Mutation$UpdateMedicationReminder, {
  Object? optimisticResult,
  Mutation$UpdateMedicationReminder? typedOptimisticResult,
});
typedef Builder$Mutation$UpdateMedicationReminder = widgets.Widget Function(
  RunMutation$Mutation$UpdateMedicationReminder,
  graphql.QueryResult<Mutation$UpdateMedicationReminder>?,
);

class Mutation$UpdateMedicationReminder$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateMedicationReminder> {
  Mutation$UpdateMedicationReminder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateMedicationReminder? options,
    required Builder$Mutation$UpdateMedicationReminder builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdateMedicationReminder(),
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

class Mutation$UpdateMedicationReminder$updateMedicationReminder {
  Mutation$UpdateMedicationReminder$updateMedicationReminder({
    required this.reminderId,
    required this.message,
    this.$__typename = 'UpdateMedicationReminderResponse',
  });

  factory Mutation$UpdateMedicationReminder$updateMedicationReminder.fromJson(
      Map<String, dynamic> json) {
    final l$reminderId = json['reminderId'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMedicationReminder$updateMedicationReminder(
      reminderId: (l$reminderId as String),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String reminderId;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$reminderId = reminderId;
    _resultData['reminderId'] = l$reminderId;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$reminderId = reminderId;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$reminderId,
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$UpdateMedicationReminder$updateMedicationReminder) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$reminderId = reminderId;
    final lOther$reminderId = other.reminderId;
    if (l$reminderId != lOther$reminderId) {
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

extension UtilityExtension$Mutation$UpdateMedicationReminder$updateMedicationReminder
    on Mutation$UpdateMedicationReminder$updateMedicationReminder {
  CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<
          Mutation$UpdateMedicationReminder$updateMedicationReminder>
      get copyWith =>
          CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<
    TRes> {
  factory CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder(
    Mutation$UpdateMedicationReminder$updateMedicationReminder instance,
    TRes Function(Mutation$UpdateMedicationReminder$updateMedicationReminder)
        then,
  ) = _CopyWithImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder;

  factory CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder;

  TRes call({
    String? reminderId,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder<
        TRes>
    implements
        CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<
            TRes> {
  _CopyWithImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMedicationReminder$updateMedicationReminder _instance;

  final TRes Function(
      Mutation$UpdateMedicationReminder$updateMedicationReminder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? reminderId = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateMedicationReminder$updateMedicationReminder(
        reminderId: reminderId == _undefined || reminderId == null
            ? _instance.reminderId
            : (reminderId as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder<
        TRes>
    implements
        CopyWith$Mutation$UpdateMedicationReminder$updateMedicationReminder<
            TRes> {
  _CopyWithStubImpl$Mutation$UpdateMedicationReminder$updateMedicationReminder(
      this._res);

  TRes _res;

  call({
    String? reminderId,
    String? message,
    String? $__typename,
  }) =>
      _res;
}
