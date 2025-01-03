import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'CN');
  bool _isLoading = false;
  bool _isSignup = false;
  bool _useOTP = false;
  String? _otpCode;
  bool _showPassword = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    if (!_useOTP && _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入密码')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (_useOTP) {
        await ref.read(appStateProvider.notifier).loginWithPhoneNumberOTP(
              _phoneNumber.phoneNumber!,
              _otpCode!,
            );
      } else {
        await ref.read(appStateProvider.notifier).loginWithPhoneNumberPassword(
              _phoneNumber.phoneNumber!,
              _passwordController.text,
              '', // captcha parameter
            );
      }
    } catch (e) {
      if (mounted) {
        ErrorHandler.showErrorSnackBar(
          context,
          e,
          prefix: '登录失败: ',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      await ref.read(appStateProvider.notifier).signupWithPhone(
            phone: _phoneNumber.phoneNumber!,
            password: _passwordController.text,
            username: _phoneNumber.phoneNumber!,
          );
    } catch (e) {
      if (mounted) {
        ErrorHandler.showErrorSnackBar(
          context,
          e,
          prefix: '注册失败: ',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _requestOTP() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      await ref.read(appStateProvider.notifier).requestOTP(
            _phoneNumber.phoneNumber!,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('验证码已发送'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ErrorHandler.showErrorSnackBar(
          context,
          e,
          prefix: '发送验证码失败: ',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _handleWeChatLogin() async {
    _showComingSoonDialog('微信登录');
  }

  void _showComingSoonDialog(String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.upcoming_rounded, color: Colors.blue.shade400),
            const SizedBox(width: 8),
            const Text('即将推出'),
          ],
        ),
        content: Text('$feature功能正在开发中，敬请期待！'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('知道了'),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(String phoneNumber) {
    final otpController = TextEditingController();
    final newPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('重置密码'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: otpController,
                decoration: const InputDecoration(
                  labelText: '验证码',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入验证码';
                  }
                  if (value.length != 6) {
                    return '验证码必须是6位数字';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: newPasswordController,
                decoration: const InputDecoration(
                  labelText: '新密码',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入新密码';
                  }
                  if (value.length < 6) {
                    return '密码至少需要6个字符';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await ref.read(userDataProvider.notifier).resetPassword(
                        otpController.text,
                        newPasswordController.text,
                      );
                  if (mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('密码重置成功'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ErrorHandler.showErrorSnackBar(
                      context,
                      e,
                      prefix: '重置密码失败: ',
                    );
                  }
                }
              }
            },
            child: const Text('确认'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleResetPasswordRequest() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      await ref.read(userDataProvider.notifier).requestPasswordReset(
            _phoneNumber.phoneNumber!,
          );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('验证码已发送到您的手机'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        _showResetPasswordDialog(_phoneNumber.phoneNumber!);
      }
    } catch (e) {
      if (mounted) {
        ErrorHandler.showErrorSnackBar(
          context,
          e,
          prefix: '发送验证码失败: ',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        _isSignup ? '注册 MediTrax' : '登录到 MediTrax',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      if (!_isSignup)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('登录方式：'),
                            TextButton(
                              onPressed: () => setState(() => _useOTP = true),
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    _useOTP ? Colors.blue : Colors.grey,
                              ),
                              child: const Text('验证码登录'),
                            ),
                            TextButton(
                              onPressed: () => setState(() => _useOTP = false),
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    !_useOTP ? Colors.blue : Colors.grey,
                              ),
                              child: const Text('密码登录'),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      // Phone number input
                      InternationalPhoneNumberInput(
                        key: const Key('phone_field'),
                        onInputChanged: (PhoneNumber number) {
                          _phoneNumber = number;
                        },
                        onSaved: (PhoneNumber number) {
                          _phoneNumber = number;
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                          showFlags: true,
                          setSelectorButtonAsPrefixIcon: true,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: _phoneNumber,
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        inputDecoration: InputDecoration(
                          labelText: '手机号码',
                          hintText: '请输入手机号码',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        errorMessage: '请输入正确的手机号码',
                      ),
                      const SizedBox(height: 16),
                      // Password or OTP input
                      if (!_useOTP || _isSignup)
                        Column(
                          children: [
                            TextFormField(
                              key: const Key('password_field'),
                              controller: _passwordController,
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                labelText: '密码',
                                hintText: '请输入密码',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(_showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () => setState(
                                      () => _showPassword = !_showPassword),
                                ),
                              ),
                            ),
                            if (!_isSignup && !_useOTP) ...[
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: _handleResetPasswordRequest,
                                  child: const Text('忘记密码？'),
                                ),
                              ),
                            ],
                            if (_isSignup) const SizedBox(height: 16),
                            if (_isSignup)
                              TextFormField(
                                key: const Key('confirm_password_field'),
                                controller: _confirmPasswordController,
                                obscureText: !_showPassword,
                                decoration: InputDecoration(
                                  labelText: '确认密码',
                                  hintText: '请再次输入密码',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      if (_useOTP && !_isSignup) ...[
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                key: const Key('otp_field'),
                                onChanged: (value) =>
                                    setState(() => _otpCode = value),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: '验证码',
                                  hintText: '请输入验证码',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: _isLoading ? null : _requestOTP,
                              child: const Text('获取验证码'),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 24),
                      ElevatedButton(
                        key: const Key('login_button'),
                        onPressed: _isLoading
                            ? null
                            : () {
                                if (_isSignup) {
                                  _handleSignup();
                                } else {
                                  _handleLogin();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _isSignup ? '注册' : '登录',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      if (!_isSignup) ...[
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey[300])),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '或',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.grey[300])),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // WeChat Login Button
                        OutlinedButton.icon(
                          onPressed: _isLoading ? null : _handleWeChatLogin,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Color(0xFF07C160)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(
                            Icons
                                .wechat, // You might want to use a proper WeChat icon
                            color: Color(0xFF07C160),
                          ),
                          label: const Text(
                            '微信登录',
                            style: TextStyle(
                              color: Color(0xFF07C160),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      // Login/Signup toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_isSignup ? '已有账号？' : '还没有账号？'),
                          TextButton(
                            key: const Key('switch_to_signup'),
                            onPressed: _isLoading
                                ? null
                                : () {
                                    setState(() {
                                      _isSignup = !_isSignup;
                                      _passwordController.clear();
                                      _confirmPasswordController.clear();
                                    });
                                  },
                            child: Text(
                              _isSignup ? '去登录' : '去注册',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
