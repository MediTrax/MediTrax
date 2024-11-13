import 'package:flutter/material.dart';

class FamilyCollaborationScreen extends StatefulWidget {
  const FamilyCollaborationScreen({super.key});

  @override
  State<FamilyCollaborationScreen> createState() => _FamilyCollaborationScreenState();
}

class _FamilyCollaborationScreenState extends State<FamilyCollaborationScreen> with SingleTickerProviderStateMixin {
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

class FamilyMembersTab extends StatelessWidget {
  const FamilyMembersTab({super.key});

  @override
  Widget build(BuildContext context) {
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
          _buildMemberCard(
            name: '李华',
            relation: '配偶',
            hasAccess: true,
          ),
          const SizedBox(height: 12),
          _buildMemberCard(
            name: '张明',
            relation: '子女',
            hasAccess: false,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement add family member
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
                  onChanged: (value) {
                    // TODO: Implement permission toggle
                  },
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
