class AnsweredProductListModel {
  String? status;
  List<AnsweredListResult>? data;
  String? message;

  AnsweredProductListModel({this.status, this.data, this.message});

  AnsweredProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AnsweredListResult>[];
      json['data'].forEach((v) {
        data!.add(new AnsweredListResult.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AnsweredListResult {
  int? id;
  String? slNo;
  String? dateCreated;
  int? category;
  int? user;

  AnsweredListResult({this.id, this.slNo, this.dateCreated, this.category, this.user});

  AnsweredListResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slNo = json['sl_no'];
    dateCreated = json['date_created'];
    category = json['category'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sl_no'] = this.slNo;
    data['date_created'] = this.dateCreated;
    data['category'] = this.category;
    data['user'] = this.user;
    return data;
  }
}
