import 'package:dio/dio.dart';
import 'package:mvvm_amit/features/home/data/models/product_model.dart';

class ProductServices {
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> products = [];
    String url = "https://fakestoreapi.com/products";
    Dio dio = Dio();
    var response = await dio.get(url);
    var data = response.data;
    data.forEach((item) {
      var product = ProductModel.fromJason(item);
      products.add(product);
    });
    return products;
  }
}
