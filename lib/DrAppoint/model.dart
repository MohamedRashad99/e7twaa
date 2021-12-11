class DrAppointModel {
  String msg;
  List<Data> data;

  DrAppointModel({this.msg, this.data});

  DrAppointModel.fromJson(Map<String, dynamic> json) {
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
  String address;
  String date;
  String time;
  int status;
  int parentId;
  String parentUserName;
  String parentPhone;
  String parentBabyName;
  int padiatricianId;
  String padiatricianPhone;
  String padiatricianUserName;
  String padiatricianName;
  String padiatricianSpecialization;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.address,
        this.date,
        this.time,
        this.status,
        this.parentId,
        this.parentUserName,
        this.parentPhone,
        this.parentBabyName,
        this.padiatricianId,
        this.padiatricianPhone,
        this.padiatricianUserName,
        this.padiatricianName,
        this.padiatricianSpecialization,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    parentId = json['parent_id'];
    parentUserName = json['parent_user_name'];
    parentPhone = json['parent_phone'];
    parentBabyName = json['parent_baby_name'];
    padiatricianId = json['padiatrician_id'];
    padiatricianPhone = json['padiatrician_phone'];
    padiatricianUserName = json['padiatrician_user_name'];
    padiatricianName = json['padiatrician_name'];
    padiatricianSpecialization = json['padiatrician_specialization'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['parent_user_name'] = this.parentUserName;
    data['parent_phone'] = this.parentPhone;
    data['parent_baby_name'] = this.parentBabyName;
    data['padiatrician_id'] = this.padiatricianId;
    data['padiatrician_phone'] = this.padiatricianPhone;
    data['padiatrician_user_name'] = this.padiatricianUserName;
    data['padiatrician_name'] = this.padiatricianName;
    data['padiatrician_specialization'] = this.padiatricianSpecialization;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
