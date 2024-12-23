import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_amit/features/home/data/models/product_model.dart';
import 'package:mvvm_amit/features/home/data/services/product.dart';
import 'package:mvvm_amit/features/home/presentation/manager/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductIntialize());
  List<ProductModel> products = [];
  getProduct() async {
    try {
      emit(ProductLoading());
      products = await ProductServices().getProduct();
      emit(ProductSucsess());
    } catch (e) {
      print(e);
      emit(ProductFailur());
    }
  }
}
