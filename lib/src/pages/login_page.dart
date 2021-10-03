import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/services/auth_service.dart';
import 'package:re_member/src/widgets/reset_password.dart';

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
  final TextEditingController nameController = new TextEditingController();
  bool isLoading = false;
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool isRegisterMode = false;

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

  toggleRegisterMode() {
    setState(() {
      this.isRegisterMode = !isRegisterMode;
    });
  }

  _attemptRegister(String _email, String _password, String _name) async {
    Provider.of<AuthService>(context, listen: false)
        .register(context, _email, _password, _name)
        .then((success) {
      if (!success && this.mounted) {
        this.setState(() {
          isLoading = false;
        });
      }
    });
  }

  _attemptLogin(String _email, String _password) async {
    Provider.of<AuthService>(context, listen: false)
        .attemptLogin(context, _email, _password)
        .then((success) {
      if (!success && this.mounted) {
        this.setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double headingfont = size.height * 0.075;
    double regularfont = size.height * 0.025;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      height: size.height * 0.08,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "PrepSetGO",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
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
                      height: size.height * 0.035,
                    ),
                    Visibility(
                      visible: isRegisterMode,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Please enter your name";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Name",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.account_circle),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 05, 20, 20),
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
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: Icon(Icons.email_rounded),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 05, 20, 0),
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
                            child: Icon(Icons.lock),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          (isRegisterMode) ? "" : "Forgot password?",
                          style: TextStyle(
                              fontSize: regularfont * 0.69,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                        ),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => ResetPassword()),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Center(
                      child: Container(
                        // alignment: Alignment.center,
                        height: size.height * 0.065,
                        width: size.width * 0.9,
                        child: ElevatedButton(
                          style: ButtonStyle(alignment: Alignment.center),
                          child: AnimatedContainer(
                            duration: const Duration(microseconds: 500),
                            padding: EdgeInsets.all(15),
                            child: (isLoading)
                                ? CupertinoActivityIndicator()
                                : Text(
                                    (isRegisterMode) ? 'REGISTER' : 'SIGN IN',
                                    style: TextStyle(
                                        fontSize: regularfont * 0.9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                !isLoading) {
                              setState(
                                () {
                                  isLoading = true;
                                },
                              );
                              if (isRegisterMode)
                                _attemptRegister(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    nameController.text.trim());
                              else
                                _attemptLogin(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(alignment: Alignment.center),
                        child: Text(
                          (isRegisterMode)
                              ? "Existing user? Login instead"
                              : "New here? Register now",
                          style: TextStyle(
                              fontSize: regularfont * 0.69,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue),
                        ),
                        onPressed: toggleRegisterMode,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/aa.jpg",
                        height: size.height * 0.22,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
