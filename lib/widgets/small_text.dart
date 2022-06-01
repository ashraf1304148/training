import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  double height;
  SmallText({
    Key? key,
    this.size = 12,
    required this.text,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          color: color,
          height: height,
          overflow: TextOverflow.ellipsis),
    );
  }
}
