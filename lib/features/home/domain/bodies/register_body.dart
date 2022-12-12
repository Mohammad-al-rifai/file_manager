class RegisterBody {
  String? fullName;
  String? userName;
  String? email;
  String? password;
  bool? isAdmin;

  RegisterBody(
      {this.fullName, this.userName, this.email, this.password, this.isAdmin});

  RegisterBody.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['isAdmin'] = isAdmin;
    return data;
  }
}
