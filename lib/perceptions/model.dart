class MyMedicineAlarmsModel {
  String msg;
  List<Data> data;

  MyMedicineAlarmsModel({this.msg, this.data});

  MyMedicineAlarmsModel.fromJson(Map<String, dynamic> json) {
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
  String startDate;
  String endDate;
  int days;
  int parentId;
  String time;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.startDate,
        this.endDate,
        this.days,
        this.parentId,
        this.time,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    days = json['days'];
    parentId = json['parent_id'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['days'] = this.days;
    data['parent_id'] = this.parentId;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
