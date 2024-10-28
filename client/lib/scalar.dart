import 'package:http/http.dart';
export 'package:http/http.dart';

MultipartFile multipartFileFromJson(dynamic data) =>
    MultipartFile.fromBytes("files", data);
dynamic multipartFileToJson(MultipartFile file) => file;
