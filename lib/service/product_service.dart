import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_store_app/common/url.dart';
import 'package:fake_store_app/model/product_model.dart';

class ProductService {
  Dio dio = Dio();

  Url url = Url();

  Future<List<ProductModel>?> getProduct() async {
    try {
      Response response = await dio.get(url.baseUrl);
      log(response.statusCode.toString(), name: 'product status code');
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ProductModel> result = (response.data as List)
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        return result;
      }
    } on DioException catch (error) {
      log(error.message.toString(), name: 'product error');
    }
    return null;
  }
}
