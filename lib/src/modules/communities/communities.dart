import 'package:flutter/material.dart';

class Communities extends StatefulWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
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
            Row(
              children: [
                Text("Hello Reesha!"),
                Text("Welcome back"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
