import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehup/widgets/custom_button.dart';
import '../controllers/api/auth_controller.dart';
import '../widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController emailController =
      TextEditingController(text: "test@lilacinfotech.com");
  final TextEditingController passwordController =
      TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 247, 247),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                          'assets/icons/logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    'Login With Your Email &\n Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  emailController: emailController,
                  labelText: 'Enter your email',
                ),
                SizedBox(height: 30),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  emailController: passwordController,
                  labelText: 'Enter your password',
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 14, color: Color(0xFF4356FF)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => CustomButton(
                    onTap: () {
                      loginController.vendorLogin(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      // loginController.fetchVendorRequirements();
                    },
                    size: size,
                    title: "Login",
                    active: loginController.isLoading.value,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                          fontSize: 16, color: Colors.black), // Black color
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF4356FF)), // Blue color
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
