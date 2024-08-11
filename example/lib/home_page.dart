import 'package:dev_api_service_plugin/dev_api_service_plugin.dart';
import 'package:dev_api_service_plugin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DevApiService? apiService;
  String text = "";
  UserModel? loginResponse;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.extended(
                        heroTag: null,
                        onPressed: () async {
                          apiService = DevApiService(
                              email: "test@test.com", password: "test");
                          loginResponse =
                              await apiService?.login() as UserModel;
                        },
                        label: const Text("Connect")),
                    FloatingActionButton.extended(
                      heroTag: null,
                      onPressed: () async {
                        if (apiService != null && loginResponse!.success) {
                          final response = await apiService?.get(
                              authToken: loginResponse!.authToken!,
                              project: "test",
                              endpoint: "test");
                          text = response!.data.toString();
                        } else {
                          error = true;
                          text =
                              "You need to enter a valid email and password to login to DevApiService. If you don't have one, you can create one at the following link: ";
                        }
                        setState(() {});
                      },
                      label: const Text("Get Data"),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(),
                ),
                error
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: const Text(
                              "https://devapiservice.com",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () async =>
                                await launchUrl(Uri.https("devapiservice.com")),
                          )
                        ],
                      )
                    : Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
