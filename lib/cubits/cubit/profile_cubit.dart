import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Models/bannermodel.dart';
import 'package:ecommerce/Models/categorymodel.dart';
import 'package:ecommerce/Models/prodectmodel.dart';
import 'package:ecommerce/Models/usermodel.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/screens/cart.dart';
import 'package:ecommerce/screens/categories.dart';
import 'package:ecommerce/screens/favotite.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/sharedpreferences/constance.dart';
import 'package:ecommerce/sharedpreferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(profileInitialestate());

  Future<void> loadToken() async {
    token = cacheHelper.getCache(key: "token");
  }

  int bottomIndex = 0;
  List<Widget> HomeScreens = [
    Homepage(),
   // Categoriespage(),
    Favorite(),
    Cart(),
    Profile(),
  ];
  void changeindex({required int index}) {
    bottomIndex = index;
    emit(
      bottomnavindexState(),
    );
  }

  UserModel? userModel;

  void profile() async {
    emit(profileLoadingstate());

    try {
      Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/profile'),
        headers: {
          'lang': 'en',
          "Authorization": token!,
        },
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == true) {
          userModel = UserModel.fromjson(
            data: responseBody['data'],
          );
          emit(profileSuccessstate());
        } else {
          emit(profileErrorstate(message: responseBody['message']));
        }
      }
    } catch (e) {
      emit(
        profileErrorstate(message: e.toString()),
      );
    }
  }

  List<Bannermodel> banners = [];
  void Banners() async {
    emit(BannerLoadingstate());

    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']) {
          banners.add(
            Bannermodel.fromjson(data: item),
          );
        }

        emit(BannerSuccessstate());
      } else {
        emit(BannerErrorstate());
      }
    }
  }

  List<Categorymodel> categories = [];

  void category() async {
    emit(CategoryLoadingstate());

    categories.clear();
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/categories'),
        headers: {'lang': 'en'});
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']['data']) {
          categories.add(
            Categorymodel.fromjson(data: item),
          );
        }

        emit(CategorySuccessstate());
      } else {
        emit(CategoryErrorstate());
      }
    }
  }

  List<Productmodel> Products = [];

  void Product() async {
    emit(ProductLoadingstate());

    Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/home'), headers: {
      'lang': 'en',
      'Authorization': token!,
    });
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']['products']) {
          Products.add(
            Productmodel.fromjson(data: item),
          );
        }

        emit(ProductSuccessstate());
      } else {
        emit(ProductErrorstate());
      }
    }
  }

  List<Productmodel> filteredProducts = [];
  void filterProducts({required String input}) {
    filteredProducts = Products.where((element) =>
        element.name!.toLowerCase().startsWith(input.toLowerCase())).toList();
    emit(FilterProductSuccessstate());
  }

  List<Productmodel> favorites = [];
  Set<String> productIDFavorites = {};

  Future<void> getFavorites() async {
    favorites.clear();
    emit(
      FavoriteLoadingstate(),
    );
    Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          "lang": 'en',
          'Authorization': token!,
        });
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']['data']) {
          favorites.add(
            Productmodel.fromjson(data: item["product"]),
          );
          productIDFavorites.add(item['product']['id'].toString());
        }
        emit(
          FavoriteSuccessstate(),
        );
      } else
        (emit(
          FavoriteErrorstate(),
        ));
    }
  }

  void removeOraddFavorite({required String productID}) async {
    emit(
      addFavoriteLoadingstate(),
    );
    Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          "lang": 'en',
          'Authorization': token!,
        },
        body: {
          'product_id': productID,
        });
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      if (productIDFavorites.contains(productID) == true) {
        productIDFavorites.remove(productID);
      } else {
        productIDFavorites.add(productID);
      }
      await getFavorites();
      emit(
        addFavoriteSuccessstate(),
      );
    } else
      (emit(
        addFavoriteErrorstate(),
      ));
  }

  List<Productmodel> CartsList = [];
  Set<String> productIDCarts = {};

  int totalPrice = 0;
  Future<void> Carts() async {
    CartsList.clear();
    emit(CartsLoadingstate());

    Response response = await http
        .get(Uri.parse('https://student.valuxapps.com/api/carts'), headers: {
      'lang': 'en',
      'Authorization': token!,
    });
    final responseBody = jsonDecode(response.body);
    totalPrice = responseBody['data']['total'].toInt();
    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']['cart_items']) {
          productIDCarts.add(item['product']['id'].toString());
          CartsList.add(
            Productmodel.fromjson(data: item['product']),
          );
        }

        emit(CartsSuccessstate());
      } else {
        emit(CartsErrorstate());
      }
    }
  }

  void removeOraddCarts({required String ID}) async {
    emit(
      addCartsLoadingstate(),
    );
    Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/carts'), headers: {
      "lang": 'en',
      'Authorization': token!,
    }, body: {
      'product_id': ID,
    });
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      if (productIDCarts.contains(ID) == true) {
        productIDCarts.remove(ID);
      } else {
        productIDCarts.add(ID);
      }
      await Carts();
      emit(
        addCartsSuccessstate(),
      );
    } else
      (emit(
        addCartsErrorstate(),
      ));
  }





    void logout() async {
    emit(LogoutLoading());

    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/logout'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
    );

    if (response.statusCode == 200) {
      await cacheHelper.deleteCache(Key: 'token');
      token = null;
      emit(LoggedOutSuccess());
    } else {
      emit(LogoutFailure());
    }
  }
}
