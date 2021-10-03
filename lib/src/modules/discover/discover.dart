import 'package:flutter/material.dart';
import 'package:re_member/src/configs/palette.dart';

import 'package:re_member/src/modules/leaderboard/models/lb_entry.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/widgets/AchievementCard.dart';
import 'package:re_member/src/widgets/floating_tab_bar.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  late final tabController;

  bool isLoading = false;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
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
        physics: BouncingScrollPhysics(),
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
                Text("Connect",
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
                      Tab(child: Text("Global")),
                      Tab(child: Text("Mutual")),
                      Tab(text: "Contacts")
                    ],
                    tabController: tabController,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                          height: size.height * 0.7,
                          width: size.width * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[100],
                          ),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Column(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      24.0, 10, 24, 10),
                                  child: Container(
                                    height: 150,
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 24,
                                        child: Column(children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "http://clipart-library.com/images_k/transparent-minion/transparent-minion-23.png"),
                                            ),
                                            title: Text('Mr. Jow'),
                                            subtitle: Text('69 followers'),
                                            trailing: Container(
                                              height: 50,
                                              child: SizedBox(
                                                height: 50,
                                                width: 50,
                                                child: AchievementCard(
                                                  image: Image.asset(
                                                    "assets/images/medal.png",
                                                    height: size.width * 0.1,
                                                  ),
                                                  heading: "",
                                                  subheading: "",
                                                  size: size,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Chip(
                                                  label: Text("Physics"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Math"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                              Chip(
                                                  label: Text("Biology"),
                                                  backgroundColor:
                                                      Colors.green[100]),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ),
                              ])
                            ],
                          )),
                    ),
                  ),
                ],
              ))
        ]),
      ),
    ));
  }
}

class DiscoverCard extends StatelessWidget {
  const DiscoverCard({
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
