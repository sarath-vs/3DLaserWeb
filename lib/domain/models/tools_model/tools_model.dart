class ToolsModel {
  int? count;
  Null? next;
  Null? previous;
  List<ToolsResult>? results;

  ToolsModel({this.count, this.next, this.previous, this.results});

  ToolsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ToolsResult>[];
      json['results'].forEach((v) {
        results!.add(new ToolsResult.fromJson(v));
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

class ToolsResult {
  int? id;
  String? name;
  String? image;
  String? description;
  String? dateCreated;

  ToolsResult(
      {this.id, this.name, this.image, this.description, this.dateCreated});

  ToolsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
