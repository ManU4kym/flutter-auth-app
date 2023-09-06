import 'package:finance_app/Widgets/input_field.dart';
import 'package:finance_app/Widgets/primary_button.dart';
import 'package:finance_app/app_utilis.dart';
import 'package:finance_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  String genderSelected = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  " Jack ",
                  style: TextStyle(
                      fontSize: 28,
                      color: colorWhite,
                      //fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  "of all trades ",
                  style: TextStyle(
                      fontSize: 28,
                      color: colorWhite,
                      // fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Center(
                child: Text(
                  "Please enter your information",
                  style: TextStyle(
                      fontSize: 14,
                      color: colorWhite,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InputField(
                controller: nameController,
                icon: Icons.person,
                hintText: 'Please enter your name',
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: emailController,
                icon: Icons.email,
                hintText: 'Please enter your email',
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              InputField(
                controller: passwordController,
                icon: Icons.password_sharp,
                hintText: 'Please enter your password',
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 2),
                child: TextFormField(
                  style: const TextStyle(
                    color: colorWhite,
                    fontFamily: 'montserrat',
                  ),
                  textAlign: TextAlign.center,
                  controller: birthController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: colorWhite,
                    ),
                    hintText: 'Enter your birthday',
                    hintStyle: TextStyle(
                      color: colorWhite,
                      fontSize: 11,
                      fontFamily: 'montserrat',
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: colorWhite,
                    )),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorWhite)),
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    // FocusScope.of(context).requestFocus(FocusNode());
                    date = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)))!;
                    String dateFormatter = date.toIso8601String();
                    DateTime dt = DateTime.parse(dateFormatter);
                    var formatter = DateFormat("dd-MMMM-yyyy");
                    birthController.text = formatter.format(dt);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Gender",
                      style: TextStyle(
                          color: colorWhite,
                          letterSpacing: 1,
                          fontFamily: "montserrat",
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                            fit: FlexFit.loose,
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              groupValue: genderSelected,
                              activeColor: colorWhite,
                              title: const Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: colorWhite,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                              value: 'male',
                              onChanged: (val) {
                                setState(() {
                                  genderSelected = val.toString();
                                });
                              },
                            )),
                        Flexible(
                            fit: FlexFit.loose,
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              groupValue: genderSelected,
                              activeColor: colorWhite,
                              title: const Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: colorWhite,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                              value: 'Female',
                              onChanged: (val) {
                                setState(() {
                                  genderSelected = val.toString();
                                });
                                print(genderSelected);
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              primaryButton(
                text: "Sign Up",
                onPressed: () {
                  if (isValidate()) {
                    print('Date Validated');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: colorWhite, fontFamily: fontFamily),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Sign In",
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
        ),
      ),
    );
  }

  bool isValidate() {
    if (nameController.text.isEmpty) {
      showScaffold(context, 'Please enter your name');
      return false;
    }
    if (emailController.text.isEmpty) {
      showScaffold(context, 'Please enter your email');
      return false;
    }
    if (passwordController.text.isEmpty) {
      showScaffold(context, 'Please enter your passcode');
      return false;
    }
    if (birthController.text.isEmpty) {
      showScaffold(context, 'Please enter your birthday');
      return false;
    }
    return true;
  }
}
