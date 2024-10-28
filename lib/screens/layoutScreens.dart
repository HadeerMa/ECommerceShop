import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class layoutScreens extends StatefulWidget {
  const layoutScreens({super.key});

  @override
  State<layoutScreens> createState() => _HomepageState();
}

class _HomepageState extends State<layoutScreens> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 5,
                ),
                Textapp(
                    TextApp: 'Shop',
                    weight: FontWeight.w600,
                    TextColor: Color(0xffF83758),
                    size: 22),
              ],
            ),
            centerTitle: true,
          ),
          body: cubit.HomeScreens[cubit.bottomIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.bottomIndex,
              selectedItemColor: Color(0xffF83758),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeindex(index: index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.category),
                //   label: 'Categories',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
        );
      },
    );
  }
}
