import 'package:flutter/material.dart';
import 'package:re_member/src/modules/communities/model/forum_question.dart';

class Discussion extends StatefulWidget {
  const Discussion({Key? key, required this.questions}) : super(key: key);
  final List<ForumQuestion> questions;

  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late final blah;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: List.generate(
          widget.questions.length,
          (i) => Card(
            color: Colors.white,
            child: ListTile(
              onTap: () {},
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              title: Text(
                widget.questions[i].question,
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Text(
                widget.questions[i].postedBy,
                style: TextStyle(color: Colors.black),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80"),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumbs_up_down,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
