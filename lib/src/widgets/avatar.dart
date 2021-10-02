import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[50],
      child: SvgPicture.network('https://dash-overflow.net/images/logo.svg'),
      radius: size.width * 0.12,
    );
  }
}
