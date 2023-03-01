import 'dart:convert';
/// success : true
/// data : [{"id":109,"pid":332,"name":"Block 1","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":110,"pid":332,"name":"Block 2","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":111,"pid":332,"name":"Block 3","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":112,"pid":332,"name":"Block 4","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":113,"pid":332,"name":"Block 5","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":114,"pid":332,"name":"Block 6","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":115,"pid":332,"name":"Block 7","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":116,"pid":332,"name":"Block 8","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":117,"pid":332,"name":"Block 9","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"},{"id":118,"pid":332,"name":"Block 10","created_at":"2022-12-08T09:09:09.000000Z","updated_at":"2022-12-08T09:09:09.000000Z"}]

Blocks blocksFromJson(String str) => Blocks.fromJson(json.decode(str));
String blocksToJson(Blocks data) => json.encode(data.toJson());
class Blocks {
  Blocks({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  Blocks.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
Blocks copyWith({  bool? success,
  List<Data>? data,
}) => Blocks(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 109
/// pid : 332
/// name : "Block 1"
/// created_at : "2022-12-08T09:09:09.000000Z"
/// updated_at : "2022-12-08T09:09:09.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? pid, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _pid = pid;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _pid = json['pid'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _pid;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? pid,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  pid: pid ?? _pid,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get pid => _pid;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pid'] = _pid;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}