import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    Key key,
    this.tText,
    this.tColor,
    this.tSize,
    this.tTitle = false,
    this.tCenter = false,
    this.tMaxLine = 10,

  }) : super(key: key);
  final String tText;
  final Color tColor;
  final double tSize;
  bool tTitle;
  bool tCenter ;
  int tMaxLine = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      tText,
      maxLines: tMaxLine,
      textAlign: tCenter ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: tSize,
        fontWeight: tTitle ? FontWeight.bold : FontWeight.normal,
        color: tColor,
      ),
    );
  }
}
