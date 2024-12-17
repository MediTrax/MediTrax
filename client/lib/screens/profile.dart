import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meditrax/models/user.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/user.graphql.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';
import 'package:meditrax/providers/schema.graphql.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
              // Profile Switcher Section
              Consumer(
                builder: (context, ref, child) {
                  final profilesFuture =
                      ref.watch(userDataProvider.notifier).getProfiles();
                  return FutureBuilder(
                    future: profilesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      }

                      if (snapshot.hasError) {
                        return const SizedBox.shrink();
                      }

                      final profiles = snapshot.data ?? [];
                      if (profiles.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return InkWell(
                        onTap: () => _showProfileSwitcher(
                            context, ref, profiles, user.id),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('切换档案',
                                    style: TextStyle(color: Colors.grey)),
                                Text(
                                  '${profiles.length}个可访问档案',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.grey[400], size: 20),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(height: 32),
              // Profile Sharing Section (replacing Family Section)
              Consumer(
                builder: (context, ref, child) {
                  final profilesFuture =
                      ref.watch(userDataProvider.notifier).getProfiles();

                  return FutureBuilder(
                    future: profilesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      }

                      if (snapshot.hasError) {
                        return InkWell(
                          onTap: () => context.push('/profile-sharing'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('档案共享', style: TextStyle(fontSize: 16)),
                                  Text('加载失败',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14)),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.grey[400], size: 20),
                            ],
                          ),
                        );
                      }

                      final profiles = snapshot.data ?? [];
                      return InkWell(
                        onTap: () => context.push('/profile-sharing'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('档案共享',
                                    style: TextStyle(fontSize: 16)),
                                Text('${profiles.length}个共享档案',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.grey[400], size: 20),
                          ],
                        ),
                      );
                    },
                  );
                },
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
            ],
          ),
        ),
      ),
    );
  }

  void _showProfileSwitcher(
      BuildContext context,
      WidgetRef ref,
      List<Query$GetProfiles$getProfiles> profiles,
      String currentUserId) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '切换档案',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...profiles.map((profile) {
              final isCurrentProfile =
                  profile.id == ref.read(appStateProvider).selectedProfile;
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    profile.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(profile.name),
                subtitle: Text(profile.phoneNumber),
                trailing: isCurrentProfile
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null,
                onTap: isCurrentProfile
                    ? null
                    : () {
                        ref
                            .read(appStateProvider.notifier)
                            .changeSelectedProfile(profile.id);
                        setState(() {});
                        Navigator.pop(context);
                      },
              );
            }),
          ],
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
              // _buildSettingButton('通知设置', () => context.push('/notifications')),
              // _buildSettingButton('隐私与安全', () => context.push('/privacy')),
              // _buildSettingButton('帮助与支持', () => context.push('/support')),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('logout_button'),
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
