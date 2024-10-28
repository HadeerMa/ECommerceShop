class Productmodel {
  int? id;
  String? name;
  String? description;

  int? price;
  int? oldprice;
  int? dicount;
  String? image;
  Productmodel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.oldprice,
      required this.dicount,
      required this.image});
  Productmodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    name = data['name'].toString();
    description = data['description'].toString();
    price = data['price'].toInt();
    oldprice = data['old_price'].toInt();
    dicount = data['discount'].toInt();
    image = data['image'].toString();
  }
}
