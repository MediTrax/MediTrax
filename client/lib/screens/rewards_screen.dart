import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/user_provider.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen>
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
        title: const Text('激励机制'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '积分系统'),
            Tab(text: '成就徽章'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PointsSystemTab(),
          AchievementsTab(),
        ],
      ),
    );
  }
}

class PointsSystemTab extends ConsumerWidget {
  const PointsSystemTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointsAsync = ref.watch(userPointsProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: pointsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('加载失败'),
              TextButton(
                onPressed: () => ref.refresh(achievementsProvider),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
        data: (points) {
          final currentPoints = points.fold(
              0.0, (sum, point) => sum + (point?.pointsEarned ?? 0));
          final nextLevelPoints = ((currentPoints ~/ 100) + 1) * 100;
          final currentLevel = currentPoints ~/ 100;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '积分系统',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                '通过获得成就徽章来提升等级',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text(
                      currentPoints.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('当前积分', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: currentPoints / nextLevelPoints,
                      backgroundColor: Colors.grey[200],
                      color: Colors.black,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('等级 $currentLevel'),
                        Text('等级 ${currentLevel + 1}'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                '已获得积分',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: points.length,
                  itemBuilder: (context, index) {
                    final point = points[index];
                    return _buildAchievementItem(
                      point?.reason ?? '',
                      '+${point?.pointsEarned ?? 0}分',
                      earnedAt: point?.earnedAt ?? DateTime.now(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAchievementItem(
    String name,
    String points, {
    required DateTime earnedAt,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.emoji_events,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '获得于 ${earnedAt.toString().split(' ')[0]}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            points,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class AchievementsTab extends ConsumerWidget {
  const AchievementsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '成就徽章',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '完成特定目标解锁成就徽章',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: achievementsAsync.when(
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
              data: (achievements) => achievements.isEmpty
                  ? const Center(child: Text('暂无成就'))
                  : GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: achievements
                          .map((achievement) => _buildAchievementCard(
                                title: achievement.name,
                                description: achievement.description,
                                iconUrl: achievement.iconUrl,
                                earnedAt: achievement.createdAt,
                              ))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String description,
    required String iconUrl,
    required DateTime earnedAt,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconUrl.isNotEmpty)
              Image.network(
                iconUrl,
                width: 48,
                height: 48,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.emoji_events, size: 48),
              )
            else
              const Icon(Icons.emoji_events, size: 48),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '获得于 ${earnedAt.toString().split(' ')[0]}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
