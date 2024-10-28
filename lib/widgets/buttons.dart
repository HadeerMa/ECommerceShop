import 'package:ecommerce/widgets/textApp.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonsApp extends StatelessWidget {
  ButtonsApp({super.key, required this.TextContainer,required this.ontap});
  String TextContainer;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          color:const Color(0xffF83758),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Textapp(
                TextApp: TextContainer,
                weight: FontWeight.w600,
                TextColor: Colors.white,
                size: 20)),
      ),
    );
  }
}
