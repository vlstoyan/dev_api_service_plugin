import 'package:dev_api_service_plugin/dev_api_service_plugin.dart';
import 'package:dev_api_service_plugin/models/response_model.dart';
import 'package:dev_api_service_plugin/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tests", () {
    final apiService = DevApiService(email: "test@test.com", password: "test");

    test('Test Login', () async {
      expect(await apiService.login(), isInstanceOf<UserModel>());
    });

    test('Test Refresh Access', () async {
      expect(await apiService.refreshToken(authToken: "test"),
          isInstanceOf<UserModel>());
    });

    test('Test Get data', () async {
      expect(
          await apiService.get(
              project: "test", endpoint: "test", authToken: "test"),
          isInstanceOf<ResponseModel>());
    });

    test('Test Post data', () async {
      expect(
          await apiService.post(
              project: "test",
              endpoint: "test",
              authToken: "test",
              data: {"test": "test"}),
          isInstanceOf<ResponseModel>());
    });

    test('Test Post data', () async {
      expect(
          await apiService.put(
              project: "test",
              endpoint: "test",
              authToken: "test",
              id: 1,
              data: {"test": "test"}),
          isInstanceOf<ResponseModel>());
    });

    test('Test Post data', () async {
      expect(
          await apiService.delete(
              project: "test", endpoint: "test", authToken: "test", id: 1),
          isInstanceOf<ResponseModel>());
    });
  });
}
