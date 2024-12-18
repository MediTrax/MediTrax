class Input$Response {
  factory Input$Response({
    required int questionId,
    required String choice,
    String? answer,
  }) =>
      Input$Response._({
        r'questionId': questionId,
        r'choice': choice,
        if (answer != null) r'answer': answer,
      });

  Input$Response._(this._$data);

  factory Input$Response.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$questionId = data['questionId'];
    result$data['questionId'] = (l$questionId as int);
    final l$choice = data['choice'];
    result$data['choice'] = (l$choice as String);
    if (data.containsKey('answer')) {
      final l$answer = data['answer'];
      result$data['answer'] = (l$answer as String?);
    }
    return Input$Response._(result$data);
  }

  Map<String, dynamic> _$data;

  int get questionId => (_$data['questionId'] as int);

  String get choice => (_$data['choice'] as String);

  String? get answer => (_$data['answer'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$questionId = questionId;
    result$data['questionId'] = l$questionId;
    final l$choice = choice;
    result$data['choice'] = l$choice;
    if (_$data.containsKey('answer')) {
      final l$answer = answer;
      result$data['answer'] = l$answer;
    }
    return result$data;
  }

  CopyWith$Input$Response<Input$Response> get copyWith =>
      CopyWith$Input$Response(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$Response || runtimeType != other.runtimeType) {
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
    if (_$data.containsKey('answer') != other._$data.containsKey('answer')) {
      return false;
    }
    if (l$answer != lOther$answer) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$questionId = questionId;
    final l$choice = choice;
    final l$answer = answer;
    return Object.hashAll([
      l$questionId,
      l$choice,
      _$data.containsKey('answer') ? l$answer : const {},
    ]);
  }
}

abstract class CopyWith$Input$Response<TRes> {
  factory CopyWith$Input$Response(
    Input$Response instance,
    TRes Function(Input$Response) then,
  ) = _CopyWithImpl$Input$Response;

  factory CopyWith$Input$Response.stub(TRes res) =
      _CopyWithStubImpl$Input$Response;

  TRes call({
    int? questionId,
    String? choice,
    String? answer,
  });
}

class _CopyWithImpl$Input$Response<TRes>
    implements CopyWith$Input$Response<TRes> {
  _CopyWithImpl$Input$Response(
    this._instance,
    this._then,
  );

  final Input$Response _instance;

  final TRes Function(Input$Response) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? questionId = _undefined,
    Object? choice = _undefined,
    Object? answer = _undefined,
  }) =>
      _then(Input$Response._({
        ..._instance._$data,
        if (questionId != _undefined && questionId != null)
          'questionId': (questionId as int),
        if (choice != _undefined && choice != null)
          'choice': (choice as String),
        if (answer != _undefined) 'answer': (answer as String?),
      }));
}

class _CopyWithStubImpl$Input$Response<TRes>
    implements CopyWith$Input$Response<TRes> {
  _CopyWithStubImpl$Input$Response(this._res);

  TRes _res;

  call({
    int? questionId,
    String? choice,
    String? answer,
  }) =>
      _res;
}

class Input$FilledQuestionnaire {
  factory Input$FilledQuestionnaire({
    required int questionnaireId,
    required List<Input$Response> responses,
  }) =>
      Input$FilledQuestionnaire._({
        r'questionnaireId': questionnaireId,
        r'responses': responses,
      });

  Input$FilledQuestionnaire._(this._$data);

  factory Input$FilledQuestionnaire.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$questionnaireId = data['questionnaireId'];
    result$data['questionnaireId'] = (l$questionnaireId as int);
    final l$responses = data['responses'];
    result$data['responses'] = (l$responses as List<dynamic>)
        .map((e) => Input$Response.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Input$FilledQuestionnaire._(result$data);
  }

  Map<String, dynamic> _$data;

  int get questionnaireId => (_$data['questionnaireId'] as int);

  List<Input$Response> get responses =>
      (_$data['responses'] as List<Input$Response>);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$questionnaireId = questionnaireId;
    result$data['questionnaireId'] = l$questionnaireId;
    final l$responses = responses;
    result$data['responses'] = l$responses.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Input$FilledQuestionnaire<Input$FilledQuestionnaire> get copyWith =>
      CopyWith$Input$FilledQuestionnaire(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$FilledQuestionnaire ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$questionnaireId = questionnaireId;
    final lOther$questionnaireId = other.questionnaireId;
    if (l$questionnaireId != lOther$questionnaireId) {
      return false;
    }
    final l$responses = responses;
    final lOther$responses = other.responses;
    if (l$responses.length != lOther$responses.length) {
      return false;
    }
    for (int i = 0; i < l$responses.length; i++) {
      final l$responses$entry = l$responses[i];
      final lOther$responses$entry = lOther$responses[i];
      if (l$responses$entry != lOther$responses$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$questionnaireId = questionnaireId;
    final l$responses = responses;
    return Object.hashAll([
      l$questionnaireId,
      Object.hashAll(l$responses.map((v) => v)),
    ]);
  }
}

abstract class CopyWith$Input$FilledQuestionnaire<TRes> {
  factory CopyWith$Input$FilledQuestionnaire(
    Input$FilledQuestionnaire instance,
    TRes Function(Input$FilledQuestionnaire) then,
  ) = _CopyWithImpl$Input$FilledQuestionnaire;

  factory CopyWith$Input$FilledQuestionnaire.stub(TRes res) =
      _CopyWithStubImpl$Input$FilledQuestionnaire;

  TRes call({
    int? questionnaireId,
    List<Input$Response>? responses,
  });
  TRes responses(
      Iterable<Input$Response> Function(
              Iterable<CopyWith$Input$Response<Input$Response>>)
          _fn);
}

class _CopyWithImpl$Input$FilledQuestionnaire<TRes>
    implements CopyWith$Input$FilledQuestionnaire<TRes> {
  _CopyWithImpl$Input$FilledQuestionnaire(
    this._instance,
    this._then,
  );

  final Input$FilledQuestionnaire _instance;

  final TRes Function(Input$FilledQuestionnaire) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? questionnaireId = _undefined,
    Object? responses = _undefined,
  }) =>
      _then(Input$FilledQuestionnaire._({
        ..._instance._$data,
        if (questionnaireId != _undefined && questionnaireId != null)
          'questionnaireId': (questionnaireId as int),
        if (responses != _undefined && responses != null)
          'responses': (responses as List<Input$Response>),
      }));

  TRes responses(
          Iterable<Input$Response> Function(
                  Iterable<CopyWith$Input$Response<Input$Response>>)
              _fn) =>
      call(
          responses: _fn(_instance.responses.map((e) => CopyWith$Input$Response(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Input$FilledQuestionnaire<TRes>
    implements CopyWith$Input$FilledQuestionnaire<TRes> {
  _CopyWithStubImpl$Input$FilledQuestionnaire(this._res);

  TRes _res;

  call({
    int? questionnaireId,
    List<Input$Response>? responses,
  }) =>
      _res;

  responses(_fn) => _res;
}
