class AllUsersModel {
  List<User>? users;

  AllUsersModel({this.users});

  AllUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      users = <User>[];
      json['data'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (users != null) {
      data['data'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['userName'] = userName;
    return data;
  }
}
