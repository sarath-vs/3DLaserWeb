class GetQuestionDetailsModel {
  String? status;
  QuestionDetailResult? data;
  String? message;

  GetQuestionDetailsModel({this.status, this.data, this.message});

  GetQuestionDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new QuestionDetailResult.fromJson(json['data']) : null;
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

class QuestionDetailResult {
  int? id;
  List<ToolsUsed>? toolsUsed;
  List<String>? images;
  List<String>? videos;
  String? questionEnglish;
  String? questionCzech;
  String? questionGerman;
  String? descriptionEnglish;
  String? descriptionCzech;
  String? descriptionGerman;
  FieldInfoObject? fieldInfoObject;
  int? category;
  int? addedBy;

  QuestionDetailResult(
      {this.id,
      this.toolsUsed,
      this.images,
      this.videos,
      this.questionEnglish,
      this.questionCzech,
      this.questionGerman,
      this.descriptionEnglish,
      this.descriptionCzech,
      this.descriptionGerman,
      this.fieldInfoObject,
      this.category,
      this.addedBy});

  QuestionDetailResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tools_used'] != null) {
      toolsUsed = <ToolsUsed>[];
      json['tools_used'].forEach((v) {
        toolsUsed!.add(new ToolsUsed.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
    videos = json['videos'].cast<String>();
    questionEnglish = json['question_english'];
    questionCzech = json['question_czech'];
    questionGerman = json['question_german'];
    descriptionEnglish = json['description_english'];
    descriptionCzech = json['description_czech'];
    descriptionGerman = json['description_german'];
    fieldInfoObject = json['field_info_object'] != null
        ? new FieldInfoObject.fromJson(json['field_info_object'])
        : null;
    category = json['category'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.toolsUsed != null) {
      data['tools_used'] = this.toolsUsed!.map((v) => v.toJson()).toList();
    }
    data['images'] = this.images;
    data['videos'] = this.videos;
    data['question_english'] = this.questionEnglish;
    data['question_czech'] = this.questionCzech;
    data['question_german'] = this.questionGerman;
    data['description_english'] = this.descriptionEnglish;
    data['description_czech'] = this.descriptionCzech;
    data['description_german'] = this.descriptionGerman;
    if (this.fieldInfoObject != null) {
      data['field_info_object'] = this.fieldInfoObject!.toJson();
    }
    data['category'] = this.category;
    data['added_by'] = this.addedBy;
    return data;
  }
}

class ToolsUsed {
  int? toolId;
  String? toolName;
  String? toolImage;
  String? toolDescription;
  String? dateCreated;

  ToolsUsed(
      {this.toolId,
      this.toolName,
      this.toolImage,
      this.toolDescription,
      this.dateCreated});

  ToolsUsed.fromJson(Map<String, dynamic> json) {
    toolId = json['tool_id'];
    toolName = json['tool_name'];
    toolImage = json['tool_image'];
    toolDescription = json['tool_description'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tool_id'] = this.toolId;
    data['tool_name'] = this.toolName;
    data['tool_image'] = this.toolImage;
    data['tool_description'] = this.toolDescription;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class FieldInfoObject {
  bool? dd;
  bool? rg;
  bool? tf;
  bool? yn;
  bool? img;
  bool? vdo;
  bool? ynn;
  bool? ddMN;
  bool? rgMN;
  bool? tfMN;
  bool? ynMN;
  bool? imgMN;
  bool? vdoMN;
  bool? ynnMN;
  bool? qr_Scanner;
  String? rangeTo;
  String? rangeFrom;
  String? dropDownData;

  FieldInfoObject(
      {this.dd,
      this.rg,
      this.tf,
      this.yn,
      this.img,
      this.vdo,
      this.ynn,
      this.ddMN,
      this.rgMN,
      this.tfMN,
      this.ynMN,
      this.imgMN,
      this.vdoMN,
      this.ynnMN,
      this.rangeTo,
      this.rangeFrom,
      this.qr_Scanner,
      this.dropDownData});

  FieldInfoObject.fromJson(Map<String, dynamic> json) {
    dd = json['dd'];
    rg = json['rg'];
    tf = json['tf'];
    yn = json['yn'];
    img = json['img'];
    vdo = json['vdo'];
    ynn = json['ynn'];
    ddMN = json['ddMN'];
    rgMN = json['rgMN'];
    tfMN = json['tfMN'];
    ynMN = json['ynMN'];
    imgMN = json['imgMN'];
    vdoMN = json['vdoMN'];
    ynnMN = json['ynnMN'];
    rangeTo = json['rangeTo'];
    rangeFrom = json['rangeFrom'];
    dropDownData = json['dropDownData'];
     qr_Scanner = json['qr_Scanner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dd'] = this.dd;
    data['rg'] = this.rg;
     data['qr_Scanner'] = this.qr_Scanner;
    data['tf'] = this.tf;
    data['yn'] = this.yn;
    data['img'] = this.img;
    data['vdo'] = this.vdo;
    data['ynn'] = this.ynn;
    data['ddMN'] = this.ddMN;
    data['rgMN'] = this.rgMN;
    data['tfMN'] = this.tfMN;
    data['ynMN'] = this.ynMN;
    data['imgMN'] = this.imgMN;
    data['vdoMN'] = this.vdoMN;
    data['ynnMN'] = this.ynnMN;
    data['rangeTo'] = this.rangeTo;
    data['rangeFrom'] = this.rangeFrom;
    data['dropDownData'] = this.dropDownData;
    return data;
  }
}
