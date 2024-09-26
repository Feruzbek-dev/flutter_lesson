import 'package:exercise/data/models/product_response.dart';
import 'package:exercise/data/repository/product_repository.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductRepository _repository = ProductRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _repository.getAllProducts(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasData){
            final List<ProductModel> products = snapshot.data?.products ?? [];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text('${index + 1}'),
                      SizedBox(width: 20,),
                      Text(products[index].title ?? "title"),
                    ],
                  );
                });
          }
          return Text(snapshot.data.toString());

        }
      ),
    );
  }
}
