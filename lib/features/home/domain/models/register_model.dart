class RegisterModel {
  Data? data;

  RegisterModel({this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? fullName;
  String? userName;
  String? email;
  bool? isAdmin;
  String? token;

  Data(
      {this.userId,
      this.fullName,
      this.userName,
      this.email,
      this.isAdmin,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
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
