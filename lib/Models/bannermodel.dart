class Bannermodel {
  int? id;
  String? image;
  
  Bannermodel(
      {required this.id,
      required this.image,
      });
  Bannermodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
        image = data['image'];
  

  }
}
