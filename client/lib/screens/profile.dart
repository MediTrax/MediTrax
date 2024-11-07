import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人资料'),
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('加载失败'),
              TextButton(
                onPressed: () => ref.refresh(userDataProvider),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (user) => user == null
            ? const Center(child: Text('未登录'))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileHeader(context, user),
                    _buildAccountSettings(context, ref),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, User user) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: Text(
                      user.name.characters.first,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user.phoneNumber,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  if (user.role == 'VIP')
                    const Chip(
                      label: Text('VIP 会员'),
                      backgroundColor: Color(0xFFF5F5F5),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      labelStyle: TextStyle(fontSize: 12),
                    ),
                ],
              ),
              const Divider(height: 32),
              // Health Points
              InkWell(
                onTap: () => context.push('/rewards'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('健康积分', style: TextStyle(color: Colors.grey)),
                        Text(
                          '1,250',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.grey[400], size: 20),
                  ],
                ),
              ),
              const Divider(height: 32),
              // Quick Info Grid
              Row(
                children: [
                  _buildInfoItem('年龄', '35岁'),
                  _buildInfoItem('血型', 'A型'),
                  _buildInfoItem('身高', '175cm'),
                  _buildInfoItem('体重', '70kg'),
                ],
              ),
              const SizedBox(height: 16),
              // Family Section
              Consumer(
                builder: (context, ref, child) {
                  final familyMembersAsync = ref.watch(familyMembersProvider);

                  return familyMembersAsync.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => InkWell(
                      onTap: () => context.push('/family-collaboration'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('家庭协作', style: TextStyle(fontSize: 16)),
                              Text('加载失败',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14)),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.grey[400], size: 20),
                        ],
                      ),
                    ),
                    data: (members) => InkWell(
                      onTap: () => context.push('/family-collaboration'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('家庭协作',
                                  style: TextStyle(fontSize: 16)),
                              Text('${members.length}位家庭成员',
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.grey[400], size: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildAccountSettings(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '账户设置',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildSettingButton('通知设置', () => context.push('/notifications')),
              _buildSettingButton('隐私与安全', () => context.push('/privacy')),
              _buildSettingButton('帮助与支持', () => context.push('/support')),
              _buildSettingButton('应用设置', () => context.push('/settings')),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await ref.read(appStateProvider.notifier).logout();
                      if (context.mounted) {
                        context.go('/auth');
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ErrorHandler.showErrorSnackBar(context, e);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('退出登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingButton(String title, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
    );
  }
}
