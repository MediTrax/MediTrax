import 'package:meditrax/models/health_metric.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';

class HealthMetricsTest extends HealthMetrics {
  @override
  Future<List<HealthMetric>> build() async {
    return [
      HealthMetric(
        id: '1',
        metricType: 'weight',
        value: 70,
        unit: 'kg',
        recordedAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
      HealthMetric(
        id: '2',
        metricType: 'Blood Pressure',
        value: 72,
        unit: 'mmHg',
        recordedAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
    ];
  }
}
