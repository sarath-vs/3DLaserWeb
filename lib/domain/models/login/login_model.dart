class LoginModel {
  String? refresh;
  String? access;
  bool? isSuperuser;
  String? name;
  String? email;
  bool? isAdmin;
  bool? isAdministrator;
  bool? isWorker;

  LoginModel(
      {this.refresh,
      this.access,
      this.isSuperuser,
      this.name,
      this.email,
      this.isAdmin,
      this.isAdministrator,
      this.isWorker});

  LoginModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    isSuperuser = json['is_superuser'];
    name = json['name'];
    email = json['email'];
    isAdmin = json['is_admin'];
    isAdministrator = json['is_administrator'];
    isWorker = json['is_worker'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['refresh'] = refresh;
    data['access'] = access;
    data['is_superuser'] = isSuperuser;
    data['name'] = name;
    data['email'] = email;
    data['is_admin'] = isAdmin;
    data['is_administrator'] = isAdministrator;
    data['is_worker'] = isWorker;
    return data;
  }
}
