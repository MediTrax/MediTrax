import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/utils/error_handler.dart';

class FamilyCollaborationScreen extends StatefulWidget {
  const FamilyCollaborationScreen({super.key});

  @override
  State<FamilyCollaborationScreen> createState() =>
      _FamilyCollaborationScreenState();
}

class _FamilyCollaborationScreenState extends State<FamilyCollaborationScreen>
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
        title: const Text('家庭协同管理'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '家庭成员'),
            Tab(text: '权限管理'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FamilyMembersTab(),
          PermissionsTab(),
        ],
      ),
    );
  }
}

class FamilyMembersTab extends ConsumerWidget {
  const FamilyMembersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final familyMembersAsync = ref.watch(familyMembersProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '家庭成员',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '管理您的家庭成员及其访问权限',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: familyMembersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('加载失败'),
                    TextButton(
                      onPressed: () => ref.refresh(familyMembersProvider),
                      child: const Text('重试'),
                    ),
                  ],
                ),
              ),
              data: (members) => members.isEmpty
                  ? const Center(child: Text('暂无家庭成员'))
                  : ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        final member = members[index];
                        return _buildMemberCard(
                          name: member
                              .relatedUserId, // You might want to fetch user details
                          relation: member.relationship,
                          hasAccess: member.accessLevel > 0,
                          onAccessChanged: (value) async {
                            try {
                              await ref
                                  .read(familyMembersProvider.notifier)
                                  .updateMember(
                                    memberId: member.id,
                                    accessLevel: value ? '1' : '0',
                                  );
                              ref.refresh(familyMembersProvider);
                            } catch (e) {
                              if (context.mounted) {
                                ErrorHandler.showErrorSnackBar(context, e);
                              }
                            }
                          },
                          onDelete: () async {
                            try {
                              await ref
                                  .read(familyMembersProvider.notifier)
                                  .deleteMember(member.id);
                              ref.refresh(familyMembersProvider);
                            } catch (e) {
                              if (context.mounted) {
                                ErrorHandler.showErrorSnackBar(context, e);
                              }
                            }
                          },
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                // TODO: Show add family member dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加家庭成员'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String relation,
    required bool hasAccess,
    required Function(bool) onAccessChanged,
    required VoidCallback onDelete,
  }) {
    return Card(
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
                    relation,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text('访问权限'),
                const SizedBox(width: 8),
                Switch(
                  value: hasAccess,
                  onChanged: onAccessChanged,
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: onDelete,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
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
            '设置您愿意与家庭成员共享的数据类型',
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
            '注意：只有被授予访问权限的家庭成员才能查看您选择共享的数据。',
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
                // TODO: Implement permission toggle
              },
            ),
          ],
        ),
      ),
    );
  }
}
