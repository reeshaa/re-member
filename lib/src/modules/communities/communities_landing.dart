import 'package:flutter/material.dart';
import 'package:re_member/src/Pages/profile_page.dart';
import 'package:re_member/src/modules/communities/community_detailed.dart';
import 'package:re_member/src/modules/communities/model/community.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/services/userService.dart';
import 'package:re_member/src/utils/constants.dart';
import 'package:re_member/src/widgets/avatar.dart';

class CommunitiesLanding extends StatefulWidget {
  const CommunitiesLanding({Key? key}) : super(key: key);

  @override
  _CommunitiesLandingState createState() => _CommunitiesLandingState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _CommunitiesLandingState extends State<CommunitiesLanding> {
  List<Community>? communities;

  bool isLoading = true;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    var data = await ServiceLocator<Api>().GET(Api.allCommunitiesEndpoint);
    if (data != null && data.statusCode == 200) {
      communities = data.data["communities"]
          .map<Community>((a) => Community.fromMap(a))
          .toList();
    }
    setState(() {
      isLoading = false;
    });
  }

  List<Widget> communitySliders() => communities!
      .map((item) => Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Communities2(
                            community: item,
                          )),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item.imageURL,
                            fit: BoxFit.cover, width: 150),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.communityName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ))
      .toList();

  List<Widget> otherCommunitySliders() => communities!
      .map((item) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Communities2(
                          community: item,
                        )),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item.imageURL,
                      fit: BoxFit.cover,
                      width: 400,
                      height: 200,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24.0),
                        child: Text(
                          item.communityName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                Text(
                                  item.participantsCount.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              item.participantsCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: topPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  color: Colors.grey,
                  iconSize: size.width * 0.07,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  color: Colors.grey,
                  iconSize: size.width * 0.07,
                ),
              ],
            ),
          ),
          InterestsScroll(
            isLoading: isLoading,
            isError: communities == null,
          ),
          Flexible(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.05),
                  child: Text(
                    "What topic interests you today?",
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  height: size.height * 0.15,
                  // width: size.width * 0.95,
                  margin: EdgeInsets.only(left: 8),
                  child: isLoading
                      ? Center(child: Text("Fetching your interests"))
                      : (communities == null)
                          ? Center(child: Text("Error"))
                          : ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: communitySliders(),
                            ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.05,
                      size.height * 0.055,
                      size.width * 0.05,
                      size.height * 0.03),
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: size.height * 0.042,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Column(
                  children: isLoading
                      ? [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ]
                      : ((communities == null)
                          ? [
                              Text("Error"),
                            ]
                          : otherCommunitySliders()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InterestsScroll extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  const InterestsScroll({
    Key? key,
    required this.isLoading,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02, horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello " + (ServiceLocator<UserService>().name ?? "Learner"),
                style: TextStyle(
                  fontSize: size.height * 0.042,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text("Welcome back",
                  style: TextStyle(
                    fontSize: size.height * 0.022,
                  )),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Avatar(size: size),
          )
        ],
      ),
    );
  }
}
