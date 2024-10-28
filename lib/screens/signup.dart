import 'package:ecommerce/cubits/cubit/signup_cubit.dart';
import 'package:ecommerce/cubits/cubit/signup_state.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/layoutScreens.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:ecommerce/widgets/textfieldapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool ispasswordvisiple = true;
  bool isconfirmpasswordvisiple = true;
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  TextEditingController? phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => layoutScreens(),
              ),
            );
          } else if (state is SignupError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.message,style: TextStyle(  fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 30,),),
                backgroundColor: Color(0xffF83758),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Create an',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'account',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TExtFieldApp(
                          iconField: Icon(Icons.person),
                          lText: 'Email',
                          control: emailController,
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        TExtFieldApp(
                          iconField: Icon(Icons.person),
                          lText: 'Username',
                          control: nameController,
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Name';
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        TExtFieldApp(
                          iconField: Icon(Icons.person),
                          lText: 'Phone',
                          control: phoneController,
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your phone';
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        TExtFieldApp(
                          control: passwordController,
                          iconField: Icon(Icons.lock),
                          lText: 'Password',
                          obsecure: ispasswordvisiple,
                          Sicon: IconButton(
                            onPressed: () {
                              setState(() {
                                ispasswordvisiple = !ispasswordvisiple;
                              });
                            },
                            icon: Icon(ispasswordvisiple
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textapp(
                              TextApp: 'By clicking the ',
                              weight: FontWeight.w500,
                              TextColor: Color(0xff676767),
                              size: 14,
                            ),
                            Textapp(
                              TextApp: 'Register',
                              weight: FontWeight.w500,
                              TextColor: Color(0xffF83758),
                              size: 14,
                            ),
                            Textapp(
                              TextApp: ' button, you agree ',
                              weight: FontWeight.w500,
                              TextColor: Color(0xff676767),
                              size: 14,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textapp(
                              TextApp: 'to the public offer',
                              weight: FontWeight.w500,
                              TextColor: Color(0xff676767),
                              size: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ButtonsApp(
                          TextContainer: state is SignupLoading
                              ? 'Loading.....'
                              : 'Create Account',
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignupCubit>(context).signup(
                                email: emailController!.text,
                                name: nameController!.text,
                                phone: phoneController!.text,
                                password: passwordController!.text,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Textapp(
                              TextApp: 'I Already Have an Account',
                              weight: FontWeight.w500,
                              TextColor: Color(0xff575757),
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: Textapp(
                                TextApp: 'Login',
                                weight: FontWeight.w500,
                                TextColor: Color(0xffF83758),
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
