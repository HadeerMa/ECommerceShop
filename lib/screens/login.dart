import 'package:ecommerce/cubits/cubit/login_cubit.dart';
import 'package:ecommerce/cubits/cubit/login_state.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/layoutScreens.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/widgets/buttons.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:ecommerce/widgets/textfieldapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool ispasswordvisible = true;
  GlobalKey<FormState> FormKey = GlobalKey();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, loginstate>(
        listener: (context, state) {
          if (state is loginstateSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => layoutScreens(),
              ),
            );
          } else if (state is loginstateError) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  state.message,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
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
                    key: FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Back!',
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
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TExtFieldApp(
                          iconField: Icon(Icons.lock),
                          lText: 'Password',
                          control: passwordController,
                          obsecure: ispasswordvisible,
                          Sicon: IconButton(
                            onPressed: () {
                              setState(() {
                                ispasswordvisible = !ispasswordvisible;
                              });
                            },
                            icon: ispasswordvisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          valid: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email Or Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //      Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => Homepage(),
                            //       ),
                            //     );
                            //   },
                            //   child: Textapp(
                            //     TextApp: 'Forgot Password?',
                            //     weight: FontWeight.w500,
                            //     TextColor: Color(0xffF83758),
                            //     size: 14,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 30),
                        ButtonsApp(
                          TextContainer: state is loginstateLoading
                              ? 'Loading....'
                              : 'Login',
                          ontap: () {
                            
                              if (FormKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).login(
                                  email: emailController!.text,
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
                              TextApp: 'Create An Account',
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
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                              child: Textapp(
                                TextApp: 'Sign Up',
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
