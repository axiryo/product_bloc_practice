import 'dart:convert';

class ProductListItem {
  final int id;
  final String title;
  final int price;
  final String thumbnail;
  final int stock;
  final double discountPercentage;

  const ProductListItem({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
  });

  ProductListItem copyWith({
    int? id,
    String? title,
    int? price,
    String? thumbnail,
    int? stock,
    double? discountPercentage,
  }) {
    return ProductListItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      thumbnail: thumbnail ?? this.thumbnail,
      stock: stock ?? this.stock,
      discountPercentage: discountPercentage ?? this.discountPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'thumbnail': thumbnail,
      'stock': stock,
      'discountPercentage': discountPercentage,
    };
  }

  factory ProductListItem.fromMap(Map<String, dynamic> map) {
    return ProductListItem(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as int,
      thumbnail: map['thumbnail'] as String,
      stock: map['stock'] as int,
      discountPercentage: map['discountPercentage'] is int
          ? (map['discountPercentage'] as int).toDouble()
          : map['discountPercentage'] as double,
    );
  }

  factory ProductListItem.empty() {
    return ProductListItem(
      id: 0,
      title: '',
      price: 0,
      thumbnail: '',
      stock: 0,
      discountPercentage: 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductListItem.fromJson(String source) =>
      ProductListItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, thumbnail: $thumbnail, stock: $stock, discountPercentage: $discountPercentage)';
  }

  @override
  bool operator ==(covariant ProductListItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.thumbnail == thumbnail &&
        other.stock == stock &&
        other.discountPercentage == discountPercentage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        thumbnail.hashCode ^
        stock.hashCode ^
        discountPercentage.hashCode;
  }
}
