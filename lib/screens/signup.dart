import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/login.dart';

import '../widgets/text_field.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

extension EmailValidator on String {}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isVisible1 = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 65,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "SIGN UP",
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
                      textEditingController: nameController,
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.blueGrey[300],
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      labelText: "Name",
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      hintText: "Enter name here"),
                  SizedBox(
                    height: 30,
                  ),
                  getTextField(
                      textEditingController: emailController,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.blueGrey[300],
                      ),
                      validation: (val) => validateEmail(val),
                      labelText: "Email",
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter email here"),
                  SizedBox(
                    height: 30,
                  ),
                  getTextField(
                      textEditingController: mobileNumberController,
                      prefixIcon: Icon(
                        Icons.call_outlined,
                        color: Colors.blueGrey[300],
                      ),
                      labelText: "Mobile No.",
                      textInputType: TextInputType.number,
                      validation: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Mobile Number";
                        }
                        if (val.trim().length != 10) {
                          return "Please Enter Valid Number";
                        }
                        return null;
                      },
                      hintText: "Enter your number"),
                  SizedBox(
                    height: 30,
                  ),
                  getTextField(
                    textEditingController: passwordController,
                    hintText: "Enter password here",
                    validation: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    textVisible: !isVisible1,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.blueGrey[300],
                    ),
                    labelText: "Password",
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible1 = !isVisible1;
                          });
                        },
                        child: Icon(
                          (isVisible1 == true)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  getTextField(
                    textEditingController: confirmPasswordController,
                    hintText: "Confirm password here",
                    textVisible: !isVisible2,
                    validation: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Password";
                      }
                      if (val != passwordController.text)
                        return 'Not match both password';
                      return null;
                    },
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.blueGrey[300],
                    ),
                    labelText: "Confirm Password",
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isVisible2 = !isVisible2;
                          });
                        },
                        child: Icon(
                          (isVisible2 == true)
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return LoginScreen(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            },
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      color: Colors.blueGrey[300],
                      alignment: Alignment.center,
                      child: Text("SIGN UP"),
                      width: MediaQuery.of(context).size.width,
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
