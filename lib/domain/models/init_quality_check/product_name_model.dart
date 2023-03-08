class ProductNameModel {
  String? status;
  List<Category>? data;
  String? message;
  int? count;
  Null? next;
  Null? previous;

  ProductNameModel(
      {this.status,
      this.data,
      this.message,
      this.count,
      this.next,
      this.previous});

  ProductNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Category>[];
      json['data'].forEach((v) {
        data!.add(new Category.fromJson(v));
      });
    }
    message = json['message'];
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? image;
  String? dateCreated;

  Category(
      {this.id, this.name, this.description, this.image, this.dateCreated});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
