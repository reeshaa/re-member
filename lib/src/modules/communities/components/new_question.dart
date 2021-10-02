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
    // return "Hello from dialog";
    if (formKey.currentState?.validate() ?? false) {
      Navigator.pop(context, _textEditingController.value.text);
    }
  }

  _onCancel() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 340,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: _onCancel,
                          child: Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: _onPress,
                          child: Text("Send link"),
                        ),
                      ],
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
