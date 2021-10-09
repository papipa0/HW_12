class Food {
  final int id;
  final String name;
  final int price;
  final String image;

  Food({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  String toString() {
    return '$name ราคา $price บาท';
  }
}