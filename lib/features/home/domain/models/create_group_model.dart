class CreateGroupModel {
  GroupData? data;

  CreateGroupModel({this.data});

  CreateGroupModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? GroupData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GroupData {
  int? grpId;
  String? grpName;
  String? updatedAt;
  String? createdAt;

  GroupData({this.grpId, this.grpName, this.updatedAt, this.createdAt});

  GroupData.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    grpName = json['grpName'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grp_id'] = grpId;
    data['grpName'] = grpName;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
