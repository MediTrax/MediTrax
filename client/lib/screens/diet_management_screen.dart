import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/diet_plan_provider.dart';
import 'package:meditrax/models/diet_plan.dart';

class DietManagementScreen extends ConsumerStatefulWidget {
  const DietManagementScreen({super.key});

  @override
  ConsumerState<DietManagementScreen> createState() => _DietManagementScreenState();
}

class _DietManagementScreenState extends ConsumerState<DietManagementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

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

  Future<void> _searchFood() async {
    final searchTerm = _searchController.text.trim();
    if (searchTerm.isEmpty) return;

    setState(() {
      _isSearching = true;
    });

    try {
      final foodSpecsNotifier = ref.read(foodSpecsProvider.notifier);
      await foodSpecsNotifier.getMockFoodSpecs(searchTerm);
      
      print('Search completed for: $searchTerm');
    } catch (e) {
      print('Error during search: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('搜索失败: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSearching = false;
        });
      }
    }
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
    final recommendationState = ref.watch(foodRecommendationProvider);

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
          Center(
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ref.read(foodRecommendationProvider.notifier)
                      .getMockFoodRecommendation();
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.restaurant_menu),
                label: const Text(
                  '推荐膳食',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          recommendationState.when(
            loading: () => const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('正在生成推荐...'),
                ],
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '获取推荐失败: $error',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {
                      ref.read(foodRecommendationProvider.notifier)
                          .getMockFoodRecommendation();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('重试'),
                  ),
                ],
              ),
            ),
            data: (recommendation) {
              if (recommendation == null) {
                return const Center(
                  child: Text(
                    '点击上方按钮获取推荐膳食',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                );
              }

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.1),
                        Theme.of(context).primaryColor.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.recommend,
                              color: Theme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            '今日推荐',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        recommendation.name,
                        style: const TextStyle(
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '更新时间: ${DateTime.now().toString().substring(0, 16)}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

Widget _buildFoodSafetyTab() {
    final foodSpecsState = ref.watch(foodSpecsProvider);

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
          Row(
            children: const [
              Icon(Icons.info_outline, size: 16, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '查询食品的安全信息和营养替代品推荐',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
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
                    prefixIcon: Icon(Icons.search),
                  ),
                  onSubmitted: (_) => _searchFood(),
                ),
              ),
              const SizedBox(width: 16),
              FilledButton.icon(
                onPressed: _isSearching ? null : _searchFood,
                icon: _isSearching
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.search),
                label: const Text('查询'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          foodSpecsState.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '加载失败: $error',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _searchFood,
                    icon: const Icon(Icons.refresh),
                    label: const Text('重试'),
                  ),
                ],
              ),
            ),
            data: (foodSpecs) {
              if (foodSpecs == null) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('请输入食品名称进行查询'),
                    ],
                  ),
                );
              }
              
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.recommend, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            '食用建议',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(foodSpecs.howRecommend),
                      ),
                      const Divider(height: 32),
                      Row(
                        children: const [
                          Icon(Icons.restaurant_menu, color: Colors.green),
                          SizedBox(width: 8),
                          Text(
                            '营养成分',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...foodSpecs.specs.map((spec) => _buildNutritionRow(spec)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionRow(FoodSpec spec) {
    print('\n=== Nutrition Row Debug Info ===');
    print('Name: ${spec.name}');
    print('Value: ${spec.value}');
    print('Unit: ${spec.unit}');
    print('How High: ${spec.howHigh}');

    // Parse howHigh value (ensure it's between 0 and 1)
    final howHigh = double.tryParse(spec.howHigh) ?? 0;
    final normalizedHowHigh = howHigh.clamp(0.0, 1.0);
    
    // Status indicators based on howHigh value
    final isHigh = normalizedHowHigh > 0.7;
    final isRecommended = normalizedHowHigh >= 0.3 && normalizedHowHigh <= 0.7;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isHigh)
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20)
              else if (isRecommended)
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 20)
              else
                const SizedBox(width: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spec.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Display value and unit
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      spec.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (spec.unit.isNotEmpty) ...[
                      const SizedBox(width: 4),
                      Text(
                        spec.unit,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Display howHigh value
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: isHigh 
                      ? Colors.orange.withOpacity(0.1)
                      : isRecommended
                          ? Colors.green.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '指数: ${spec.howHigh}',
                      style: TextStyle(
                        color: isHigh 
                            ? Colors.orange
                            : isRecommended
                                ? Colors.green
                                : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              // Background progress bar
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              // Foreground progress bar with normalized howHigh value
              FractionallySizedBox(
                widthFactor: normalizedHowHigh,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isHigh
                          ? [Colors.orange.shade300, Colors.orange]
                          : isRecommended
                              ? [Colors.green.shade300, Colors.green]
                              : [Colors.grey.shade300, Colors.grey],
                    ),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: (isHigh
                            ? Colors.orange
                            : isRecommended
                                ? Colors.green
                                : Colors.grey)
                            .withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              // Current howHigh value indicator
              Positioned(
                left: MediaQuery.of(context).size.width * normalizedHowHigh - 48,
                top: -15,
                child: Text(
                  spec.howHigh,
                  style: TextStyle(
                    fontSize: 10,
                    color: isHigh 
                        ? Colors.orange
                        : isRecommended
                            ? Colors.green
                            : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Scale markers (0 to 1)
              ...List.generate(
                5,
                (index) {
                  final markerValue = (index * 0.25).toStringAsFixed(2);
                  return Positioned(
                    left: MediaQuery.of(context).size.width * (index / 4) - 48,
                    child: Column(
                      children: [
                        Container(
                          width: 1,
                          height: 8,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        if (index % 2 == 0) // Show every other label
                          Text(
                            markerValue,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade600,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              // Recommended range indicators (0.3 - 0.7)
              Positioned(
                left: MediaQuery.of(context).size.width * 0.3 - 48,
                child: Container(
                  width: 2,
                  height: 8,
                  color: Colors.green.withOpacity(0.5),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.7 - 48,
                child: Container(
                  width: 2,
                  height: 8,
                  color: Colors.orange.withOpacity(0.5),
                ),
              ),
            ],
          ),
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
}