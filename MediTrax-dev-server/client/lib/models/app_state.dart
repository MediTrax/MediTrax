import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/token.dart';

part "app_state.freezed.dart";
part "app_state.g.dart";

@freezed
class AppStateData extends HiveObject with _$AppStateData {
  AppStateData._();

  @HiveType(typeId: 0)
  factory AppStateData({
    @HiveField(0) @Default(0) int navigatorIndex,
    @HiveField(1) Token? token,
    @HiveField(2) @Default("system") String theme,
    @HiveField(3) bool? autoLoginResult,
    @HiveField(4) String? selectedProfile,
  }) = _AppStateData;

  String get bearerToken =>
      token?.accessToken == null ? '' : 'Bearer ${token!.accessToken}';

  bool get isAuth => token != null;
}
