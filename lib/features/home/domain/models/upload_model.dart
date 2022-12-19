class UploadModel {
  bool? status;
  String? message;
  Data? data;

  UploadModel({this.status, this.message, this.data});

  UploadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? fileId;
  String? fileName;
  int? ownerId;
  String? groupId;
  Null? reserverId;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.fileId,
      this.fileName,
      this.ownerId,
      this.groupId,
      this.reserverId,
      this.updatedAt,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    fileId = json['file_id'];
    fileName = json['fileName'];
    ownerId = json['ownerId'];
    groupId = json['groupId'];
    reserverId = json['reserverId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_id'] = fileId;
    data['fileName'] = fileName;
    data['ownerId'] = ownerId;
    data['groupId'] = groupId;
    data['reserverId'] = reserverId;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
