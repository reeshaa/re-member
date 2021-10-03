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

final List<Map<String, dynamic>> imgList = [
  {
    'title': 'Dentistry',
    'img':
        'https://images1-fabric.practo.com/teeth-n-gums-dental-clinic-bangalore-1456143507-56cafc93ad857.jpg',
  },
  {
    'title': 'Finance Markets',
    'img':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Philippine-stock-market-board.jpg/250px-Philippine-stock-market-board.jpg',
  },
  {
    'title': 'DNA',
    'img':
        'https://cdn.pixabay.com/photo/2018/07/15/10/44/dna-3539309__480.jpg',
  },
  {
    'title': 'Culinary Sciences',
    'img': 'https://www.tcl.edu/wp-content/uploads/culinaryAD300_400.png',
  },
  {
    'title': 'Technical Analysis',
    'img':
        'https://www.investopedia.com/thmb/d6VF2gfx_W0UZC77q8RTZKFDsRc=/3711x2087/smart/filters:no_upscale()/dotdash_Final_Technical_Analysis_Strategies_for_Beginners_Sep_2020-01-2fd259fdcac044dd824d1b565e53b4e6.jpg'
  },
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
