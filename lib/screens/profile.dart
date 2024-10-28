import 'package:ecommerce/Models/usermodel.dart';
import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoggedOutSuccess) {
          // Navigate to Login page when logged out successfully
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      },
      builder: (context, state) {
        final UserModel model = cubit.userModel!;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        //color: Color(0xffF83758),
                        border: Border.all(
                          color: Color(0xffF83758),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Textapp(
                          TextApp: model.name!,
                          weight: FontWeight.bold,
                          TextColor: Colors.black,
                          size: 18),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        //color: Color(0xffF83758),
                        border: Border.all(
                          color: Color(0xffF83758),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Textapp(
                          TextApp: model.email!,
                          weight: FontWeight.bold,
                          TextColor: Colors.black,
                          size: 18),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        //color: Color(0xffF83758),
                        border: Border.all(
                          color: Color(0xffF83758),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Textapp(
                          TextApp: model.phone!,
                          weight: FontWeight.bold,
                          TextColor: Colors.black,
                          size: 18),
                    )),
                SizedBox(
                  height: 10,
                ),
                ButtonsApp(
                  TextContainer: 'Logout',
                  ontap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Confirm Logout'),
                        content: Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Textapp(
                                TextApp: 'No',
                                weight: FontWeight.w400,
                                TextColor: Color(0xffF83758),
                                size: 13),
                          ),
                          TextButton(
                              onPressed: () {
                                // Call logout method from LogoutCubit
                                context.read<ProfileCubit>().logout();
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Textapp(
                                  TextApp: 'Yes',
                                  weight: FontWeight.w400,
                                  TextColor: Color(0xffF83758),
                                  size: 13)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
