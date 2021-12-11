class AllChatsModel {
  String msg;
  List<Data> data;

  AllChatsModel({this.msg, this.data});

  AllChatsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String massage;
  Null file;
  int type;
  int conversationId;
  int senderId;
  int receiverId;
  String createdAt;
  String updatedAt;
  Sender sender;
  Sender receiver;

  Data(
      {this.id,
        this.massage,
        this.file,
        this.type,
        this.conversationId,
        this.senderId,
        this.receiverId,
        this.createdAt,
        this.updatedAt,
        this.sender,
        this.receiver});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    massage = json['massage'];
    file = json['file'];
    type = json['type'];
    conversationId = json['conversation_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sender =
    json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver =
    json['receiver'] != null ? new Sender.fromJson(json['receiver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['massage'] = this.massage;
    data['file'] = this.file;
    data['type'] = this.type;
    data['conversation_id'] = this.conversationId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    return data;
  }
}

class Sender {
  int id;
  String userName;
  String babyName;
  String phone;
  String email;
  String dateOfBirth;
  String sex;
  String type;
  String padiatricianName;
  String specialization;
  Null emailVerifiedAt;
  String apiToken;
  int confirm;
  String createdAt;
  String updatedAt;

  Sender(
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

  Sender.fromJson(Map<String, dynamic> json) {
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
