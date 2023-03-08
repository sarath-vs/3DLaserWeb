class RefreshTockenModel {
  String? access;
  String? refresh;

  RefreshTockenModel({this.access, this.refresh});

  RefreshTockenModel.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access'] = access;
    data['refresh'] = refresh;
    return data;
  }
}
