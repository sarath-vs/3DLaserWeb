class SaveQualtyProductModel {
  int? id;
  String? name;
  String? description;
  String? dateCreated;

  SaveQualtyProductModel(
      {this.id, this.name, this.description, this.dateCreated});

  SaveQualtyProductModel.fromJson(Map<String, dynamic> json) {
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
