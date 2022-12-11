class AuthModel {
  String? status;
  String? message;
  User? user;

  AuthModel({this.status, this.message, this.user});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? fullName;
  String? userName;
  String? email;
  bool? isAdmin;
  String? token;

  User({
    this.userId,
    this.fullName,
    this.userName,
    this.email,
    this.isAdmin,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullName'] = fullName;
    data['userName'] = userName;
    data['email'] = email;
    data['isAdmin'] = isAdmin;
    data['token'] = token;
    return data;
  }
}
