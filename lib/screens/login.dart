import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/signup.dart';

import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.email, required this.password});
  String email;
  String password;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Signup();
            },
          ),
        );
        return await true;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 65,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        getTextField(
                            textEditingController: emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.blueGrey[300],
                            ),
                            textInputType: TextInputType.emailAddress,
                            validation: (val) => validateEmail(val),
                            labelText: "Email",
                            hintText: "Enter email here"),
                        SizedBox(
                          height: 35,
                        ),
                        getTextField(
                          textEditingController: passController,
                          hintText: "Enter password here",
                          textVisible: !passwordVisible,
                          textInputType: TextInputType.visiblePassword,
                          validation: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.blueGrey[300],
                          ),
                          labelText: "Password",
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: Icon(
                                (passwordVisible == true)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                decoration: TextDecoration.underline,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Center(
                            child: InkWell(
                                onTap: () {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                  // Get.toNamed(Routes.HOME_SCREEN);
                                  if (formKey2.currentState!.validate()) {
                                    if ((widget.email ==
                                            emailController.text.trim()) &&
                                        (widget.password ==
                                            passController.text.trim())) {
                                      print("object");
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return Home();
                                          },
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Email and Password dose not match.")),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    color: Colors.blueGrey[300],
                                    alignment: Alignment.center,
                                    child: Text("LOGIN"),
                                    width: MediaQuery.of(context).size.width))),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: "No account?",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12)),
                              TextSpan(
                                  text: " Sign Up!",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return Signup();
                                            },
                                          ),
                                        ),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}
