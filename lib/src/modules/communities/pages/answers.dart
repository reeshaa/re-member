import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/modules/communities/model/forum_question.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';

class AnswersPage extends StatefulWidget {
  AnswersPage({Key? key, required this.question}) : super(key: key);
  final ForumQuestion question;
  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<AnswersPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  bool isLoading = false;
  _onPress() async {
    if (formKey.currentState?.validate() ?? false) {
      String _answer = _textEditingController.value.text;
      var body = <String, dynamic>{
        "communityId": widget.question.communityId,
        "qid": widget.question.qid,
        "answer": _answer
      };

      var response =
          await ServiceLocator<Api>().POST(Api.forumAddAnswerEndpoint, body);

      if (response != null && response.statusCode == 200) {
        Navigator.pop(context);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          confirmBtnText: "Yayy !",
          title: "Your answer has been submitted !",
          text: response.data["message"],
        );
      } else {
        // Navigator.pop(context);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          confirmBtnText: "Okay",
          title: "Answer could not be sent. Please try again later.",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: size.width * 0.07,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03, horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.question.question,
                      style: TextStyle(
                        fontSize: size.height * 0.042,
                        fontWeight: FontWeight.w700,
                        // color: Palette.selectedTab,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Posted by: " + widget.question.postedBy,
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(),
            Flexible(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 8.0),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        label: Text("Your Answer"),
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusColor: Palette.selectedTab,
                      ),
                      maxLines: 3,
                      style: TextStyle(fontSize: 18),
                      validator: (question) {
                        if (question == null || question.isEmpty) {
                          return "Enter a valid answer";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 75.0),
                    child: OutlinedButton(
                      onPressed: _onPress,
                      child: Text("Submit your answer !"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            (widget.question.answers == null ||
                                    widget.question.answers!.isEmpty)
                                ? "No answers yet"
                                : "Other answers:",
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: widget.question.answers
                              ?.map(
                                (e) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '" ' + e.answer + ' "',
                                            style: TextStyle(fontSize: 18),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          color: Colors.grey[600],
                                          height: 1,
                                          width: 15,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          e.postedBy,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
