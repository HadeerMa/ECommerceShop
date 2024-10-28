// import 'package:ecommerce/Models/categorymodel.dart';
// import 'package:ecommerce/cubits/cubit/profile_cubit.dart';
// import 'package:ecommerce/cubits/cubit/profile_state.dart';
// import 'package:ecommerce/widgets/textApp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Categoriespage extends StatelessWidget {
//   const Categoriespage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List<Categorymodel> categotiesData =
//     //     BlocProvider.of<ProfileCubit>(context).categories;
//     final cubit = BlocProvider.of<ProfileCubit>(context);

//     return BlocConsumer<ProfileCubit, ProfileState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//             body: Padding(
//           padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//           child: GridView.builder(
//               itemCount: cubit.categories.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisExtent: 150,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(
//                   child: Column(
//                     children: [
//                       Expanded(
//                           child: Image.network(
//                         cubit.categories[index].image!,
//                         fit: BoxFit.fill,
//                       )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Textapp(
//                         TextApp: cubit.categories[index].name!,
//                         weight: FontWeight.w500,
//                         TextColor: Colors.black,
//                         size: 14,
//                       )
//                     ],
//                   ),
//                 );
//               }),
//         ));
//       },
//     );
//   }
// }
