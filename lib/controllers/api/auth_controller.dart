import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:vehup/views/home_sceen.dart';

import '../../models/vehicle_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = "".obs;
  var userData = {}.obs;

  Future<void> vendorLogin(String email, String password) async {
    final String url = "https://test.vehup.com/api/vendor-login/";

    final Map<String, dynamic> body = {"email": email, "password": password};

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer YOUR_TOKEN"
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userData.value = data;
        Get.offAll(() => HomeSceen());
        Get.snackbar('Login', 'Success', duration: Duration(seconds: 1));
        // print(data["token"]);
      } else {
        errorMessage.value = "Login failed. Please check your credentials.";
        Get.snackbar('Login failed', ' Please check your credentials.',
            duration: Duration(seconds: 1));
      }
    } catch (e) {
      errorMessage.value = "Something went wrong. Please try again.";
    } finally {
      isLoading.value = false;
    }
  }
}
