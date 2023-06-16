import 'package:fake_store_app/model/product_model.dart';
import 'package:fake_store_app/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  bool isLoading = false;

  bool isLike = false;

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

  void changeLikeColor() {
    if (isLike == false) {
      isLike = true;
      notifyListeners();
    } else {
      isLike = false;
      notifyListeners();
    }
  }

  void highToLowFilterList() {
    productList.sort((first, second) => second.price.compareTo(first.price));
    notifyListeners();
  }

  void lowToHighFilterList() {
    productList.sort((first, second) => first.price.compareTo(second.price));
    notifyListeners();
  }

  void consumerRatingFilterList() {
    productList.sort(
        (first, second) => second.rating.rate.compareTo(first.rating.rate));
    notifyListeners();
  }
}
