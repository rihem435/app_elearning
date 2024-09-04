class UserModel {
  String? msg;
  Data? data;

  UserModel({this.msg, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  String? role;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.confirmpassword,
      this.role,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmpassword = json['confirmpassword'];
    role = json['role'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirmpassword'] = confirmpassword;
    data['role'] = role;
    data['__v'] = iV;
    return data;
  }
}
