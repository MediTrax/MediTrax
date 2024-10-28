import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                const Text(
                  '欢迎回来，张三',
                  style: TextStyle(
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
                        content: '10月20日',
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

                // Quick Access Section
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildQuickAccessButton(
                        label: '快速访问',
                        onTap: () {},
                      ),
                      _buildQuickAccessButton(
                        label: 'AI助手',
                        onTap: () => context.go('/ai-helper'),
                      ),
                      _buildQuickAccessButton(
                        label: '最近活动',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Main Features Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _buildFeatureCard(
                      title: '药品管理',
                      icon: Icons.medication,
                      onTap: () => context.go('/medicine-inventory'),
                    ),
                    _buildFeatureCard(
                      title: '预约管理',
                      icon: Icons.calendar_today,
                      onTap: () => context.go('/treatment'),
                    ),
                    _buildFeatureCard(
                      title: '健康记录',
                      icon: Icons.folder_shared,
                      onTap: () => context.go('/medical-records'),
                    ),
                    _buildFeatureCard(
                      title: '健康统计',
                      icon: Icons.bar_chart,
                      onTap: () => context.go('/health-risk-assessment'),
                    ),
                  ],
                ),
              ],
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

  Widget _buildQuickAccessButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildFeatureCard({
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
