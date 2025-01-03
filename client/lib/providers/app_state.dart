import 'dart:async';

import 'package:hive/hive.dart';
import 'package:meditrax/main.dart';
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
    return result.copyWith(autoLoginResult: null, navigatorIndex: 2);
  }

  void changeNavigatorIndex(int newIndex) {
    state = state.copyWith(navigatorIndex: newIndex);
    _hiveBox!.put("appState", state);
  }

  void changeTheme(String theme) {
    state = state.copyWith(theme: theme);
    _hiveBox!.put("appState", state);
  }

  void changeSelectedProfile(String profileId) {
    state = state.copyWith(selectedProfile: profileId);
    _hiveBox!.put("appState", state);
  }

  Future<void> loginWithPhoneNumberOTP(
      String phoneNumber, String otpCode) async {
    final result =
        await ref.read(graphQLServiceProvider).mutate$LoginUserWithOTP(
              Options$Mutation$LoginUserWithOTP(
                variables: Variables$Mutation$LoginUserWithOTP(
                  phoneNumber: phoneNumber,
                  otpCode: otpCode,
                ),
              ),
            );

    if (result.hasException) {
      print("login problem");
      throw result.exception!;
    }
    if (result.data == null) return;
    final parsedData = result.parsedData!.loginUserWithOTP;

    final token = Token(
      id: parsedData!.token.refreshToken,
      user: parsedData.userId,
      accessToken: parsedData.token.accessToken,
      accessTokenExpiry: parsedData.token.accessTokenExpiry,
      refreshTokenExpiry: parsedData.token.refreshTokenExpiry,
      device: parsedData.token.device,
      createdAt: parsedData.token.createdAt,
    );

    _refreshTokenTimer = Timer(
      token.accessTokenExpiry.difference(DateTime.now()),
      () {
        refreshToken();
      },
    );

    state = state.copyWith(
      token: token,
      autoLoginResult: true,
      selectedProfile: null,
      navigatorIndex: 2,
    );
    ref.invalidate(graphQLServiceProvider);
    await _hiveBox!.put("appState", state);
  }

  Future<void> requestOTP(String phoneNumber) async {
    final result = await ref.read(graphQLServiceProvider).mutate$RequestOTP(
          Options$Mutation$RequestOTP(
            variables: Variables$Mutation$RequestOTP(
              phoneNumber: phoneNumber,
            ),
          ),
        );
    if (result.hasException) {
      throw result.exception!;
    }
  }

  Future<void> loginWithPhoneNumberPassword(
      String phoneNumber, String password, String otpCode) async {
    final result = await ref.read(graphQLServiceProvider).mutate$LoginUser(
          Options$Mutation$LoginUser(
            variables: Variables$Mutation$LoginUser(
              phoneNumber: phoneNumber,
              password: password,
            ),
          ),
        );

    if (result.hasException) {
      print("login problem");
      throw result.exception!;
    }
    if (result.data == null) return;
    final parsedData = result.parsedData!.loginUser;

    final token = Token(
      id: parsedData!.token.refreshToken,
      user: parsedData.userId,
      accessToken: parsedData.token.accessToken,
      accessTokenExpiry: parsedData.token.accessTokenExpiry,
      refreshTokenExpiry: parsedData.token.refreshTokenExpiry,
      device: parsedData.token.device,
      createdAt: parsedData.token.createdAt,
    );

    _refreshTokenTimer = Timer(
      token.accessTokenExpiry.difference(DateTime.now()),
      () {
        refreshToken();
      },
    );

    state = state.copyWith(
      token: token,
      autoLoginResult: true,
      selectedProfile: null,
      navigatorIndex: 2,
    );
    ref.invalidate(graphQLServiceProvider);
    await _hiveBox!.put("appState", state);
  }

  Future<void> logout() async {
    state = state.copyWith(
      navigatorIndex: 0,
      token: null,
      autoLoginResult: null,
      selectedProfile: null,
    );
    _refreshTokenTimer?.cancel();
    _refreshTokenTimer = null;
    ref.invalidate(graphQLServiceProvider);
    // ref.read(shopProvider.notifier).clearData();
    ref.read(notificationServiceProvider).cancelAllReminders();
    await _hiveBox!.put("appState", state);
  }

  Future<bool> tryAutoLogin() async {
    print("tryAutoLogin");
    if (state.token == null) {
      print("token is null");
      return false;
    }
    try {
      print("refreshing token");
      await refreshToken();
      return true;
    } catch (e) {
      print("error refreshing token");
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
        id: parsedData!.refreshToken,
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

  // Future<void> loginWithPhonePassword(String phone, String password) async {
  //   final result = await ref.read(graphQLServiceProvider).mutate$LoginUser(
  //         Options$Mutation$LoginUser(
  //           variables: Variables$Mutation$LoginUser(
  //             phoneNumber: phone,
  //             password: password,
  //           ),
  //         ),
  //       );

  //   if (result.hasException) {
  //     throw result.exception!;
  //   }

  //   final loginData = result.parsedData!.loginUser!;
  //   final tokenData = loginData.token;

  //   state = state.copyWith(
  //     token: Token(
  //       id: tokenData.refreshToken,
  //       user: tokenData.user,
  //       accessToken: tokenData.accessToken,
  //       accessTokenExpiry: tokenData.accessTokenExpiry,
  //       refreshTokenExpiry: tokenData.refreshTokenExpiry,
  //       device: tokenData.device,
  //       createdAt: tokenData.createdAt,
  //     ),
  //     selectedProfile: null,
  //     navigatorIndex: 2,
  //   );

  //   // Set up token refresh timer
  //   _refreshTokenTimer = Timer(
  //     tokenData.accessTokenExpiry.difference(DateTime.now()),
  //     () {
  //       refreshToken();
  //     },
  //   );

  //   ref.invalidate(graphQLServiceProvider);
  //   await _hiveBox!.put("appState", state);
  // }

  Future<void> signupWithPhone({
    required String phone,
    required String password,
    required String username,
  }) async {
    final result = await ref.read(graphQLServiceProvider).mutate$CreateUser(
          Options$Mutation$CreateUser(
            variables: Variables$Mutation$CreateUser(
              phoneNumber: phone,
              password: password,
              username: username,
              role: 'USER', // Default role
            ),
          ),
        );

    if (result.hasException) {
      throw result.exception!;
    }

    // After successful signup, login with the new credentials
    await loginWithPhoneNumberPassword(phone, password, "");
  }
}
