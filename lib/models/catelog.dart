class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item( {required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl} );
}

class CatalogModel {
  static final items = [
    Item(
      id: "001",
      name: "iPhone X",
      desc: "Best Phone",
      price: 799,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
    Item(
      id: "002",
      name: "iPhone XR",
      desc: "Best Phone",
      price: 799,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
    Item(
      id: "003",
      name: "iPhone 11 Pro",
      desc: "Best Phone",
      price: 899,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
    Item(
      id: "004",
      name: "iPhone 12 Pro",
      desc: "Best Phone",
      price: 999,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
    Item(
      id: "005",
      name: "iPhone 13 Pro",
      desc: "Best Phone",
      price: 1199,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
    Item(
      id: "006",
      name: "iPhone 14 Pro",
      desc: "Best Phone",
      price: 1299,
      color: "#FFFFFF",
      imageUrl: "https://photographylife.com/wp-content/uploads/2019/08/iPhone-X.jpg",
    ),
  ];
}