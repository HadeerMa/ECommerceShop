class UserModel {
  String? email;
  String? name;
  String? phone;
  String? token;
  String? image;
  UserModel(this.email, this.name, this.phone, this.token, this.image);
  UserModel.fromjson({required Map<String, dynamic> data}) {
    email = data['email'];
    name = data['name'];
    phone = data['phone'];
    token = data['token'];
    image = data['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'token': token,
      'image': image,
    };
  }
}
