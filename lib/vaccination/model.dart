class MyVaccineAlarmsModel {
  String msg;
  List<Data> data;

  MyVaccineAlarmsModel({this.msg, this.data});

  MyVaccineAlarmsModel.fromJson(Map<String, dynamic> json) {
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
  String vaccine;
  String date;
  String time;
  int parentId;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.vaccine,
        this.date,
        this.time,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccine = json['vaccine'];
    date = json['date'];
    time = json['time'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vaccine'] = this.vaccine;
    data['date'] = this.date;
    data['time'] = this.time;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
