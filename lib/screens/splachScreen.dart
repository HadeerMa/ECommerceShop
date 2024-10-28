import 'package:ecommerce/screens/FirstSplach.dart';
import 'package:ecommerce/screens/layoutScreens.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/sharedpreferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    bool isFirstTime = cacheHelper.getCache(key: 'isFirstTime') != "false";
    String? token = cacheHelper.getCache(key: 'token');

    if (isFirstTime) {
      cacheHelper.insertCache(key: 'isFirstTime', value: "false");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Firstsplach()));
    } else if (token != null && token.isNotEmpty) {
      // إذا كان `token` موجود، توجه إلى الشاشة الرئيسية
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => layoutScreens()));
    } else {
      // إذا كان `token` فارغ أو غير موجود، توجه إلى صفحة تسجيل الدخول
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Color(0xffF83758),
            )
          ],
        ),
      ),
    );
  }
}
