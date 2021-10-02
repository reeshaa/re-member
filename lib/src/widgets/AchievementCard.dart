import 'package:flutter/material.dart';
import 'package:re_member/src/utils/constants.dart';

class AchievementCard extends StatelessWidget {
  const AchievementCard({
    required this.heading,
    required this.image,
    required this.subheading,
    required this.size,
  });

  final Size size;
  final Image image;
  final String heading;
  final String subheading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: size.width * 0.4,
      height: size.width * 0.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 0.8),
          borderRadius: borderRadiusLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(
                  "$heading",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                "$subheading",
                style: TextStyle(fontStyle: FontStyle.italic),
              )
            ],
          )
        ],
      ),
    );
  }
}
