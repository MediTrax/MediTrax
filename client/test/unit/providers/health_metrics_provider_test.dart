import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meditrax/providers/health_metrics_provider.dart';

import '../../helpers/test_helper.dart';

void main() {
  setUpAll(() async {
    await setupTests();
  });

  tearDownAll(() async {
    await tearDownTests();
  });
  group('Health Metrics Provider Tests', () {
    // late ProviderContainer container;

    // setUp(() {
    //   container = ProviderContainer();
    // });

    // test('initial health metrics should be empty', () async {
    //   final metrics = await container.read(healthMetricsProvider.future);
    //   expect(metrics, isEmpty);
    // });

    // test('health metrics should be filtered by date range', () async {
    //   final startDate = DateTime.now().subtract(const Duration(days: 7));
    //   final endDate = DateTime.now();

    //   final metrics = await container.read(
    //     healthMetricsProvider.future,
    //   );

    //   final filteredMetrics = metrics.where((metric) =>
    //       metric.recordedAt.isAfter(startDate) &&
    //       metric.recordedAt.isBefore(endDate));

    //   for (final metric in filteredMetrics) {
    //     expect(
    //         metric.recordedAt.isAfter(startDate) &&
    //             metric.recordedAt.isBefore(endDate),
    //         true);
    //   }
    // });

    // test('health metrics should be filtered by type', () async {
    //   const metricType = 'blood_pressure';

    //   final metrics = await container.read(
    //     healthMetricsProvider.future,
    //   );

    //   final filteredMetrics =
    //       metrics.where((metric) => metric.metricType == metricType);

    //   for (final metric in filteredMetrics) {
    //     expect(metric.metricType, equals(metricType));
    //   }
    // });
  });
}
