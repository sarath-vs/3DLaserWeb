import 'dart:convert';
import 'package:http/http.dart' as http;
import '../log/custom_log.dart';

class Postman {
  static Future<Map<String, String>> getCustomheader() async {
    final header = {
      'Content-type': 'application/json',
    };

    return header;
  }

  static Future<http.Response> sendGetRequest(
    String url,
    String access,
  ) async {
    customLog('URL GET -> $url --access : $access');
    return http.get(
      Uri.parse(url),
      headers: {
        'Authorization': '$access',
      },
    );
  }

  static Future<http.Response> sendPostRequestNoAuth(
      String url, Map<String, dynamic> body) async {
    customLog('URL POST -> $url\nBODY -> $body');
    return http.post(
      Uri.parse(url),
      headers: await getCustomheader(),
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> sendPostRequest(
      String url, Map<String, dynamic> body, access) async {
    customLog('URL POST -> $url\nBODY -> $body');
    return http.post(
      Uri.parse(url),
      headers: {'Authorization': access, 'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> sendPutRequest(
      String url, Map<String, dynamic> body, access) async {
    customLog('URL PUT -> $url\nBODY -> $body');
    return http.put(
      Uri.parse(url),
      headers: {'Authorization': access, 'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> sendDeleteRequest(
    String url,
    String access,
  ) async {
    customLog('URL DEL-> $url');
    return http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': '$access',
      },
    );
  }

  // static Future<http.Response> sendMultipartRequest(
  //     String url, Map<String, String> body, Iterable<File> files,
  //     {String fieldName = 'files', String requestType = 'PUT'}) async {
  //   customLog('URL MULTIPART-> $url\nBODY -> $body');
  //   final header = {
  //     HttpHeaders.contentTypeHeader: 'multipart/form-data',
  //   };

  //   var multipartFiles = <http.MultipartFile>[];

  //   await Future.forEach(
  //     files,
  //     (File file) async {
  //       if (file != null) {
  //         final fileName = file.path.split('/').last;
  //         final fileExtension = fileName.split('.').last;
  //         final multipartFile = http.MultipartFile.fromBytes(
  //           fieldName,
  //           await file.readAsBytes(),
  //           contentType: MediaType('application', fileExtension),
  //           filename: fileName,
  //         );
  //         multipartFiles.add(multipartFile);
  //       }
  //     },
  //   );

  //   final request = http.MultipartRequest(requestType, Uri.parse(url))
  //     ..files.addAll(multipartFiles)
  //     ..headers.addAll(header)
  //     ..headers.addAll(await getCustomheader())
  //     ..fields.addAll(body);
  //   final response = await request.send();
  //   return http.Response(
  //     await response.stream.bytesToString(),
  //     response.statusCode,
  //   );
  // }
}
