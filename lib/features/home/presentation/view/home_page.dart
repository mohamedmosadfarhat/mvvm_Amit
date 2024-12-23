import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_amit/core/static.dart';
import 'package:mvvm_amit/features/home/data/models/product_model.dart';
import 'package:mvvm_amit/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:mvvm_amit/features/home/presentation/manager/cubit/product_state.dart';
import 'package:mvvm_amit/features/home/presentation/view/Product_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ProductCubit>(context).products;
        return Scaffold(
          appBar: AppBar(
            title: Text("Buy Now"),
          ),
          body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: cubit.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProductDetails.id,
                      
                      arguments: ProductModel(
                        id:cubit[index].id,
                        image: cubit[index].image,
                        title: cubit[index].title,
                        description: cubit[index].description
                      )
                      );
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            height: 400,
                            width: double.infinity,
                            child: Image.network(
                              "${cubit[index].image}",
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.grey.withOpacity(.7),
                              child: Text(
                                "${cubit[index].title}".substring(0, 12),
                                style: styles().style18,
                              )),
                        )
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
