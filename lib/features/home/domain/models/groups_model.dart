class GroupsModel {
  List<Group>? groups;

  GroupsModel({this.groups});

  GroupsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      groups = <Group>[];
      json['data'].forEach((v) {
        groups!.add(Group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groups != null) {
      data['data'] = groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Group {
  int? grpId;
  String? grpName;

  Group({this.grpId, this.grpName});

  Group.fromJson(Map<String, dynamic> json) {
    grpId = json['grp_id'];
    grpName = json['grpName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grp_id'] = grpId;
    data['grpName'] = grpName;
    return data;
  }
}
