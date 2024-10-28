import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meditrax/models/app_state.dart';
import 'package:meditrax/models/token.dart';
import 'package:meditrax/providers/auth.graphql.dart';
import 'package:meditrax/providers/graphql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "app_state.g.dart";

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  Box<AppStateData>? _hiveBox;

  Timer? _refreshTokenTimer;

  @override
  AppStateData build() {
    _hiveBox ??= Hive.box<AppStateData>("appState");
    final result = _hiveBox!.get("appState", defaultValue: AppStateData())!;
    return result.copyWith(autoLoginResult: null);
  }

  void changeNavigatorIndex(int newIndex) {
    state = state.copyWith(navigatorIndex: newIndex);
    _hiveBox!.put("appState", state);
  }

  void changeTheme(String theme) {
    state = state.copyWith(theme: theme);
    _hiveBox!.put("appState", state);
  }

  Future<void> mockLoginEmailPassword(String email, String password) async {
    state = state.copyWith(
        token: Token(
            id: "id",
            user: "user",
            accessToken: "accessToken",
            accessTokenExpiry: DateTime.now().add(const Duration(days: 1)),
            refreshTokenExpiry: DateTime.now().add(const Duration(days: 2)),
            device: "device",
            createdAt: DateTime.now()),
        autoLoginResult: true);
    ref.invalidate(graphQLServiceProvider);
    await _hiveBox!.put("appState", state);
  }

  Future<void> loginWithEmailPassword(
      String email, String password, String captcha) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$LoginWithEmailPassword(
              Options$Mutation$LoginWithEmailPassword(
                variables: Variables$Mutation$LoginWithEmailPassword(
                  email: email,
                  password: password,
                  token: captcha,
                ),
              ),
            );

    if (result.hasException) {
      print("login problem");
      throw result.exception!;
    }
    if (result.data == null) return;
    final parsedData = result.parsedData!.loginWithEmailPassword;

    final token = Token(
        id: parsedData.refreshToken,
        user: parsedData.user,
        accessToken: parsedData.accessToken,
        accessTokenExpiry: parsedData.accessTokenExpiry,
        refreshTokenExpiry: parsedData.refreshTokenExpiry,
        device: "",
        createdAt: DateTime.now());

    _refreshTokenTimer = Timer(
      token.accessTokenExpiry.difference(
        DateTime.now(),
      ),
      () {
        refreshToken();
      },
    );
    state = state.copyWith(token: token, autoLoginResult: true);
    ref.invalidate(graphQLServiceProvider);
    await _hiveBox!.put("appState", state);
  }

  Future<void> logout() async {
    state = state.copyWith(
      navigatorIndex: 0,
      token: null,
      autoLoginResult: null,
    );
    _refreshTokenTimer?.cancel();
    _refreshTokenTimer = null;
    ref.invalidate(graphQLServiceProvider);
    // ref.read(shopProvider.notifier).clearData();
    await _hiveBox!.put("appState", state);
  }

  Future<bool> tryAutoLogin() async {
    if (state.token == null) {
      return false;
    }
    try {
      await refreshToken();
      return true;
    } catch (e) {
      await logout();
      return false;
    }
  }

  void setAutoLogin(bool val) {
    state = state.copyWith(autoLoginResult: val);
  }

  Future<void> refreshToken() async {
    if (state.token == null) return;
    final result = await ref.read(graphQLServiceProvider).mutate$RefreshToken(
          Options$Mutation$RefreshToken(
            variables: Variables$Mutation$RefreshToken(
              accessToken: state.token!.accessToken,
              refreshToken: state.token!.id,
              device: "",
            ),
          ),
        );
    if (result.hasException) {
      throw result.exception!;
    }
    if (result.data == null) return;
    final parsedData = result.parsedData!.refreshToken;

    final token = Token(
        id: parsedData.refreshToken,
        user: state.token!.user,
        accessToken: parsedData.accessToken,
        accessTokenExpiry: parsedData.accessTokenExpiry,
        refreshTokenExpiry: parsedData.refreshTokenExpiry,
        device: "",
        createdAt: DateTime.now());

    state = state.copyWith(token: token, autoLoginResult: true);
    _refreshTokenTimer = Timer(
      token.accessTokenExpiry.difference(
        DateTime.now(),
      ),
      () {
        refreshToken();
      },
    );
    ref.invalidate(graphQLServiceProvider);
    await _hiveBox!.put("appState", state);
  }

  // Future<void> requestChangePassword(String email) async {
  //   await ref.read(natsServiceProvider.notifier).makeMicroserviceRequest(
  //         "auth.requestChangePassword",
  //         jsonEncode({
  //           "email": email,
  //         }),
  //         isAuth: true,
  //       );
  // }
}
