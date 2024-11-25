import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meditrax/providers/user_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDataProvider);

    return Scaffold(
      body: SafeArea(
        child: userAsync.when(
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome Section
                        Text(
                          '欢迎回来，${user.name}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Today's Medicine and Next Appointment
                        Row(
                          children: [
                            Expanded(
                              child: _buildInfoCard(
                                title: '今日用药',
                                content: '3/4',
                                subtitle: '已完成/总次数',
                                onTap: () => context.go('/medicine-inventory'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildInfoCard(
                                title: '下次预约',
                                content: '10���20日',
                                subtitle: '距今2天',
                                onTap: () => context.go('/treatment'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Health Points and Risk Level
                        Row(
                          children: [
                            Expanded(
                              child: _buildInfoCard(
                                title: '健康积分',
                                content: '750',
                                subtitle: '距下一等级250分',
                                onTap: () => context.go('/rewards'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildInfoCard(
                                title: '健康风险',
                                content: '低风险',
                                subtitle: '上次评估: 10-15',
                                onTap: () => context.go('/health-risk-report'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Quick Access Section Title
                        const Text(
                          '快速访问',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Quick Access Grid
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 1.5,
                          children: [
                            _buildQuickAccessCard(
                              title: '健康风险评估',
                              icon: Icons.health_and_safety,
                              onTap: () =>
                                  context.push('/health-risk-assessment'),
                            ),
                            _buildQuickAccessCard(
                              title: '饮食管理',
                              icon: Icons.restaurant_menu,
                              onTap: () => context.push('/diet-management'),
                            ),
                            _buildQuickAccessCard(
                              title: '处方管理',
                              icon: Icons.description,
                              onTap: () =>
                                  context.push('/prescription-management'),
                            ),
                            _buildQuickAccessCard(
                              title: 'AI智能助手',
                              icon: Icons.smart_toy,
                              onTap: () => context.push('/ai-helper'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAccessCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
