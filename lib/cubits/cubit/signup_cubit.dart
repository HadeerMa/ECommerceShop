import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/cubits/cubit/signup_state.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signup(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    emit(SignupLoading());
    try {
      Response response = await http.post(
          Uri.parse("https://student.valuxapps.com/api/register"),
          headers: {
            'lang': "en"
          },
          body: {
            'email': email,
            'name': name,
            'phone': phone,
            'password': password,
          });
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == true) {
          emit(SignupSuccess());
        } else {
          emit(SignupError(message: responseBody['message']));
        }
      }
    } catch (e) {
      emit(
        SignupError(message: e.toString()),
      );
    }
  }
}
