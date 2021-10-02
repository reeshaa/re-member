import 'package:flutter/material.dart';
import 'package:re_member/src/modules/communities/communities_landing.dart';

class ExploreChildren extends StatelessWidget {
  const ExploreChildren({
    required this.title,
    required this.size,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Widget> exploreSliders(List<String> imageList) {
      return imageList
          .map((item) => Container(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Communities2(
                    //             community: item,
                    //           )),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item,
                                fit: BoxFit.fitHeight, width: 150),
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
                                  // item.communityName,
                                  "dummy",
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
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: size.height * 0.15,
          // width: size.width * 0.95,
          margin: EdgeInsets.only(left: 8),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: exploreSliders(imgList),
          ),
        ),
        SizedBox(height: 18)
      ],
    );
  }
}
