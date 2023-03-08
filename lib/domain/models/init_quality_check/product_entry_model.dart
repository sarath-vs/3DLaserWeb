class ProductEntryModel {
  String? status;
  List<Questions>? data;
  String? message;

  ProductEntryModel({this.status, this.data, this.message});

  ProductEntryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Questions>[];
      json['data'].forEach((v) {
        data!.add(new Questions.fromJson(v));
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

class Questions {
  int? id;
  String? questionEnglish;
  String? questionCzech;
  String? questionGerman;
  List<QuestionInfo>? questionInfo;
  bool? answer;
  bool? attempted;
  String? answerLanguageCode;
  String? dateCreated;
  int? user;
  int? question;
  int? product;

  Questions(
      {this.id,
      this.questionEnglish,
      this.questionCzech,
      this.questionGerman,
      this.questionInfo,
      this.answer,
      this.attempted,
      this.answerLanguageCode,
      this.dateCreated,
      this.user,
      this.question,
      this.product});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEnglish = json['question_english'];
    questionCzech = json['question_czech'];
    questionGerman = json['question_german'];
    if (json['question_info'] != null) {
      questionInfo = <QuestionInfo>[];
      json['question_info'].forEach((v) {
        questionInfo!.add(new QuestionInfo.fromJson(v));
      });
    }
    answer = json['answer'];
    attempted = json['attempted'];
    answerLanguageCode = json['answer_language_code'];
    dateCreated = json['date_created'];
    user = json['user'];
    question = json['question'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_english'] = this.questionEnglish;
    data['question_czech'] = this.questionCzech;
    data['question_german'] = this.questionGerman;
    if (this.questionInfo != null) {
      data['question_info'] =
          this.questionInfo!.map((v) => v.toJson()).toList();
    }
    data['answer'] = this.answer;
    data['attempted'] = this.attempted;
    data['answer_language_code'] = this.answerLanguageCode;
    data['date_created'] = this.dateCreated;
    data['user'] = this.user;
    data['question'] = this.question;
    data['product'] = this.product;
    return data;
  }
}

class QuestionInfo {
  int? id;
  String? descriptionEnglish;
  String? descriptionCzech;
  String? descriptionGerman;
  String? image;
  String? video;
  String? dateCreated;
  int? question;
  int? addedBy;

  QuestionInfo(
      {this.id,
      this.descriptionEnglish,
      this.descriptionCzech,
      this.descriptionGerman,
      this.image,
      this.video,
      this.dateCreated,
      this.question,
      this.addedBy});

  QuestionInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descriptionEnglish = json['description_english'];
    descriptionCzech = json['description_czech'];
    descriptionGerman = json['description_german'];
    image = json['image'];
    video = json['video'];
    dateCreated = json['date_created'];
    question = json['question'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description_english'] = this.descriptionEnglish;
    data['description_czech'] = this.descriptionCzech;
    data['description_german'] = this.descriptionGerman;
    data['image'] = this.image;
    data['video'] = this.video;
    data['date_created'] = this.dateCreated;
    data['question'] = this.question;
    data['added_by'] = this.addedBy;
    return data;
  }
}
