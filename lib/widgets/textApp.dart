import 'package:flutter/material.dart';

class Textapp extends StatelessWidget {
  Textapp(
      {super.key,
      required this.TextApp,
      required this.weight,
      required this.TextColor,
      required this.size,
      this.lines,
      this.align,this.decore});
  String TextApp;
  FontWeight weight;
  Color TextColor;
  double size;
  int? lines;
  TextAlign? align;
  TextDecoration? decore;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        TextApp,
        maxLines: lines,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: weight,
          color: TextColor,
          fontSize: size,
          decoration: decore,
        ),
        textAlign: align,
      ),
    );
  }
}
