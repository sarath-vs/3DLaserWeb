class AnswerModel {
  String? status;
  List<AnswerList>? data;
  String? message;

  AnswerModel({this.status, this.data, this.message});

  AnswerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AnswerList>[];
      json['data'].forEach((v) {
        data!.add(new AnswerList.fromJson(v));
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

class AnswerList {
  Answer? answer;
  String? answerLanguageCode;
  int? questionId;
  double? minutesTakenToComplete;
  String? questionEnglish;
  String? questionCzech;
  String? questionGerman;

  AnswerList(
      {this.answer,
      this.answerLanguageCode,
      this.questionId,
      this.minutesTakenToComplete,
      this.questionEnglish,
      this.questionCzech,
      this.questionGerman});

  AnswerList.fromJson(Map<String, dynamic> json) {
    answer =
        json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
    answerLanguageCode = json['answer_language_code'];
    questionId = json['question_id'];
    minutesTakenToComplete = json['minutes_taken_to_complete'];
    questionEnglish = json['question_english'];
    questionCzech = json['question_czech'];
    questionGerman = json['question_german'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    data['answer_language_code'] = this.answerLanguageCode;
    data['question_id'] = this.questionId;
    data['minutes_taken_to_complete'] = this.minutesTakenToComplete;
    data['question_english'] = this.questionEnglish;
    data['question_czech'] = this.questionCzech;
    data['question_german'] = this.questionGerman;
    return data;
  }
}

class Answer {
  String? image;
  String? dropdown;
  String? range;
  String? yesOrNo;
  String? yesOrNoOrNoOne;

  Answer({this.image, this.dropdown, this.range,this.yesOrNo});

  Answer.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    dropdown = json['drop_down'];
    range = json['range'];
    yesOrNo = json['yesOrNo'];
    yesOrNoOrNoOne = json['yesOrNoOrNoOne'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['drop_down'] = this.dropdown;
     data['range'] = this.range;
     data['yesOrNo'] = this.yesOrNo;
     data['yesOrNoOrNoOne'] = this.yesOrNoOrNoOne;
    return data;
  }
}
