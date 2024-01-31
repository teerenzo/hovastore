class Product {
  String? id;
  String? name;
  double? price;
  double? discount;
  double? quantity;

  Product({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse('${json['price']}'),
      discount:
          json['discount'] != null ? double.parse('${json['discount']}') : 0,
      quantity:
          json['quantity'] != null ? double.parse('${json['quantity']}') : 0,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'price': price,
        'discount': discount,
        'quantity': quantity,
      };
}
