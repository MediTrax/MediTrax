import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> with SingleTickerProviderStateMixin {
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

class PointsSystemTab extends StatelessWidget {
  const PointsSystemTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '积分系统',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            '通过按时服药和完成健康任务获得积分',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                const Text(
                  '750',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const Text('当前积分', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: 0.75,
                  backgroundColor: Colors.grey[200],
                  color: Colors.black,
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('等级 3'),
                    Text('等级 4'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            '今日任务',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildTaskItem('按时服用早间药物', '+10分'),
          _buildTaskItem('记录今日血压', '+15分'),
          _buildTaskItem('完成15分钟步行', '+20分'),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String task, String points) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task),
          Text(
            points,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildAchievementCard('连续服药7天', true),
                _buildAchievementCard('按时复诊5次', true),
                _buildAchievementCard('完成30天健康日记', false),
                _buildAchievementCard('连续监测血压30天', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement view all achievements
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('查看所有成就'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(String title, bool achieved) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              achieved ? '已获得' : '未获得',
              style: TextStyle(
                color: achieved ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
