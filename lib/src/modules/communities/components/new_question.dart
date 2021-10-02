import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/utils/constants.dart';

class NewQuestion extends StatefulWidget {
  NewQuestion({Key? key}) : super(key: key);

  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  final TextEditingController _textEditingController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool isLoading = false;

  _onPress() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      String _email = _textEditingController.value.text.trim();
      var body = <String, dynamic>{
        "email": _email,
      };
      var response;
      //     await ServiceLocator<Api>().POST(Api.resetPassEndpoint, body);

      if (true && response != null && response.statusCode == 200) {
        Navigator.pop(context);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          confirmBtnText: "Okay",
          title: "Reset link sent",
          text: "Follow the instructions in the email to reset your password.",
        );
      } else {
        Navigator.pop(context);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          confirmBtnText: "Okay",
          title: "Reset failed",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: borderRadiusLarge,
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: borderRadiusLarge,
          child: Material(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Text(
                        "Ask a question",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Palette.selectedTab,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        "Use this forum to ask your doubts/share some knowledge.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 24.0),
                      child: TextFormField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          labelText: "Question",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(Icons.question_answer),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        maxLines: 3,
                        style: TextStyle(fontSize: 18),
                        validator: (question) {
                          if (question == null || question.isEmpty) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _onPress,
                      child: Text("Send link"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
