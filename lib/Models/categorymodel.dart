class Categorymodel {
  int? id;
  String? name;
  String? image;

  Categorymodel({required this.id, required this.name, required this.image});
  Categorymodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
