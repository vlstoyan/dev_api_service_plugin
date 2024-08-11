library dev_api_service_plugin;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dev_api_service_plugin/entities/response.dart';
import 'package:dev_api_service_plugin/entities/user.dart';
import 'package:dev_api_service_plugin/models/response_model.dart';
import 'package:dev_api_service_plugin/models/user_model.dart';

class DevApiService {
  final String email;
  final String password;
  DevApiService({
    required this.email,
    required this.password,
  });

  final url = "devapiservice.com";

  FutureOr<User> login() async {
    final response = await http.post(Uri.https(url, "/check_login"),
        body: {"email": email, "password": password});
    return UserModel.fromJson(jsonDecode(response.body));
  }

  FutureOr<User> refreshToken({required String authToken}) async {
    final response = await http.post(Uri.https(url, "/refresh_access"),
        headers: {"Authorization": authToken});
    return UserModel.fromJson(jsonDecode(response.body));
  }

  FutureOr<Response> get(
      {required String authToken,
      required String project,
      required String endpoint,
      Sort? sort,
      int? perPage,
      int? page}) async {
    final requestUrl = Uri.https(
        url,
        "/api/$project/$endpoint",
        sort != null
            ? {"sort": sort.name}
            : perPage != null && page != null
                ? {"perPage": "$perPage", "page": "$page"}
                : null);
    final response = await http.get(
      requestUrl,
      headers: {"Authorization": authToken},
    );
    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  FutureOr<Response> post(
      {required String authToken,
      required String project,
      required String endpoint,
      required Map<String, dynamic> data}) async {
    final response = await http.post(Uri.https(url, "/api/$project/$endpoint"),
        headers: {
          "Authorization": authToken,
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  FutureOr<Response> put(
      {required String authToken,
      required String project,
      required String endpoint,
      required int id,
      required Map<String, dynamic> data}) async {
    final response = await http.put(
        Uri.https(url, "/api/$project/$endpoint/$id"),
        headers: {
          "Authorization": authToken,
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));
    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  FutureOr<Response> delete(
      {required String authToken,
      required String project,
      required String endpoint,
      required int id}) async {
    final response = await http.delete(
        Uri.https(url, "/api/$project/$endpoint/$id"),
        headers: {"Authorization": authToken});
    return ResponseModel.fromJson(jsonDecode(response.body));
  }
}
