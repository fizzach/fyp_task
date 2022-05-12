import 'package:fyp_task/custom_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fyp_task/custom%20widgets/custom_widgets.dart';
import 'package:fyp_task/forget_password.dart';
import 'package:fyp_task/utils.dart';
import 'package:fyp_task/wavy_design.dart';
import 'package:get/get.dart';
import 'package:fyp_task/subjects_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool passwordVisible = true;

  // Visibility of password
  void _passwordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WavyDesign2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: responsiveHW(context, ht: 37),
                    decoration: const BoxDecoration(
                      color: Color(0x22009688),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WavyDesign3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: responsiveHW(context, ht: 37),
                    decoration: const BoxDecoration(
                      color: Color(0x44009688),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WavyDesign1(),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: responsiveHW(context, ht: 3)),
                      ),
                    ),
                    width: double.infinity,
                    height: responsiveHW(context, ht: 37),
                    decoration: const BoxDecoration(
                      color: Color(0xff009688),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(children: [
                customTextField("Email", Icons.email, false, null, _email,
                    (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Email";
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please Enter Valid Email Address";
                  }
                }, (value) {
                  _email.text = value!;
                }, responsiveHW(context, wd: 100),
                    responsiveHW(context, ht: 100)),
                SizedBox(
                  height: responsiveHW(context, ht: 2),
                ),
                customTextField(
                    "Password",
                    Icons.lock,
                    passwordVisible,
                    IconButton(
                      icon: Icon(
                        //choose the icon on based of passwordVisibility
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: _passwordVisibility,
                    ),
                    _password, (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Password";
                  }
                }, (value) {
                  _password.text = value!;
                }, responsiveHW(context, wd: 100),
                    responsiveHW(context, ht: 100)),
                SizedBox(
                  height: responsiveHW(context, ht: 3),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: responsiveHW(context, wd: 6)!.toDouble()),
                  child: customButton("Login", () {
                    Get.to(
                      () => const SubjectsPage(),
                    );
                  }, context, 35),
                ),
                SizedBox(
                  height: responsiveHW(context, ht: 0.8),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return const ForgotPassword();
                          });
                    },
                    child: Text(
                      "Forgotten password?",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: responsiveHW(context, ht: 1.8),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
