import 'package:ecommerce/Models/prodectmodel.dart';
import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
import 'package:ecommerce/cubits/cubit/profile_state.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/widgets/textApp.dart';
import 'package:ecommerce/widgets/textfieldapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final pageController = PageController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              TExtFieldApp(
                iconField: Icon(Icons.search),
                lText: 'Search',
                Sicon: Icon(Icons.clear),
                control: searchController,
                change: (input) {
                  cubit.filterProducts(input: input!);
                },
              ),
              SizedBox(
                height: 10,
              ),
              cubit.banners.isEmpty
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SizedBox(
                      height: 125,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: pageController,
                        // when scroll from left bounded
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (contex, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Image.network(
                              cubit.banners[index].image!,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: 25.0,
                    dotWidth: 16.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xffF83758),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textapp(
                      TextApp: 'Categories',
                      weight: FontWeight.w600,
                      TextColor: Colors.black,
                      size: 16),
                  // Textapp(
                  //     TextApp: 'View All',
                  //     weight: FontWeight.w500,
                  //     TextColor: Color(0xffF83758),
                  //     size: 12),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              cubit.categories.isEmpty
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                        // when scroll from left bounded
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (contex, index) {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              cubit.categories[index].image!,
                            ),
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textapp(
                      TextApp: 'Products',
                      weight: FontWeight.w600,
                      TextColor: Colors.black,
                      size: 16),
                  // Textapp(
                  //     TextApp: 'View All',
                  //     weight: FontWeight.w500,
                  //     TextColor: Color(0xffF83758),
                  //     size: 12),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              cubit.Products.isEmpty
                  ? Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : GridView.builder(
                      itemCount: cubit.filteredProducts.isEmpty
                          ? cubit.Products.length
                          : cubit.filteredProducts.length,
                      shrinkWrap: true,
                      // scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        return productItem(
                          model: cubit.filteredProducts.isEmpty
                              ? cubit.Products[index]
                              : cubit.filteredProducts[index],
                          cubit: cubit,
                        );
                      })
            ],
          ),
        ));
      },
    );
  }
}

Widget productItem({required Productmodel model, required ProfileCubit cubit}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Container(
        color: Color(0xffF83758).withOpacity(0.2),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Image.network(
              model.image!,
              fit: BoxFit.contain,
            )),
            SizedBox(
              height: 10,
            ),
            Textapp(
              TextApp: model.name!,
              weight: FontWeight.w600,
              TextColor: Colors.black,
              size: 20,
              lines: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textapp(
                          TextApp: "${model.price!}\$",
                          weight: FontWeight.w600,
                          TextColor: Colors.black,
                          size: 14),
                      if (model.price != model.oldprice)
                        Textapp(
                          TextApp: "${model.oldprice!}\$",
                          weight: FontWeight.w600,
                          TextColor: Colors.black,
                          size: 14,
                          decore: TextDecoration.lineThrough,
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color:
                        cubit.productIDFavorites.contains(model.id.toString())
                            ? Colors.red
                            : Colors.grey,
                  ),
                  onTap: () {
                    cubit.removeOraddFavorite(
                      productID: model.id.toString(),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
      CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.3),
        child: GestureDetector(
          onTap: () {
            cubit.removeOraddCarts(ID: model.id.toString());
          },
          child: Icon(
            Icons.shopping_cart,
            color: cubit.productIDCarts.contains(model.id.toString())
                ? Colors.red
                : Colors.white,
          ),
        ),
      )
    ],
  );
}
