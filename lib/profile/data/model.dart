class ProfileModel {
  String msg;
  Data data;

  ProfileModel({this.msg, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String userName;
  String babyName;
  String phone;
  String email;
  String dateOfBirth;
  String sex;
  String type;
  var padiatricianName;
  var specialization;
  var emailVerifiedAt;
  String apiToken;
  int confirm;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.userName,
        this.babyName,
        this.phone,
        this.email,
        this.dateOfBirth,
        this.sex,
        this.type,
        this.padiatricianName,
        this.specialization,
        this.emailVerifiedAt,
        this.apiToken,
        this.confirm,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    babyName = json['baby_name'];
    phone = json['phone'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    sex = json['sex'];
    type = json['type'];
    padiatricianName = json['padiatrician_name'];
    specialization = json['specialization'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    confirm = json['confirm'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['baby_name'] = this.babyName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['sex'] = this.sex;
    data['type'] = this.type;
    data['padiatrician_name'] = this.padiatricianName;
    data['specialization'] = this.specialization;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['confirm'] = this.confirm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
