class MannualDetailModel {
  String? status;
  MannualDetail? data;
  String? message;

  MannualDetailModel({this.status, this.data, this.message});

  MannualDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        json['data'] != null ? new MannualDetail.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class MannualDetail {
  int? id;
  List<Steps>? steps;
  String? descriptionEnglish;
  String? descriptionCzech;
  String? descriptionGerman;
  String? video;
  String? dateCreated;
  int? subCategory;
  int? addedBy;

  MannualDetail(
      {this.id,
      this.steps = const [],
      this.descriptionEnglish,
      this.descriptionCzech,
      this.descriptionGerman,
      this.video,
      this.dateCreated,
      this.subCategory,
      this.addedBy});

  MannualDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
    descriptionEnglish = json['description_english'];
    descriptionCzech = json['description_czech'];
    descriptionGerman = json['description_german'];
    video = json['video'];
    dateCreated = json['date_created'];
    subCategory = json['sub_category'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    data['description_english'] = this.descriptionEnglish;
    data['description_czech'] = this.descriptionCzech;
    data['description_german'] = this.descriptionGerman;
    data['video'] = this.video;
    data['date_created'] = this.dateCreated;
    data['sub_category'] = this.subCategory;
    data['added_by'] = this.addedBy;
    return data;
  }
}

class Steps {
  int? id;
  String? descriptionEnglish;
  String? descriptionCzech;
  String? descriptionGerman;
  String? image;
  String? dateCreated;
  int? manual;
  int? addedBy;

  Steps(
      {this.id,
      this.descriptionEnglish,
      this.descriptionCzech,
      this.descriptionGerman,
      this.image,
      this.dateCreated,
      this.manual,
      this.addedBy});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionEnglish = json['description_english'];
    descriptionCzech = json['description_czech'];
    descriptionGerman = json['description_german'];
    image = json['image'];
    dateCreated = json['date_created'];
    manual = json['manual'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description_english'] = this.descriptionEnglish;
    data['description_czech'] = this.descriptionCzech;
    data['description_german'] = this.descriptionGerman;
    data['image'] = this.image;
    data['date_created'] = this.dateCreated;
    data['manual'] = this.manual;
    data['added_by'] = this.addedBy;
    return data;
  }
}
