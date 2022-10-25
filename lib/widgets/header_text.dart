import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;
  final double? marginTop;
  final double fontSize;
  final bool animate;
  const HeaderText({
    Key? key,
    required this.title,
    this.animate = true,
    this.marginTop = 5,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: marginTop!),
      width: size.width - 50,
      height: size.height * 0.03,
      child: FadeInRight(
        animate: animate,
        from: 20,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
