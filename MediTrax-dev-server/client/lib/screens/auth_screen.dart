import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/utils/error_handler.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _isSignup = false;
  bool _useOTP = true;
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
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入手机号码')),
      );
      return;
    }

    if (!_useOTP && _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入密码')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (_useOTP) {
        throw UnimplementedError('OTP login not implemented yet');
      } else {
        await ref.read(appStateProvider.notifier).loginWithPhoneNumberPassword(
              _phoneController.text,
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
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入手机号码')),
      );
      return;
    }

    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入密码')),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('两次输入的密码不一致')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(appStateProvider.notifier).signupWithPhone(
            phone: _phoneController.text,
            password: _passwordController.text,
            username: _phoneController.text,
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
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入手机号码')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      throw UnimplementedError('OTP functionality not implemented yet');
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
    setState(() => _isLoading = true);

    try {
      throw UnimplementedError('WeChat login not implemented yet');
    } catch (e) {
      if (mounted) {
        ErrorHandler.showErrorSnackBar(
          context,
          e,
          prefix: '微信登录失败: ',
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
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
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: '手机号码',
                        hintText: '请输入手机号码',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Password or OTP input
                    if (!_useOTP || _isSignup)
                      Column(
                        children: [
                          TextField(
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
                          if (_isSignup) const SizedBox(height: 16),
                          if (_isSignup)
                            TextField(
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
                            child: TextField(
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
