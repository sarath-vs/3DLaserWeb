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

  QualityProductResult(
      {this.id, this.name, this.description, this.dateCreated});

  QualityProductResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
