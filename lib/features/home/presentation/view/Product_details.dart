import 'package:flutter/material.dart';
import 'package:mvvm_amit/features/home/data/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static String id = "homeDetails";
  @override
  Widget build(BuildContext context) {
    var items = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network("${items.image}"),
              Text("${items.description}")
            ],
          ),
        ),
      ),
    );
  }
}
