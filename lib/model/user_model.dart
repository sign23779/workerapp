class UserModel {
  final String? username;
  final String? docname;
  final String email;
  final String password;
  final String? image;
  final String? address;
  final String? phonenumber;

  final String? datetime;

  UserModel(
      {this.username,
      required this.email,
      required this.password,
      this.phonenumber,
      this.datetime,
      this.image,
      this.address,
      this.docname});
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'address': address,
        'docname': username,
        'phonenumber': phonenumber,
        'datetime': datetime,
        'image': image
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      docname: json['docname'],
      phonenumber: json['phonenumber'],
      datetime: json['datetime'],
      image: json['image']);
}
