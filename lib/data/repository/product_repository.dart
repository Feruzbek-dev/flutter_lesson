

import 'package:dio/dio.dart';

import '../models/product_response.dart';

class ProductRepository{
  final Dio dio = Dio();
  Future<ProductResponse?> getAllProducts()async{
try{
  final Response response = await dio.get('https://dummyjson.com/products');
  return ProductResponse.fromJson(response.data);
} catch (e, stackTrace){
  print(e);
  print(stackTrace);
}
return null;



  }
}