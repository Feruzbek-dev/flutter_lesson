class CartResponse {
  final List<CartModel> carts;
  final int total;

  CartResponse({required this.carts, required this.total});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(carts: (json['carts'] as List).map((e){
    return CartModel.fromJson(e);
  }).toList(), total: json['total']);
}

class CartModel {
  final int id;
  final List<ProductModel> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  CartModel({required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      CartModel(id: json['id'],
          products: (json['products'] as List).map((e) {
            return ProductModel.fromJson(e);
          }).toList(),
          total: json['total'],
          discountedTotal: json['discountedTotal'],
          userId: json['userId'],
          totalProducts: json['totalProducts'],
          totalQuantity: json['totalQuantity']);
}

class ProductModel {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final String thumbnail;

  ProductModel({required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(
          id: json['id'],
          title: json['title'],
          price: json['price'],
          quantity: json['quantity'],
          total: json['total'],
          discountPercentage: json['discountPercentage'],
          thumbnail: json['thumbnail']);
}
