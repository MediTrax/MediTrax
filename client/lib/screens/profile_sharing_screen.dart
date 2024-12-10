import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../utils/error_handler.dart';

class ProfileSharingScreen extends StatefulWidget {
  const ProfileSharingScreen({super.key});

  @override
  State<ProfileSharingScreen> createState() => _ProfileSharingScreenState();
}

class _ProfileSharingScreenState extends State<ProfileSharingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人档案共享'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '共享档案'),
            Tab(text: '权限管理'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SharedProfilesTab(),
          PermissionsTab(),
        ],
      ),
    );
  }
}

class SharedProfilesTab extends ConsumerWidget {
  const SharedProfilesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesFuture = ref.watch(userDataProvider.notifier).getProfiles();
    final currentUser = ref.watch(userDataProvider).value;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '共享档案',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '管理您的共享档案及其访问权限',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: FutureBuilder(
              future: profilesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('加载失败'),
                        TextButton(
                          onPressed: () =>
                              ref.read(userDataProvider.notifier).getProfiles(),
                          child: const Text('重试'),
                        ),
                      ],
                    ),
                  );
                }

                final profiles = snapshot.data ?? [];
                // Filter out current user's profile
                final sharedProfiles = profiles
                    .where((profile) => profile.id != currentUser?.id)
                    .toList();

                if (sharedProfiles.isEmpty) {
                  return const Center(child: Text('暂无共享档案'));
                }

                return ListView.builder(
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    final profile = sharedProfiles[index];
                    return _buildProfileCard(
                      context,
                      ref,
                      profile.id,
                      profile.name,
                      profile.phoneNumber,
                      profile.role,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showShareProfileDialog(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('共享档案'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String name,
    String phoneNumber,
    String role,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    phoneNumber,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _showUnshareConfirmation(context, ref, id, name),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  void _showShareProfileDialog(BuildContext context, WidgetRef ref) {
    final phoneController = TextEditingController();
    String accessLevel = 'read';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('共享档案'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: '手机号码',
                hintText: '请输入用户的手机号码',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: accessLevel,
              decoration: const InputDecoration(
                labelText: '访问权限',
              ),
              items: const [
                DropdownMenuItem(value: 'read', child: Text('只读')),
                DropdownMenuItem(value: 'write', child: Text('读写')),
              ],
              onChanged: (value) {
                if (value != null) {
                  accessLevel = value;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(userDataProvider.notifier).shareProfile(
                      phoneController.text,
                      accessLevel,
                    );
                await ref.read(userDataProvider.notifier).getProfiles();
                if (context.mounted) {
                  Navigator.pop(context);
                  // Refresh the profiles list
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('共享'),
          ),
        ],
      ),
    );
  }

  void _showUnshareConfirmation(
    BuildContext context,
    WidgetRef ref,
    String id,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认取消共享'),
        content: Text('确定要取消与$name的档案共享吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(userDataProvider.notifier).unshareProfile(id);
                if (context.mounted) {
                  Navigator.pop(context);
                  // Refresh the profiles list
                  ref.read(userDataProvider.notifier).getProfiles();
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('确认取消'),
          ),
        ],
      ),
    );
  }
}

class PermissionsTab extends StatelessWidget {
  const PermissionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '权限管理',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '设置您愿意共享的数据类型',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          _buildPermissionItem(
            title: '用药记录',
            enabled: true,
          ),
          _buildPermissionItem(
            title: '就诊历史',
            enabled: true,
          ),
          _buildPermissionItem(
            title: '健康指标',
            enabled: false,
          ),
          const Spacer(),
          const Text(
            '注意：只有被授予访问权限的用户才能查看您选择共享的数据。',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionItem({
    required String title,
    required bool enabled,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Switch(
              value: enabled,
              onChanged: (value) {
                // TODO: 实现权限切换
              },
            ),
          ],
        ),
      ),
    );
  }
}
