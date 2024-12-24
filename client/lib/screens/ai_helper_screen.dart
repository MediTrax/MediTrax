import 'package:flutter/material.dart';

class AiHelperScreen extends StatefulWidget {
  const AiHelperScreen({super.key});

  @override
  State<AiHelperScreen> createState() => _AiHelperScreenState();
}

class _AiHelperScreenState extends State<AiHelperScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 智能功能'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '智能健康助手'),
            Tab(text: '健康洞察'),
            Tab(text: '文档分析'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AiAssistantTab(messageController: _messageController),
          const HealthInsightsTab(),
          const DocumentAnalysisTab(),
        ],
      ),
    );
  }
}

class AiAssistantTab extends StatelessWidget {
  final TextEditingController messageController;

  const AiAssistantTab({
    super.key,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '智能健康助手',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      '与AI助手对话，获取健康建议',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    _buildAiMessage(
                      '您好！我是您的智能健康助手。我可以回答您的健康问题，提供用药建议，或者帮助您理解医疗报告。请问有��么我可以帮助您的吗？',
                    ),
                    _buildUserMessage(
                      '我最近感觉有点头晕，这可能是什么原因造成的？',
                    ),
                    _buildAiMessage(
                      '头晕可能由多种原因引起，包括但不限于：脱水、低血糖、贫血、内耳问题、血压异常等。建议您先检查一下自己的饮水和饮食情况，确保充足的水分和营养摄入。',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: '输入您的问题...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('功能开发中'),
                        content: const Text('该功能正在开发中，敬请期待！'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('确定'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.send),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(message),
      ),
    );
  }

  Widget _buildUserMessage(String message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 48),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HealthInsightsTab extends StatelessWidget {
  const HealthInsightsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '健康洞察',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '基于您的健康数据，提供个性化的健康建议',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildInsightCard(
              '血压趋势分析',
              '根据您最近30天的血压记录，您的血压呈现稳定下降趋势。继续保持当前的用药和生活方式，效果良好。',
            ),
            const SizedBox(height: 16),
            _buildInsightCard(
              '运动建议',
              '您的日均步数略低于推荐水平。建议每天增加15分钟的散步，有助于进一步改善心血管健康。',
            ),
            const SizedBox(height: 16),
            _buildInsightCard(
              '营养建议',
              '您的钾摄入可能不足。建议适当增加香蕉、菠菜等高钾食物的摄入，但请先咨询医生意见。',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class DocumentAnalysisTab extends StatelessWidget {
  const DocumentAnalysisTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '文档分析',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '上传医疗文档，获取AI分析和解读',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '上传医疗文档',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {
                        // TODO: Implement file picker
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                        child: Text('Choose File'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('no file selected'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement document analysis
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('上传并分析'),
              ),
            ),
            const SizedBox(height: 24),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '分析结果',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('上传文档后，AI将自动分析并提供简明的解读和建议。'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
