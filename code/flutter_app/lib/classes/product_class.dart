class ProductClass{
  const ProductClass({
    required this.productId,
    required this.productName,
    required this.pictureURI,
    required this.stock,
    required this.price,
});
  final int productId;
  final String productName;
  final String pictureURI;
  final int stock;
  final double price;

  factory ProductClass.fromJson(Map<String, dynamic> json){
    return ProductClass(
        productId: json['productId'],
        productName: json['productName'],
        pictureURI: json['pictureURI'],
        stock: json['stock'],
        price:json['price']
    );
  }
}