class UserModel {
  int? userId;
  String? userName;
  String? email;
  String? password;
  int? userType;

  UserModel({
    this.userId,
    this.userName,
    this.email,
    this.password,
    this.userType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: int.tryParse(json['user_id'].toString()),
        userName: json['user_name']?.toString(),
        email: json['email']?.toString(),
        password: json['password']?.toString(),
        userType: int.tryParse(json['user_type'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (userId != null) 'user_id': userId,
        if (userName != null) 'user_name': userName,
        if (email != null) 'email': email,
        if (password != null) 'password': password,
        if (userType != null) 'user_type': userType,
      };
}
