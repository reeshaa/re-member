import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/Pages/models/profile_entry.dart';
import 'package:re_member/src/configs/palette.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/auth_service.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/services/userService.dart';
import 'package:re_member/src/utils/constants.dart';
import 'package:re_member/src/widgets/AchievementCard.dart';
import 'package:re_member/src/widgets/avatar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.uid, this.isAtRoot = false})
      : super(key: key);
  final String? uid;
  final bool isAtRoot;
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
    var _uid = widget.uid ?? (ServiceLocator<UserService>().uid ?? "");
    var data =
        await ServiceLocator<Api>().GET(Api.profileEndpoint + '/' + _uid);
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
                          widget.isAtRoot
                              ? IconButton(
                                  onPressed: () => showAboutDialog(
                                    context: context,
                                    applicationName: "PrepSetGo",
                                    applicationLegalese:
                                        "Submission by team Re-member to CodeFury 4.0",
                                  ),
                                  icon: Icon(Icons.info_outline),
                                  iconSize: size.width * 0.07,
                                )
                              : IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(Icons.arrow_back_ios),
                                  iconSize: size.width * 0.07,
                                ),
                          IconButton(
                            onPressed: () =>
                                Provider.of<AuthService>(context, listen: false)
                                    .signout(),
                            icon: Icon(Icons.exit_to_app_rounded),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(children: [
                                        Text("706"),
                                        Text(
                                          "Followers",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                      SizedBox(width: 30),
                                      Column(children: [
                                        Text("702"),
                                        Text(
                                          "Following",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ]),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment(1.5, -1.5),
                            children: [
                              Avatar(size: size),
                              Visibility(
                                visible: widget.uid == null,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
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
                          SizedBox(height: 12),
                          Center(
                            child: Text(
                              "No activity found",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
    ));
  }
}
