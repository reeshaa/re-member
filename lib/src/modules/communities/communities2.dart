import 'package:flutter/material.dart';
import 'package:re_member/src/modules/discover/discover.dart';

import 'package:re_member/src/widgets/floating_tab_bar.dart';

class Communities2 extends StatefulWidget {
  const Communities2({Key? key}) : super(key: key);

  @override
  _Communities2State createState() => _Communities2State();
}

class _Communities2State extends State<Communities2>
    with SingleTickerProviderStateMixin {
  late final blah = TabController(length: 3, vsync: this);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: FloatingTabBar(collectionTabs: [
                  Tab(
                    child: Text(
                      "DISCOVERY",
                    ),
                  ),
                  Tab(
                    child: Text("SUBTOPICS"),
                  ),
                  Tab(
                    child: Text("COMMUNITY"),
                  )
                ], tabController: blah),
              ),
            ),
            SizedBox(
              height: 20,
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
            )
          ],
        ),
      ),
    );
  }
}
