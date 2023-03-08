class DigitalMannualListModel {
  String? status;
  List<DigitalMannualListDetails>? data;
  String? message;
  int? count;
  String? next;
  String? previous;

  DigitalMannualListModel(
      {this.status,
      this.data,
      this.message,
      this.count,
      this.next,
      this.previous});

  DigitalMannualListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DigitalMannualListDetails>[];
      json['data'].forEach((v) {
        data!.add(new DigitalMannualListDetails.fromJson(v));
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

class DigitalMannualListDetails {
  int? id;
  String? subCategoryName;
  String? descriptionEnglish;
  String? descriptionCzech;
  String? descriptionGerman;
  String? video;
  String? dateCreated;
  int? subCategory;
  int? addedBy;

  DigitalMannualListDetails(
      {this.id,
      this.subCategoryName,
      this.descriptionEnglish,
      this.descriptionCzech,
      this.descriptionGerman,
      this.video,
      this.dateCreated,
      this.subCategory,
      this.addedBy});

  DigitalMannualListDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
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
    data['sub_category_name'] = this.subCategoryName;
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
