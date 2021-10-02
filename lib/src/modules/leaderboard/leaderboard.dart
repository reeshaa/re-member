import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/modules/leaderboard/models/lb_entry.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/widgets/floating_tab_bar.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late final tabController;
  List<LB_Entry>? entries;

  bool isLoading = true;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _getData();
    super.initState();
  }

  _getData() async {
    var data = await ServiceLocator<Api>().GET(Api.leaderboardEndpoint);
    if (data != null && data.statusCode == 200) {
      entries = data.data["leaderboard"]
          .map<LB_Entry>((a) => LB_Entry.fromMap(a))
          .toList();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.grey;
    }

    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.menu),
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
                      Tab(child: Text("This Week")),
                      Tab(child: Text("This Month")),
                      Tab(text: "All Time")
                    ],
                    tabController: tabController,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          // shape: CircleBorder(),
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text("Friends"),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.5,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[100],
                    ),
                    child: isLoading || entries == null
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Palette.selectedTab,
                            ),
                          )
                        : TabBarView(
                            children: List.generate(
                              3,
                              (i) => Container(
                                child: ListView(
                                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  physics: BouncingScrollPhysics(),
                                  children: entries!
                                      .map(
                                        (e) => LeaderboardCard(
                                          entry: e,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            controller: tabController,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.teal,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Send Invite",
                        )),
                  )
                ],
              ))
        ]),
      ),
    ));
  }
}

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({
    Key? key,
    required this.entry,
  }) : super(key: key);
  final LB_Entry entry;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(entry.displayName),
        leading: CircleAvatar(),
        trailing: Text(entry.points.toString()),
      ),
    );
  }
}
