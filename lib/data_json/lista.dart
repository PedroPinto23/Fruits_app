class ListaDeFrutas {
  final String name, image;
  final price;

  ListaDeFrutas({this.name, this.image, this.price});

  factory ListaDeFrutas.fromJson(Map<String, dynamic> json) {
    return ListaDeFrutas(
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'price': price,
      };
}
