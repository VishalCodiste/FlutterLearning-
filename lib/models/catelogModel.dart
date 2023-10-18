// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatelogModel {
  static List<Item> items = [];

  static Item? getById(String id) {
    return items.firstWhere((element) => element.id == id);
  }

  static Item getByPosition(int pos) => items[pos];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);

  Item copyWith({
    String? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? imageUrl,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as String,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}
