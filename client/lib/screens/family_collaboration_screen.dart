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
                          context,
                          ref,
                          member.id,
                          member.relatedUserId,
                          member.relationship,
                          member.accessLevel,
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _showAddMemberDialog(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('添加家庭成员'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(
    BuildContext context,
    WidgetRef ref,
    String id,
    String relatedUserId,
    String relationship,
    int accessLevel,
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
                    relatedUserId,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    relationship,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                DropdownButton<String>(
                  value: accessLevel.toString(),
                  items: const [
                    DropdownMenuItem(value: '0', child: Text('无权限')),
                    DropdownMenuItem(value: '1', child: Text('只读')),
                    DropdownMenuItem(value: '2', child: Text('读写')),
                  ],
                  onChanged: (value) async {
                    if (value != null) {
                      try {
                        await ref.read(familyMembersProvider.notifier).updateMember(
                              memberId: id,
                              accessLevel: value,
                            );
                      } catch (e) {
                        if (context.mounted) {
                          ErrorHandler.showErrorSnackBar(context, e);
                        }
                      }
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _showDeleteConfirmation(context, ref, id),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddMemberDialog(BuildContext context, WidgetRef ref) {
    final userIdController = TextEditingController();
    final relationshipController = TextEditingController();
    String accessLevel = '1'; // Default to read-only

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加家庭成员'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: '用户ID',
                hintText: '请输入家庭成员的用户ID',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: relationshipController,
              decoration: const InputDecoration(
                labelText: '关系',
                hintText: '例如：父母、子女等',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: accessLevel,
              decoration: const InputDecoration(
                labelText: '访问权限',
              ),
              items: const [
                DropdownMenuItem(value: '0', child: Text('无权限')),
                DropdownMenuItem(value: '1', child: Text('只读')),
                DropdownMenuItem(value: '2', child: Text('读写')),
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
                await ref.read(familyMembersProvider.notifier).addMember(
                      relatedUserId: userIdController.text,
                      relationship: relationshipController.text,
                      accessLevel: accessLevel,
                    );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                if (context.mounted) {
                  ErrorHandler.showErrorSnackBar(context, e);
                }
              }
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认删除'),
        content: const Text('确定要删除这位家庭成员吗？此操作不可撤销。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await ref.read(familyMembersProvider.notifier).deleteMember(id);
                if (context.mounted) {
                  Navigator.pop(context);
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
            child: const Text('删除'),
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
