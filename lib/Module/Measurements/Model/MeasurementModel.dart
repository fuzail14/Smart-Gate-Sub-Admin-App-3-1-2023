/// message : "success"
/// data : [{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":200,"chargesafterduedate":200,"appcharges":5,"tax":2,"area":5,"bedrooms":2,"status":0,"created_at":"2023-02-19T15:08:40.000000Z","updated_at":"2023-02-19T15:08:40.000000Z"},{"id":2,"subadminid":2,"type":"house","unit":"marla","charges":3000,"chargesafterduedate":500,"appcharges":6,"tax":3,"area":1,"bedrooms":5,"status":0,"created_at":"2023-02-19T15:11:04.000000Z","updated_at":"2023-02-19T15:11:04.000000Z"},{"id":3,"subadminid":2,"type":"house","unit":"marla","charges":3000.9,"chargesafterduedate":500,"appcharges":6,"tax":3,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T15:11:44.000000Z","updated_at":"2023-02-19T15:11:44.000000Z"},{"id":4,"subadminid":2,"type":"house","unit":"marla","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:08:30.000000Z","updated_at":"2023-02-19T16:08:30.000000Z"},{"id":5,"subadminid":2,"type":"house","unit":"marla","charges":15000,"chargesafterduedate":15750,"appcharges":300,"tax":2250,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:10:08.000000Z","updated_at":"2023-02-19T16:10:08.000000Z"},{"id":6,"subadminid":2,"type":"house","unit":"marla","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:12:15.000000Z","updated_at":"2023-02-19T16:12:15.000000Z"},{"id":7,"subadminid":2,"type":"house","unit":"marla","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":1,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:14:44.000000Z","updated_at":"2023-02-19T16:14:44.000000Z"},{"id":8,"subadminid":2,"type":"house","unit":"marla","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:17:29.000000Z","updated_at":"2023-02-19T16:17:29.000000Z"},{"id":9,"subadminid":2,"type":"house","unit":"marla","charges":3000,"chargesafterduedate":3150,"appcharges":60,"tax":450,"area":5,"bedrooms":5,"status":0,"created_at":"2023-02-19T16:46:36.000000Z","updated_at":"2023-02-19T16:46:36.000000Z"},{"id":10,"subadminid":2,"type":"house","unit":"marla","charges":555,"chargesafterduedate":582.75,"appcharges":11.1,"tax":83.25,"area":8,"bedrooms":2,"status":0,"created_at":"2023-02-19T17:18:18.000000Z","updated_at":"2023-02-19T17:18:18.000000Z"},{"id":11,"subadminid":2,"type":"house","unit":"marla","charges":500,"chargesafterduedate":525,"appcharges":10,"tax":75,"area":6,"bedrooms":5,"status":0,"created_at":"2023-02-19T19:09:16.000000Z","updated_at":"2023-02-19T19:09:16.000000Z"}]

class MeasurementModel {
  MeasurementModel({
      String? message, 
      List<Data>? data,}){
    _message = message;
    _data = data;
}

  MeasurementModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  List<Data>? _data;
MeasurementModel copyWith({  String? message,
  List<Data>? data,
}) => MeasurementModel(  message: message ?? _message,
  data: data ?? _data,
);
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// subadminid : 2
/// type : "house"
/// unit : "marla"
/// charges : 200
/// chargesafterduedate : 200
/// appcharges : 5
/// tax : 2
/// area : 5
/// bedrooms : 2
/// status : 0
/// created_at : "2023-02-19T15:08:40.000000Z"
/// updated_at : "2023-02-19T15:08:40.000000Z"

class Data {
  Data({
      num? id, 
      num? subadminid, 
      String? type, 
      String? unit, 
      num? charges, 
      num? chargesafterduedate, 
      num? appcharges, 
      num? tax, 
      num? area, 
      num? bedrooms, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _subadminid = subadminid;
    _type = type;
    _unit = unit;
    _charges = charges;
    _chargesafterduedate = chargesafterduedate;
    _appcharges = appcharges;
    _tax = tax;
    _area = area;
    _bedrooms = bedrooms;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _subadminid = json['subadminid'];
    _type = json['type'];
    _unit = json['unit'];
    _charges = json['charges'];
    _chargesafterduedate = json['chargesafterduedate'];
    _appcharges = json['appcharges'];
    _tax = json['tax'];
    _area = json['area'];
    _bedrooms = json['bedrooms'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _subadminid;
  String? _type;
  String? _unit;
  num? _charges;
  num? _chargesafterduedate;
  num? _appcharges;
  num? _tax;
  num? _area;
  num? _bedrooms;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? subadminid,
  String? type,
  String? unit,
  num? charges,
  num? chargesafterduedate,
  num? appcharges,
  num? tax,
  num? area,
  num? bedrooms,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  subadminid: subadminid ?? _subadminid,
  type: type ?? _type,
  unit: unit ?? _unit,
  charges: charges ?? _charges,
  chargesafterduedate: chargesafterduedate ?? _chargesafterduedate,
  appcharges: appcharges ?? _appcharges,
  tax: tax ?? _tax,
  area: area ?? _area,
  bedrooms: bedrooms ?? _bedrooms,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get subadminid => _subadminid;
  String? get type => _type;
  String? get unit => _unit;
  num? get charges => _charges;
  num? get chargesafterduedate => _chargesafterduedate;
  num? get appcharges => _appcharges;
  num? get tax => _tax;
  num? get area => _area;
  num? get bedrooms => _bedrooms;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subadminid'] = _subadminid;
    map['type'] = _type;
    map['unit'] = _unit;
    map['charges'] = _charges;
    map['chargesafterduedate'] = _chargesafterduedate;
    map['appcharges'] = _appcharges;
    map['tax'] = _tax;
    map['area'] = _area;
    map['bedrooms'] = _bedrooms;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}