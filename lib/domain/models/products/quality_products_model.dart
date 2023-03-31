class QualtyProductListModel {
  int? count;
  Null? next;
  Null? previous;
  List<QualityProductResult>? results;

  QualtyProductListModel({this.count, this.next, this.previous, this.results});

  QualtyProductListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <QualityProductResult>[];
      json['results'].forEach((v) {
        results!.add(new QualityProductResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QualityProductResult {
  int? id;
  String? name;
  String? description;
  String? dateCreated;
  String? time_limit;
  String? ipAddress;
  String? port;
  ProductObj? productObj;

  QualityProductResult(
      {this.id, this.name, this.description, this.dateCreated,   this.ipAddress,
      this.port,
      this.productObj,});

  QualityProductResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    ipAddress = json['ip_address'];
    port = json['port'];
    productObj = json['product_obj'] != null
        ? new ProductObj.fromJson(json['product_obj'])
        : null;
    dateCreated = json['date_created'];
    time_limit =json['time_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
      data['ip_address'] = this.ipAddress;
    data['port'] = this.port;
    if (this.productObj != null) {
      data['product_obj'] = this.productObj!.toJson();
    }
    data['date_created'] = this.dateCreated;
    data['time_limit'] = this.time_limit;
    return data;
  }

  
}


class ProductObj {
  String? zebraData;

  ProductObj({this.zebraData});

  ProductObj.fromJson(Map<String, dynamic> json) {
    zebraData = json['zebraData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zebraData'] = this.zebraData;
    return data;
  }}