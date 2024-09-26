class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String image;
  final String? token;

  UserModel(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.image,
       this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      name: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      token: json['token'],);
}
