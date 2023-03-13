class QualityProductQuestionModel {
  String? status;
  List<QuestionResult>? data;
  String? message;

  QualityProductQuestionModel({this.status, this.data, this.message});

  QualityProductQuestionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <QuestionResult>[];
      json['data'].forEach((v) {
        data!.add(new QuestionResult.fromJson(v));
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

class QuestionResult {
  int? id;
  String? questionEnglish;
  String? questionCzech;
  String? questionGerman;
  int? timeLimit;
  FieldInfoObject? fieldInfoObject;
  int? category;
  int? addedBy;

  QuestionResult(
      {this.id,
      this.questionEnglish,
      this.questionCzech,
      this.questionGerman,
      this.timeLimit,
      this.fieldInfoObject,
      this.category,
      this.addedBy});

  QuestionResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEnglish = json['question_english'];
    questionCzech = json['question_czech'];
    questionGerman = json['question_german'];
    timeLimit = json['time_limit'];
    fieldInfoObject = json['field_info_object'] != null
        ? new FieldInfoObject.fromJson(json['field_info_object'])
        : null;
    category = json['category'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_english'] = this.questionEnglish;
    data['question_czech'] = this.questionCzech;
    data['question_german'] = this.questionGerman;
    data['time_limit'] = this.timeLimit;
    if (this.fieldInfoObject != null) {
      data['field_info_object'] = this.fieldInfoObject!.toJson();
    }
    data['category'] = this.category;
    data['added_by'] = this.addedBy;
    return data;
  }
}

class FieldInfoObject {
  String? ansType;
  bool? mandatory;
  int? rangeTo;
  int? rangeFrom;
  String? fields;

  FieldInfoObject(
      {this.ansType,
      this.mandatory,
      this.rangeTo,
      this.rangeFrom,
      this.fields});

  FieldInfoObject.fromJson(Map<String, dynamic> json) {
    ansType = json['ans_type'];
    mandatory = json['mandatory'];
    rangeTo = json['range_to'];
    rangeFrom = json['range_from'];
    fields = json['fields'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ans_type'] = this.ansType;
    data['mandatory'] = this.mandatory;
    data['range_to'] = this.rangeTo;
    data['range_from'] = this.rangeFrom;
    data['fields'] = this.fields;
    return data;
  }
}
