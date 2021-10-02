import 'package:flutter/material.dart';
import 'package:re_member/src/widgets/floating_tab_bar.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard>
    with SingleTickerProviderStateMixin {
  late final blah;
  @override
  void initState() {
    blah = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.arrow_back_ios),
                iconSize: size.width * 0.07,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications),
                iconSize: size.width * 0.08,
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
              Text("Leaderboard",
                  style: TextStyle(
                      fontSize: size.height * 0.042,
                      fontWeight: FontWeight.w700)),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
                iconSize: size.width * 0.08,
              )
            ],
          ),
        ),
        DefaultTabController(
            length: 3,
            child: Column(
              children: [
                FloatingTabBar(
                  collectionTabs: [
                    Tab(
                      child: Text(
                        "This Week",
                      ),
                    ),
                    Tab(
                      child: Text("This Month"),
                    ),
                    Tab(
                      child: Text("All Time"),
                    )
                  ],
                  tabController: blah,
                ),
                Container(
                  height: 200,
                  child: TabBarView(
                    children: [
                      Container(
                        child: Text("KOKO"),
                      ),
                      Container(
                        child: Text("lolo"),
                      ),
                      Container(
                        child: Text("NONO"),
                      )
                    ],
                    controller: blah,
                  ),
                ),
              ],
            ))
      ]),
    ));
  }
}
