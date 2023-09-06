import 'package:finance_app/Widgets/input_field.dart';
import 'package:finance_app/Widgets/primary_button.dart';
import 'package:finance_app/app_utilis.dart';
import 'package:finance_app/screen/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 10,
                  decoration: const BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: const Text(
                    "JOT",
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 25,
                        fontFamily: fontFamily),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 45, bottom: 16),
              width: 20,
              height: 1,
              decoration: const BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Welcome back!",
              style: TextStyle(
                color: colorWhite,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Please enter your details below",
              style: TextStyle(
                  color: colorWhite, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            InputField(
                controller: emailController,
                hintText: "Enter your email",
                icon: Icons.email),
            const SizedBox(
              height: 15,
            ),
            InputField(
                controller: passwordController,
                hintText: "Enter your Passcode",
                obscureText: true,
                icon: Icons.password),
            const SizedBox(
              height: 20,
            ),
            primaryButton(
                text: "Sign In",
                onPressed: () {
                  if (isValidate()) {}
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: colorWhite, fontFamily: fontFamily),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationScreen()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: colorWhite,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  bool isValidate() {
    if (emailController.text.isEmpty) {
      showScaffold(context, 'Please enter your email');
      return false;
    }
    if (passwordController.text.isEmpty) {
      showScaffold(context, 'Please enter your passcode');
      return false;
    }

    return true;
  }
}
