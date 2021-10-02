import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Communities extends StatefulWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  _CommunitiesState createState() => _CommunitiesState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class _CommunitiesState extends State<Communities> {
  final List<Widget> communitySliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.fitHeight, width: 150),
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
                            'Physics',
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
          ))
      .toList();
  final List<Widget> otherCommunitySliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.fitHeight, width: 400),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 24.0),
                          child: Text(
                            "Astronomy",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Text(
                                      '36.2K',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '144.2K',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.menu),
                    iconSize: size.width * 0.08,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Reesha!",
                          style: TextStyle(
                              fontSize: size.height * 0.042,
                              fontWeight: FontWeight.w700)),
                      Text("Welcome back",
                          style: TextStyle(
                            fontSize: size.height * 0.022,
                          )),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: size.width * 0.075,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: size.width * 0.05),
              child: Text(
                "What topic interests you today?",
                style: TextStyle(
                    fontSize: size.width * 0.05, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              height: size.height * 0.15,
              // width: size.width * 0.95,
              margin: EdgeInsets.only(left: 8),
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: communitySliders),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 0.05,
                  size.height * 0.055, size.width * 0.05, size.height * 0.03),
              child: Text("Discover",
                  style: TextStyle(
                      fontSize: size.height * 0.042,
                      fontWeight: FontWeight.w700)),
            ),
            Expanded(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: otherCommunitySliders),
            ),
          ],
        ),
      ),
    );
  }
}
