import 'package:fake_store_app/model/product_model.dart';
import 'package:fake_store_app/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  bool isLoading = false;

  ProductController() {
    getProduct();
  }

  List<ProductModel> productList = [];

  ProductService productService = ProductService();

  void getProduct() async {
    isLoading = true;
    notifyListeners();
    await productService.getProduct().then((value) {
      if (value != null) {
        productList = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
