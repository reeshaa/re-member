import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/modules/communities/discussion.dart';
import 'package:re_member/src/modules/communities/model/community.dart';
import 'package:re_member/src/widgets/floating_tab_bar.dart';

class Communities2 extends StatefulWidget {
  const Communities2({Key? key, required this.community}) : super(key: key);
  final Community community;

  @override
  _Communities2State createState() => _Communities2State();
}

class _Communities2State extends State<Communities2>
    with SingleTickerProviderStateMixin {
  late final blah = TabController(length: 3, vsync: this);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
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
                    Row(
                      children: [
                        Text(
                          widget.community.participantsCount.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.people),
                          iconSize: size.width * 0.08,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.community.communityName,
                      style: TextStyle(
                        fontSize: size.height * 0.042,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.search),
                      iconSize: size.width * 0.08,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.community.communityDescription,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: FloatingTabBar(
                    collectionTabs: [
                      Tab(
                        child: Text(
                          "DISCUSSION",
                        ),
                      ),
                      Tab(
                        child: Text("SUBTOPICS"),
                      ),
                      Tab(
                        child: Text("COMMUNITY"),
                      )
                    ],
                    tabController: blah,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Discussion(questions: widget.community.forumQuestions),
                    Container(
                      child: Text("lolo"),
                    ),
                    Container(
                      child: Text("NONO"),
                    )
                  ],
                  controller: blah,
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => print("Hello"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Palette.selectedTab,
            label: Row(
              children: [
                Icon(Icons.question_answer_outlined),
                SizedBox(width: 10),
                Text("Ask"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
