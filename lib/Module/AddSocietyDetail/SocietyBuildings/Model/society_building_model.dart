class SocietyBuilding {
  SocietyBuilding({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  SocietyBuilding.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.pid,
    required this.societybuildingname,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int pid;
  late final String societybuildingname;
  late final String createdAt;
  late final String updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    pid = json['pid'];
    societybuildingname = json['societybuildingname'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pid'] = pid;
    _data['societybuildingname'] = societybuildingname;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}