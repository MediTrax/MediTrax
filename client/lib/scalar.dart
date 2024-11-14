import 'package:http/http.dart';
export 'package:http/http.dart';
import 'package:graphql/client.dart';

MultipartFile multipartFileFromJson(dynamic data) =>
    MultipartFile.fromBytes("files", data);
dynamic multipartFileToJson(MultipartFile file) => file;

DateTime dateTimeFromJson(String date) {
  if (date == "") return DateTime(0);
  // Handle any malformed dates by truncating extra precision
  final regex = RegExp(r'(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{0,6}).*Z');
  final match = regex.firstMatch(date);
  if (match != null) {
    return DateTime.parse('${match.group(1)}Z');
  }
  throw FormatException('Invalid date format: $date');
}

String dateTimeToJson(DateTime date) {
  return date.toUtc().toIso8601String();
}
