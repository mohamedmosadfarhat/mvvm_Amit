import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_amit/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:mvvm_amit/features/home/presentation/view/Product_details.dart';
import 'package:mvvm_amit/features/home/presentation/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(),
      child: MaterialApp(
        home: HomePage(),
        routes: {
         ProductDetails.id:(context)=>ProductDetails()
        },
      ),
    );
  }
}
