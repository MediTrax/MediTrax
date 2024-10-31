import 'package:flutter/material.dart';

class DietManagementScreen extends StatefulWidget {
  const DietManagementScreen({super.key});

  @override
  State<DietManagementScreen> createState() => _DietManagementScreenState();
}

class _DietManagementScreenState extends State<DietManagementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('饮食管理'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '膳食推荐'),
            Tab(text: '食品安全查询'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDietRecommendationTab(),
          _buildFoodSafetyTab(),
        ],
      ),
    );
  }

  Widget _buildDietRecommendationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '个性化膳食推荐',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '根据您的健康状况定制的膳食计划',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          _buildMealCard('早餐', '全麦面包, 鸡蛋, 牛奶'),
          const SizedBox(height: 16),
          _buildMealCard('午餐', '烤鸡胸肉, 蔬菜沙拉, 糙米'),
          const SizedBox(height: 16),
          _buildMealCard('晚餐', '清蒸鱼, 西兰花, 红薯'),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement meal plan update
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('更新膳食计划', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodSafetyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '食品安全查询',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '查询食品的安全信息和营养替代品推荐',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: '输入食品名称',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement search
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('查询', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildFoodSafetyCard('苹果', '安全', '梨'),
          const SizedBox(height: 16),
          _buildFoodSafetyCard('香蕉', '适量', '蓝莓'),
          const SizedBox(height: 16),
          _buildFoodSafetyCard('高钠食品', '避免', '低钠替代品'),
        ],
      ),
    );
  }

  Widget _buildMealCard(String mealTime, String foods) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealTime,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              foods,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodSafetyCard(String food, String status, String alternative) {
    Color statusColor;
    switch (status) {
      case '安全':
        statusColor = Colors.green.shade100;
        break;
      case '适量':
        statusColor = Colors.yellow.shade100;
        break;
      case '避免':
        statusColor = Colors.red.shade100;
        break;
      default:
        statusColor = Colors.grey.shade100;
    }

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  food,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(status),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '推荐替代品: $alternative',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
