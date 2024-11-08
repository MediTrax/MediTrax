import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "health_metric.freezed.dart";
part "health_metric.g.dart";

@freezed
class HealthMetric extends HiveObject with _$HealthMetric {
  HealthMetric._();

  @HiveType(typeId: 7)
  factory HealthMetric({
    @HiveField(0) required String id,
    @HiveField(1) required String userId,
    @HiveField(2) required String metricType,
    @HiveField(3) required double value,
    @HiveField(4) required String unit,
    @HiveField(5) required DateTime recordedAt,
    @HiveField(6) required DateTime createdAt,
  }) = _HealthMetric;
}
