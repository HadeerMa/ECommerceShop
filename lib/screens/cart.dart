import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Expanded(
                  child: cubit.CartsList.isEmpty
                      ? Center(
                          child: Textapp(
                              TextApp: 'Loading...',
                              weight: FontWeight.w600,
                              TextColor: Colors.black,
                              size: 20),
                        )
                      : ListView.builder(
                          itemCount: cubit.CartsList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xffF83758).withOpacity(0.2),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    cubit.CartsList[index].image!,
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
                                          TextApp: cubit.CartsList[index].name!,
                                          weight: FontWeight.w600,
                                          TextColor: Colors.black,
                                          size: 20,
                                          lines: 1,
                                        ),
                                        Row(
                                          children: [
                                            Textapp(
                                              TextApp:
                                                  "${cubit.CartsList[index].price!}\$",
                                              weight: FontWeight.w600,
                                              TextColor: Colors.black,
                                              size: 20,
                                              lines: 1,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            if (cubit.CartsList[index].price !=
                                                cubit.CartsList[index].oldprice)
                                              Textapp(
                                                TextApp:
                                                    "${cubit.CartsList[index].oldprice!}\$",
                                                weight: FontWeight.w600,
                                                TextColor: Colors.black,
                                                size: 20,
                                                lines: 1,
                                              ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {
                                                  cubit.removeOraddFavorite(
                                                    productID: cubit
                                                        .CartsList[index].id
                                                        .toString(),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: cubit
                                                          .productIDFavorites
                                                          .contains(cubit
                                                              .CartsList[index]
                                                              .id
                                                              .toString())
                                                      ? Colors.red
                                                      : Colors.grey,
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                cubit.removeOraddCarts(
                                                    ID: cubit
                                                        .CartsList[index].id
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
              Container(
                child: Textapp(
                    TextApp: 'Total Price : ${cubit.totalPrice} \$',
                    weight: FontWeight.w700,
                    TextColor: Colors.black,
                    size: 20),
              )
            ],
          ),
        ));
      },
    );
  }
}
