import 'package:flutter/cupertino.dart';
import 'package:training/utils/dimensions.dart';
   

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  BigText({
    Key? key,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font20*1.1 : size,
        // fontFamily: 'Roboto',
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
