import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:ecommerce/widgets/textfieldapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                Center(
                  child: TExtFieldApp(
                    iconField: Icon(Icons.search),
                    lText: 'Search',
                    Sicon: Icon(Icons.clear),
                    // control: searchController,
                    // change: (input) {
                    //   cubit.filterProducts(input: input!);
                    // },
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: cubit.favorites.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(8),
                            color: Color(0xffF83758).withOpacity(0.2),
                            child: Row(
                              children: [
                                Image.network(
                                  cubit.favorites[index].image!,
                                  width: 120,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Textapp(
                                        TextApp: cubit.favorites[index].name!,
                                        weight: FontWeight.w600,
                                        TextColor: Colors.black,
                                        size: 20,
                                        lines: 1,
                                      ),
                                      Textapp(
                                        TextApp:
                                            "${cubit.favorites[index].price!}\$",
                                        weight: FontWeight.w600,
                                        TextColor: Colors.black,
                                        size: 20,
                                        lines: 1,
                                      ),
                                          if(cubit.favorites[index].price != cubit.favorites[index].oldprice)
                                           Textapp(
                                        TextApp:
                                            "${cubit.favorites[index].oldprice!}\$",
                                        weight: FontWeight.w600,
                                        TextColor: Colors.black,
                                        size: 20,
                                        lines: 1,
                                      ),

                                      GestureDetector(
                                          onTap: () {
                                            cubit.removeOraddFavorite(
                                              productID: cubit
                                                  .favorites[index].id
                                                  .toString(),
                                            );
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        );
      },
    );
  }
}
