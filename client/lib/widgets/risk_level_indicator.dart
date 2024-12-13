import 'package:flutter/material.dart';

class RiskLevelIndicator extends StatelessWidget {
  final String riskLevel;

  const RiskLevelIndicator({
    super.key,
    required this.riskLevel,
  });

  Color _getRiskColor() {
    switch (riskLevel) {
      case '低风险':
        return Colors.green;
      case '中风险':
        return Colors.orange;
      case '高风险':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getRiskIcon() {
    switch (riskLevel) {
      case '低风险':
        return Icons.check_circle;
      case '中风险':
        return Icons.warning;
      case '高风险':
        return Icons.error;
      default:
        return Icons.help;
    }
  }

  String _getRiskDescription() {
    switch (riskLevel) {
      case '低风险':
        return '您的健康状况良好';
      case '中风险':
        return '需要注意一些健康问题';
      case '高风险':
        return '建议及时就医';
      default:
        return '未知风险等级';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getRiskIcon(),
                  color: _getRiskColor(),
                  size: 32,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '风险等级',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      riskLevel,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _getRiskColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getRiskColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _getRiskDescription(),
                style: TextStyle(
                  color: _getRiskColor(),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 