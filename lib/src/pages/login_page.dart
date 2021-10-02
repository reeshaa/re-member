import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/auth_service.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool isLoading = false;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  _saveDetails(String _authToken, String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth-token', _authToken);
    await prefs.setString('user', user);
  }

  _attemptLogin(String _email, _password) async {
    Provider.of<AuthService>(context, listen: false)
        .attemptLogin(context, 'xx', 'yy');
    return;
    String url = 'https://ecommerce-calculator.herokuapp.com/api/MPC/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    var postobj = {
      "email": _email,
      "password": _password,
    };
    String message = '';
    Response? response;
    var respobj;
    try {
      response = await ServiceLocator<Api>().POST(url, postobj);
      respobj = json.decode(response?.data);
      message = respobj["message"] ?? "Null";
    } catch (e) {
      print("Caught Exception");
    }

    if (message == "loggedIn") {
      var user = json.encode(respobj["user"]);
      // String _authToken = response.headers;

      // await _saveDetails(_authToken, user);
      // print("Logged in Successfully: $user");
      // Navigator.pushReplacement(
      //     context, new MaterialPageRoute(builder: (context) => LandingPage()));
    } else if (message == "Invalid_Password") {
      // showtoast("Incorrect Password");
      print("Invalid password");
    } else if (message == "Invalid_EmailId") {
      isLoading = false;

      // showtoast("There is no account with us for this email address");
    } else {
      // showtoast("Please try again later !");
    }
    setState(() {
      isLoading = false;
    });
  }

  // showtoast(String text) => .showSnackBar(
  //       SnackBar(
  //         content: Text(text),
  //         elevation: 5,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(30),
  //           ),
  //         ),
  //         backgroundColor: Colors.red,
  //         behavior: SnackBarBehavior.floating,
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double headingfont = size.height * 0.075;
    double regularfont = size.height * 0.025;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Form(
          key: formKey,
          child: Container(
              height: size.height,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.0825,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Hey\nthere,",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: headingfont,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.145,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 0),
                      child: Text(
                        "Enter your Credentials",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: regularfont,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 15, right: 40),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill in your email ID";
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              return "Invalid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                "assets/Mail.svg",
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 40, 0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Password cannot be empty";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset("assets/Lock.svg",
                                  color: Colors.grey[900]),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Text(
                            "New here? Register now",
                            style: TextStyle(
                                fontSize: regularfont * 0.69,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                          onPressed: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: ElevatedButton(
                            child: AnimatedContainer(
                                duration: const Duration(microseconds: 500),
                                padding: EdgeInsets.all(15),
                                child: (isLoading)
                                    ? CupertinoActivityIndicator()
                                    : Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                            fontSize: regularfont * 0.9,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      )),
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  !isLoading) {
                                setState(() {
                                  isLoading = true;
                                });
                                _attemptLogin(emailController.text.trim(),
                                    passwordController.text.trim());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
