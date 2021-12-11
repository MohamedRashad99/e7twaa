class AppointModel {
  String msg;
  Data data;

  AppointModel({this.msg, this.data});

  AppointModel.fromJson(Map<String, dynamic> json) {
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
  String address;
  String date;
  String time;
  String padiatricianId;
  int parentId;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.address,
        this.date,
        this.time,
        this.padiatricianId,
        this.parentId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    date = json['date'];
    time = json['time'];
    padiatricianId = json['padiatrician_id'];
    parentId = json['parent_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['date'] = this.date;
    data['time'] = this.time;
    data['padiatrician_id'] = this.padiatricianId;
    data['parent_id'] = this.parentId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
