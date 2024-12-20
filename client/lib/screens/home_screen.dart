import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';
import 'package:meditrax/providers/health_risk_provider.dart';
import 'package:meditrax/providers/medication_provider.dart';
import 'package:meditrax/providers/user_provider.dart';
import 'package:meditrax/providers/app_state.dart';
import 'package:meditrax/providers/medication_reminder_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDataProvider);
    final medicationsAsync = ref.watch(medicationProviderProvider);
    final healthMetricsAsync = ref.watch(healthMetricsProvider);
    final userPointsAsync = ref.watch(userPointsProvider);
    final remindersAsync = ref.watch(medicationReminderProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              ref.refresh(medicationReminderProvider.notifier).fetchReminders(),
              ref.refresh(healthMetricsProvider.future),
              ref.refresh(userPointsProvider.future),
              ref.refresh(healthRiskProvider.future),
            ]);
          },
          child: userAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('加载失败: $error'),
                  ElevatedButton(
                    onPressed: () => ref.refresh(userDataProvider),
                    child: const Text('重试'),
                  ),
                ],
              ),
            ),
            data: (user) => user == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_off_outlined,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '未登录',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Welcome Section
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade50,
                                  border: Border.all(color: Colors.blue.shade100),
                                ),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.transparent,
                                  child: Text(
                                    user.name.characters.first,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '欢迎回来',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    user.name,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Today's Medicine and Next Appointment
                          Row(
                            children: [
                              Expanded(
                                child: remindersAsync.when(
                                  loading: () => _buildLoadingCard(),
                                  error: (err, stack) => GestureDetector(
                                    onTap: () {
                                      ref.refresh(medicationReminderProvider.notifier).fetchReminders();
                                    },
                                    child: _buildErrorCard(),
                                  ),
                                  data: (reminders) {
                                    print('Rendering reminders data: ${reminders.length} reminders');
                                    
                                    final now = DateTime.now();
                                    final todayStart = DateTime(now.year, now.month, now.day);
                                    final todayEnd = todayStart.add(const Duration(days: 1));
                                    
                                    final todayReminders = reminders.where((reminder) {
                                      final reminderTime = reminder.reminderTime.toLocal();
                                      return reminderTime.isAfter(todayStart) && 
                                             reminderTime.isBefore(todayEnd) && 
                                             !reminder.isTaken;
                                    }).length;

                                    print('Today\'s pending reminders: $todayReminders');

                                    return _buildInfoCard(
                                      title: '今日用药',
                                      content: '$todayReminders',
                                      subtitle: '待服用次数',
                                      icon: Icons.medication_rounded,
                                      color: Colors.green,
                                      onTap: () =>
                                          ref.read(appStateProvider.notifier).changeNavigatorIndex(1),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: healthMetricsAsync.when(
                                  loading: () => _buildLoadingCard(),
                                  error: (err, stack) => _buildErrorCard(),
                                  data: (metrics) {
                                    final now = DateTime.now();
                                    final nextAppointment = metrics
                                        .where((m) =>
                                            m.metricType == 'appointment' &&
                                            m.recordedAt.isAfter(now))
                                        .fold<DateTime?>(
                                            null,
                                            (min, m) => min == null ||
                                                    m.recordedAt.isBefore(min)
                                                ? m.recordedAt
                                                : min);

                                    return _buildInfoCard(
                                      title: '下次预约',
                                      content: nextAppointment != null
                                          ? '${nextAppointment.month}月${nextAppointment.day}日'
                                          : '无预约',
                                      subtitle: nextAppointment != null
                                          ? '距今${nextAppointment.difference(now).inDays}天'
                                          : '',
                                      icon: Icons.calendar_month_rounded,
                                      color: Colors.blue,
                                      onTap: () => 
                                      ref.read(appStateProvider.notifier).changeNavigatorIndex(0),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Health Points and Risk Level
                          Row(
                            children: [
                              Expanded(
                                child: userPointsAsync.when(
                                  loading: () => _buildLoadingCard(),
                                  error: (err, stack) => _buildErrorCard(),
                                  data: (points) => _buildInfoCard(
                                    title: '健康积分',
                                    content: '${points['currentPoints']}',
                                    subtitle:
                                        '距下一等级${points['nextLevelPoints'] - points['currentPoints']}分',
                                    icon: Icons.stars_rounded,
                                    color: Colors.amber,
                                    onTap: () => context.go('/rewards'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: ref.watch(healthRiskProvider).when(
                                      loading: () => _buildLoadingCard(),
                                      error: (err, stack) => _buildErrorCard(),
                                      data: (assessments) {
                                        final latestAssessment = assessments
                                                .isNotEmpty
                                            ? assessments
                                                .first // Already sorted by date in provider
                                            : null;

                                        return _buildInfoCard(
                                          title: '健康风险',
                                          content: latestAssessment?.riskLevel ??
                                              '未评估',
                                          subtitle: latestAssessment != null
                                              ? '上次评估: ${latestAssessment.createdAt.month}-${latestAssessment.createdAt.day}'
                                              : '点击进行评估',
                                          icon: Icons.shield_rounded,
                                          color: Colors.purple,
                                          onTap: () => context.go('/health-risk-assessment'),
                                        );
                                      },
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Quick Access Section Title
                          Row(
                            children: [
                              Icon(
                                Icons.grid_view_rounded,
                                color: Colors.blue.shade400,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                '快速访问',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                icon: Icons.health_and_safety_rounded,
                                color: Colors.red,
                                onTap: () =>
                                    context.push('/health-risk-assessment'),
                              ),
                              _buildQuickAccessCard(
                                title: '饮食管理',
                                icon: Icons.restaurant_menu_rounded,
                                color: Colors.green,
                                onTap: () => context.push('/diet-management'),
                              ),
                              _buildQuickAccessCard(
                                title: '处方管理',
                                icon: Icons.description_rounded,
                                color: Colors.blue,
                                onTap: () =>
                                    context.push('/prescription-management'),
                              ),
                              _buildQuickAccessCard(
                                title: 'AI智能助手',
                                icon: Icons.smart_toy_rounded,
                                color: Colors.purple,
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
      ),
    );
  }

  Widget _buildLoadingCard() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildErrorCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Icon(Icons.error_outline, color: Colors.red.shade400),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required String subtitle,
    required IconData icon,
    required MaterialColor color,
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
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: color.shade400,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color.shade700,
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
    required MaterialColor color,
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
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: color.shade400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color.shade700,
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
