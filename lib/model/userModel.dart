class UserModel {
  UserModel({
    this.name,
    this.email,
    this.number,
    this.image,
    this.isLoggedIn,
  });

  String? name;
  String? email;
  String? number;
  String? image;
  bool? isLoggedIn;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        image: json["image"],
        isLoggedIn: json["isLoggedIn"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "image": image,
        "isLoggedIn": isLoggedIn,
      };
}
