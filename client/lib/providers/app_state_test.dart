import 'package:meditrax/models/app_state.dart';
import 'package:meditrax/models/token.dart';
import 'package:meditrax/providers/app_state.dart';

class AppStateTest extends AppState {
  @override
  AppStateData build() {
    return AppStateData();
  }

  @override
  Future<void> loginWithPhoneNumberPassword(
      String phoneNumber, String password, String captcha) async {
    state = state.copyWith(
      token: Token(
        id: "id",
        user: "user",
        accessToken: "accessToken",
        accessTokenExpiry: DateTime.now(),
        refreshTokenExpiry: DateTime.now(),
        device: "device",
        createdAt: DateTime.now(),
      ),
      autoLoginResult: true,
    );
  }

  @override
  Future<bool> tryAutoLogin() async {
    return false;
  }

  @override
  void changeNavigatorIndex(int newIndex) {
    state = state.copyWith(navigatorIndex: newIndex);
  }

  @override
  void changeTheme(String theme) {
    state = state.copyWith(theme: theme);
  }
}
