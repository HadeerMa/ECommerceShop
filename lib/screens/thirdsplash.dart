import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:flutter/material.dart';

class Thirdsplash extends StatelessWidget {
  const Thirdsplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset('images/thirdsplash.png'),
                  Textapp(
                      TextApp: 'Choose Your Carts',
                      weight: FontWeight.w800,
                      TextColor: Colors.black,
                      size: 24),

                  // Padding(
                  //   padding: const EdgeInsets.all(40),
                  //   child: Textapp(
                  //       TextApp:
                  //           'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                  //       weight: FontWeight.w600,
                  //       TextColor: Color(0xffA8A8A9),
                  //       size: 14,
                  //       align: TextAlign.center,
                  //     ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset('images/circle3.png')),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Textapp(
                          TextApp: 'Get Started',
                          weight: FontWeight.w600,
                          TextColor: Color(0xffF83758),
                          size: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
