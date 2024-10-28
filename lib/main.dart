import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/screens/FirstSplach.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/layoutScreens.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/screens/splachScreen.dart';
import 'package:ecommerce/sharedpreferences/constance.dart';
import 'package:ecommerce/sharedpreferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //not run app untill run the cachehelper line
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.cacheIntialization();
 token= cacheHelper.getCache(key: 'token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          
          create: (context) => ProfileCubit()..Banners()..category()..Product()..getFavorites()..Carts()..profile(),
          
        ),
       
      ],
      
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplachScreen(),
          '/loginPage': (context) => Login(), 
          '/homePage': (context) => Homepage(),
          '/layoutScreens': (context) => layoutScreens(),
          '/firstSplash': (context) => Firstsplach(),
        },
      ),
    );
  }
}
