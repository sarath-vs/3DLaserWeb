class AnswerField {
  List<AnswerFieldResult>? result;

  AnswerField({this.result});

  AnswerField.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <AnswerFieldResult>[];
      json['result'].forEach((v) {
        result!.add(new AnswerFieldResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerFieldResult {
  bool? yn;
  bool? ynMN;
  bool? ynn;
  bool? ynnMN;
  bool? rg;
  bool? rgMN;
  bool? tf;
  bool? tfMN;
  bool? dd;
  bool? ddMN;
  bool? img;
  bool? imgMN;
  bool? vdo;
  bool? vdoMN;

  AnswerFieldResult(
      {this.yn,
      this.ynMN,
      this.ynn,
      this.ynnMN,
      this.rg,
      this.rgMN,
      this.tf,
      this.tfMN,
      this.dd,
      this.ddMN,
      this.img,
      this.imgMN,
      this.vdo,
      this.vdoMN});

  AnswerFieldResult.fromJson(Map<String, dynamic> json) {
    yn = json['yn'];
    ynMN = json['ynMN'];
    ynn = json['ynn'];
    ynnMN = json['ynnMN'];
    rg = json['rg'];
    rgMN = json['rgMN'];
    tf = json['tf'];
    tfMN = json['tfMN'];
    dd = json['dd'];
    ddMN = json['ddMN'];
    img = json['img'];
    imgMN = json['imgMN'];
    vdo = json['vdo'];
    vdoMN = json['vdoMN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yn'] = this.yn;
    data['ynMN'] = this.ynMN;
    data['ynn'] = this.ynn;
    data['ynnMN'] = this.ynnMN;
    data['rg'] = this.rg;
    data['rgMN'] = this.rgMN;
    data['tf'] = this.tf;
    data['tfMN'] = this.tfMN;
    data['dd'] = this.dd;
    data['ddMN'] = this.ddMN;
    data['img'] = this.img;
    data['imgMN'] = this.imgMN;
    data['vdo'] = this.vdo;
    data['vdoMN'] = this.vdoMN;
    return data;
  }
}
