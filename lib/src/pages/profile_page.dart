import 'package:flutter/material.dart';
import 'package:re_member/src/Pages/models/profile_entry.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/utils/constants.dart';
import 'package:re_member/src/widgets/AchievementCard.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile_Entry? entry;
  bool isLoading = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    var data = await ServiceLocator<Api>().GET(Api.profileEndpoint);
    if (data != null && data.statusCode == 200) {
      entry = Profile_Entry.fromMap(data.data);
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Palette.selectedTab,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: topPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
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
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry!.displayName,
                                    style: TextStyle(
                                        fontSize: size.height * 0.042,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(children: [
                                      Text("706"),
                                      Text("Followers")
                                    ]),
                                    SizedBox(width: 30),
                                    Column(children: [
                                      Text("702"),
                                      Text("Following")
                                    ]),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment(1.5, -1.5),
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: size.width * 0.1),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03, vertical: 2),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: -3,
                        children: [
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Astronomy"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Maths"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("French"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                          Chip(
                              label: Text("Physics"),
                              backgroundColor: Colors.green[100]),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      indent: size.width * 0.03,
                      endIndent: size.width * 0.03,
                      thickness: 1.1,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width * 0.06,
                          size.width * 0.035, size.width * 0.06, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Achievements",
                              style: TextStyle(
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800])),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AchievementCard(
                                image: Image.asset(
                                  "assets/images/medal.png",
                                  height: size.width * 0.12,
                                ),
                                heading: "${entry?.points} LP",
                                subheading: "Total Points",
                                size: size,
                              ),
                              AchievementCard(
                                image: Image.asset(
                                  "assets/images/fire.png",
                                  height: size.width * 0.1,
                                ),
                                heading: "2 days",
                                subheading: "Total Streak",
                                size: size,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AchievementCard(
                                image: Image.asset(
                                  "assets/images/q.png",
                                  height: size.width * 0.12,
                                ),
                                heading: "${entry?.questionsCount} Q",
                                subheading: "Total questions",
                                size: size,
                              ),
                              AchievementCard(
                                image: Image.asset(
                                  "assets/images/a.png",
                                  height: size.width * 0.1,
                                ),
                                heading: "${entry?.answersCount} ans",
                                subheading: "Total answered",
                                size: size,
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.04),
                          Divider(
                            indent: size.width * 0.03,
                            endIndent: size.width * 0.03,
                            thickness: 1.1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width * 0.06,
                          size.width * 0.035, size.width * 0.06, 0),
                      child: Column(
                        children: [
                          Text("Recent Activity",
                              style: TextStyle(
                                  fontSize: size.height * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800])),
                        ],
                      ),
                    ),
                  ]),
            ),
    ));
  }
}
