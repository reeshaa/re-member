import 'package:flutter/material.dart';
import 'package:re_member/src/modules/communities/communities_landing.dart';

class Communities extends StatefulWidget {
  const Communities({Key? key}) : super(key: key);

  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) =>
          MaterialPageRoute(builder: (context) => CommunitiesLanding()),
    );
  }
}
