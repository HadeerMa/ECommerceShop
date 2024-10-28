import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/cubits/cubit/login_state.dart';
import 'package:ecommerce/sharedpreferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginCubit extends Cubit<loginstate> {
  LoginCubit() : super(loginstateInitial());
  void login({required String email, required String password}) async {
    emit(loginstateLoading());

    try {
      Response response = await http.post(
        Uri.parse("https://student.valuxapps.com/api/login"),
        headers: {
          "lang": "en",
        },
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == true) {
          //debugPrint('User Login Success and his data is $responseBody');
        await  cacheHelper.insertCache(
            key: "token",
            value: responseBody['data']['token'],
          );
          emit(
            loginstateSuccess(),
          );
        } else {
          debugPrint(
              'Faild User Login and response is ${responseBody['message']}');
          emit(
            loginstateError(message: responseBody['message']),
          );
        }
      }
    } catch (e) {
      emit(
        loginstateError(message: e.toString()),
      );
    }
  }
}
