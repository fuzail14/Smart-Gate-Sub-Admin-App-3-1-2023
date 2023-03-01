/// success : true
/// data : [{"id":4,"residentid":4,"subadminid":2,"country":"🇵🇰    Pakistan","state":"Punjab","city":"null","societyname":"","societyid":1,"pid":1,"bid":1,"sid":1,"propertyid":1,"houseaddress":"House no 1","vechileno":"dd","residenttype":"Rental","propertytype":"House","committeemember":0,"status":0,"measurementid":1,"created_at":"2023-02-17T12:03:14.000000Z","updated_at":"2023-02-18T06:29:53.000000Z","firstname":"ali khan","lastname":"727","cnic":"37605","address":"House no 1","mobileno":"0321383","password":"$2y$10$.plfXTccjGlfJnG.FEVL2O1szfVlG22vFY2Rx7sxEaLQKHN5ZI7X2","roleid":3,"rolename":"resident","image":"1676635394.jpg","fcmtoken":"dbj9C_Y_TdmgJ3K0qXFgde:APA91bE8doSsuipkze4r-p49J4_JsDCGWcgDBj3S7mM4_InrfON2GgbrX3hT0Ww_j3vKHzt8SKjDpgeXuNRDVwyduaCxjqLqaQfUtG3vD7Ea6RqCbQp7PJculMzTnwOIPfYfdrZbbiHD","society":[{"id":1,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","area":"Rawat","type":"society","name":"Rawat Enclave","address":"T Chowk","superadminid":1,"created_at":"2023-02-17T11:57:47.000000Z","updated_at":"2023-02-17T11:57:47.000000Z"}],"phase":[{"id":1,"name":"Phase 1","subadminid":2,"societyid":1,"created_at":"2023-02-17T12:07:01.000000Z","updated_at":"2023-02-17T12:07:01.000000Z"}],"block":[{"id":1,"pid":1,"name":"Block 1","created_at":"2023-02-17T12:07:08.000000Z","updated_at":"2023-02-17T12:07:08.000000Z"}],"street":[{"id":1,"bid":1,"name":"Street 1","created_at":"2023-02-17T12:07:15.000000Z","updated_at":"2023-02-17T12:07:15.000000Z"}],"property":[{"id":1,"sid":1,"address":"House no 1","typeid":0,"type":"house","created_at":"2023-02-17T12:07:23.000000Z","updated_at":"2023-02-17T12:07:23.000000Z"}],"measurement":[{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":2000,"area":2,"bedrooms":2,"status":0,"created_at":"2023-02-17T12:07:50.000000Z","updated_at":"2023-02-17T12:07:50.000000Z"}],"owner":[{"id":1,"residentid":4,"ownername":"h","owneraddress":"NA","ownermobileno":"v","created_at":"2023-02-17T12:17:48.000000Z","updated_at":"2023-02-17T12:17:48.000000Z"}]},{"id":9,"residentid":9,"subadminid":2,"country":"🇵🇰    Pakistan","state":"null","city":"null","societyname":"","societyid":1,"pid":1,"bid":1,"sid":1,"propertyid":1,"houseaddress":"House no 1","vechileno":"rwpn76","residenttype":"Owner","propertytype":"House","committeemember":0,"status":0,"measurementid":1,"created_at":"2023-02-18T12:45:29.000000Z","updated_at":"2023-02-18T12:46:11.000000Z","firstname":"ajja","lastname":"hayay","cnic":"321","address":"---","mobileno":"gaya","password":"$2y$10$9HMrogChsMp.jjJlTvuz1.VzMnftLigRbvaoGqbM1QC/fTUX63T66","roleid":3,"rolename":"resident","image":"1676724329.jpg","fcmtoken":"dbj9C_Y_TdmgJ3K0qXFgde:APA91bGDlvLHIh2iK7mU4PDYTme1DFX9BYXLWtqhBm_UgBt2asKGb8BQXpxYAerR0GTxXGCne3a8iVP3_HMQM1Ov5WnWNaMseES9IGMzr74Y7vbASzaX_t7fbdkeCnubhCXbb30Gwzhc","society":[{"id":1,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","area":"Rawat","type":"society","name":"Rawat Enclave","address":"T Chowk","superadminid":1,"created_at":"2023-02-17T11:57:47.000000Z","updated_at":"2023-02-17T11:57:47.000000Z"}],"phase":[{"id":1,"name":"Phase 1","subadminid":2,"societyid":1,"created_at":"2023-02-17T12:07:01.000000Z","updated_at":"2023-02-17T12:07:01.000000Z"}],"block":[{"id":1,"pid":1,"name":"Block 1","created_at":"2023-02-17T12:07:08.000000Z","updated_at":"2023-02-17T12:07:08.000000Z"}],"street":[{"id":1,"bid":1,"name":"Street 1","created_at":"2023-02-17T12:07:15.000000Z","updated_at":"2023-02-17T12:07:15.000000Z"}],"property":[{"id":1,"sid":1,"address":"House no 1","typeid":0,"type":"house","created_at":"2023-02-17T12:07:23.000000Z","updated_at":"2023-02-17T12:07:23.000000Z"}],"measurement":[{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":2000,"area":2,"bedrooms":2,"status":0,"created_at":"2023-02-17T12:07:50.000000Z","updated_at":"2023-02-17T12:07:50.000000Z"}],"owner":[]}]

class Resident {
  Resident({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  Resident.fromJson(dynamic json) {
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
Resident copyWith({  bool? success,
  List<Data>? data,
}) => Resident(  success: success ?? _success,
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

/// id : 4
/// residentid : 4
/// subadminid : 2
/// country : "🇵🇰    Pakistan"
/// state : "Punjab"
/// city : "null"
/// societyname : ""
/// societyid : 1
/// pid : 1
/// bid : 1
/// sid : 1
/// propertyid : 1
/// houseaddress : "House no 1"
/// vechileno : "dd"
/// residenttype : "Rental"
/// propertytype : "House"
/// committeemember : 0
/// status : 0
/// measurementid : 1
/// created_at : "2023-02-17T12:03:14.000000Z"
/// updated_at : "2023-02-18T06:29:53.000000Z"
/// firstname : "ali khan"
/// lastname : "727"
/// cnic : "37605"
/// address : "House no 1"
/// mobileno : "0321383"
/// password : "$2y$10$.plfXTccjGlfJnG.FEVL2O1szfVlG22vFY2Rx7sxEaLQKHN5ZI7X2"
/// roleid : 3
/// rolename : "resident"
/// image : "1676635394.jpg"
/// fcmtoken : "dbj9C_Y_TdmgJ3K0qXFgde:APA91bE8doSsuipkze4r-p49J4_JsDCGWcgDBj3S7mM4_InrfON2GgbrX3hT0Ww_j3vKHzt8SKjDpgeXuNRDVwyduaCxjqLqaQfUtG3vD7Ea6RqCbQp7PJculMzTnwOIPfYfdrZbbiHD"
/// society : [{"id":1,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","area":"Rawat","type":"society","name":"Rawat Enclave","address":"T Chowk","superadminid":1,"created_at":"2023-02-17T11:57:47.000000Z","updated_at":"2023-02-17T11:57:47.000000Z"}]
/// phase : [{"id":1,"name":"Phase 1","subadminid":2,"societyid":1,"created_at":"2023-02-17T12:07:01.000000Z","updated_at":"2023-02-17T12:07:01.000000Z"}]
/// block : [{"id":1,"pid":1,"name":"Block 1","created_at":"2023-02-17T12:07:08.000000Z","updated_at":"2023-02-17T12:07:08.000000Z"}]
/// street : [{"id":1,"bid":1,"name":"Street 1","created_at":"2023-02-17T12:07:15.000000Z","updated_at":"2023-02-17T12:07:15.000000Z"}]
/// property : [{"id":1,"sid":1,"address":"House no 1","typeid":0,"type":"house","created_at":"2023-02-17T12:07:23.000000Z","updated_at":"2023-02-17T12:07:23.000000Z"}]
/// measurement : [{"id":1,"subadminid":2,"type":"house","unit":"marla","charges":2000,"area":2,"bedrooms":2,"status":0,"created_at":"2023-02-17T12:07:50.000000Z","updated_at":"2023-02-17T12:07:50.000000Z"}]
/// owner : [{"id":1,"residentid":4,"ownername":"h","owneraddress":"NA","ownermobileno":"v","created_at":"2023-02-17T12:17:48.000000Z","updated_at":"2023-02-17T12:17:48.000000Z"}]

class Data {
  Data({
      num? id, 
      num? residentid, 
      num? subadminid, 
      String? country, 
      String? state, 
      String? city, 
      String? societyname, 
      num? societyid, 
      num? pid, 
      num? bid, 
      num? sid, 
      num? propertyid, 
      String? houseaddress, 
      String? vechileno, 
      String? residenttype, 
      String? propertytype, 
      num? committeemember, 
      num? status, 
      num? measurementid, 
      String? createdAt, 
      String? updatedAt, 
      String? firstname, 
      String? lastname, 
      String? cnic, 
      String? address, 
      String? mobileno, 
      String? password, 
      num? roleid, 
      String? rolename, 
      String? image, 
      String? fcmtoken, 
      List<Society>? society, 
      List<Phase>? phase, 
      List<Block>? block, 
      List<Street>? street, 
      List<Property>? property, 
      List<Measurement>? measurement, 
      List<Owner>? owner,}){
    _id = id;
    _residentid = residentid;
    _subadminid = subadminid;
    _country = country;
    _state = state;
    _city = city;
    _societyname = societyname;
    _societyid = societyid;
    _pid = pid;
    _bid = bid;
    _sid = sid;
    _propertyid = propertyid;
    _houseaddress = houseaddress;
    _vechileno = vechileno;
    _residenttype = residenttype;
    _propertytype = propertytype;
    _committeemember = committeemember;
    _status = status;
    _measurementid = measurementid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstname = firstname;
    _lastname = lastname;
    _cnic = cnic;
    _address = address;
    _mobileno = mobileno;
    _password = password;
    _roleid = roleid;
    _rolename = rolename;
    _image = image;
    _fcmtoken = fcmtoken;
    _society = society;
    _phase = phase;
    _block = block;
    _street = street;
    _property = property;
    _measurement = measurement;
    _owner = owner;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _residentid = json['residentid'];
    _subadminid = json['subadminid'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _societyname = json['societyname'];
    _societyid = json['societyid'];
    _pid = json['pid'];
    _bid = json['bid'];
    _sid = json['sid'];
    _propertyid = json['propertyid'];
    _houseaddress = json['houseaddress'];
    _vechileno = json['vechileno'];
    _residenttype = json['residenttype'];
    _propertytype = json['propertytype'];
    _committeemember = json['committeemember'];
    _status = json['status'];
    _measurementid = json['measurementid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _cnic = json['cnic'];
    _address = json['address'];
    _mobileno = json['mobileno'];
    _password = json['password'];
    _roleid = json['roleid'];
    _rolename = json['rolename'];
    _image = json['image'];
    _fcmtoken = json['fcmtoken'];
    if (json['society'] != null) {
      _society = [];
      json['society'].forEach((v) {
        _society?.add(Society.fromJson(v));
      });
    }
    if (json['phase'] != null) {
      _phase = [];
      json['phase'].forEach((v) {
        _phase?.add(Phase.fromJson(v));
      });
    }
    if (json['block'] != null) {
      _block = [];
      json['block'].forEach((v) {
        _block?.add(Block.fromJson(v));
      });
    }
    if (json['street'] != null) {
      _street = [];
      json['street'].forEach((v) {
        _street?.add(Street.fromJson(v));
      });
    }
    if (json['property'] != null) {
      _property = [];
      json['property'].forEach((v) {
        _property?.add(Property.fromJson(v));
      });
    }
    if (json['measurement'] != null) {
      _measurement = [];
      json['measurement'].forEach((v) {
        _measurement?.add(Measurement.fromJson(v));
      });
    }
    if (json['owner'] != null) {
      _owner = [];
      json['owner'].forEach((v) {
        _owner?.add(Owner.fromJson(v));
      });
    }
  }
  num? _id;
  num? _residentid;
  num? _subadminid;
  String? _country;
  String? _state;
  String? _city;
  String? _societyname;
  num? _societyid;
  num? _pid;
  num? _bid;
  num? _sid;
  num? _propertyid;
  String? _houseaddress;
  String? _vechileno;
  String? _residenttype;
  String? _propertytype;
  num? _committeemember;
  num? _status;
  num? _measurementid;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;
  String? _cnic;
  String? _address;
  String? _mobileno;
  String? _password;
  num? _roleid;
  String? _rolename;
  String? _image;
  String? _fcmtoken;
  List<Society>? _society;
  List<Phase>? _phase;
  List<Block>? _block;
  List<Street>? _street;
  List<Property>? _property;
  List<Measurement>? _measurement;
  List<Owner>? _owner;
Data copyWith({  num? id,
  num? residentid,
  num? subadminid,
  String? country,
  String? state,
  String? city,
  String? societyname,
  num? societyid,
  num? pid,
  num? bid,
  num? sid,
  num? propertyid,
  String? houseaddress,
  String? vechileno,
  String? residenttype,
  String? propertytype,
  num? committeemember,
  num? status,
  num? measurementid,
  String? createdAt,
  String? updatedAt,
  String? firstname,
  String? lastname,
  String? cnic,
  String? address,
  String? mobileno,
  String? password,
  num? roleid,
  String? rolename,
  String? image,
  String? fcmtoken,
  List<Society>? society,
  List<Phase>? phase,
  List<Block>? block,
  List<Street>? street,
  List<Property>? property,
  List<Measurement>? measurement,
  List<Owner>? owner,
}) => Data(  id: id ?? _id,
  residentid: residentid ?? _residentid,
  subadminid: subadminid ?? _subadminid,
  country: country ?? _country,
  state: state ?? _state,
  city: city ?? _city,
  societyname: societyname ?? _societyname,
  societyid: societyid ?? _societyid,
  pid: pid ?? _pid,
  bid: bid ?? _bid,
  sid: sid ?? _sid,
  propertyid: propertyid ?? _propertyid,
  houseaddress: houseaddress ?? _houseaddress,
  vechileno: vechileno ?? _vechileno,
  residenttype: residenttype ?? _residenttype,
  propertytype: propertytype ?? _propertytype,
  committeemember: committeemember ?? _committeemember,
  status: status ?? _status,
  measurementid: measurementid ?? _measurementid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  cnic: cnic ?? _cnic,
  address: address ?? _address,
  mobileno: mobileno ?? _mobileno,
  password: password ?? _password,
  roleid: roleid ?? _roleid,
  rolename: rolename ?? _rolename,
  image: image ?? _image,
  fcmtoken: fcmtoken ?? _fcmtoken,
  society: society ?? _society,
  phase: phase ?? _phase,
  block: block ?? _block,
  street: street ?? _street,
  property: property ?? _property,
  measurement: measurement ?? _measurement,
  owner: owner ?? _owner,
);
  num? get id => _id;
  num? get residentid => _residentid;
  num? get subadminid => _subadminid;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get societyname => _societyname;
  num? get societyid => _societyid;
  num? get pid => _pid;
  num? get bid => _bid;
  num? get sid => _sid;
  num? get propertyid => _propertyid;
  String? get houseaddress => _houseaddress;
  String? get vechileno => _vechileno;
  String? get residenttype => _residenttype;
  String? get propertytype => _propertytype;
  num? get committeemember => _committeemember;
  num? get status => _status;
  num? get measurementid => _measurementid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get cnic => _cnic;
  String? get address => _address;
  String? get mobileno => _mobileno;
  String? get password => _password;
  num? get roleid => _roleid;
  String? get rolename => _rolename;
  String? get image => _image;
  String? get fcmtoken => _fcmtoken;
  List<Society>? get society => _society;
  List<Phase>? get phase => _phase;
  List<Block>? get block => _block;
  List<Street>? get street => _street;
  List<Property>? get property => _property;
  List<Measurement>? get measurement => _measurement;
  List<Owner>? get owner => _owner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['residentid'] = _residentid;
    map['subadminid'] = _subadminid;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['societyname'] = _societyname;
    map['societyid'] = _societyid;
    map['pid'] = _pid;
    map['bid'] = _bid;
    map['sid'] = _sid;
    map['propertyid'] = _propertyid;
    map['houseaddress'] = _houseaddress;
    map['vechileno'] = _vechileno;
    map['residenttype'] = _residenttype;
    map['propertytype'] = _propertytype;
    map['committeemember'] = _committeemember;
    map['status'] = _status;
    map['measurementid'] = _measurementid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['cnic'] = _cnic;
    map['address'] = _address;
    map['mobileno'] = _mobileno;
    map['password'] = _password;
    map['roleid'] = _roleid;
    map['rolename'] = _rolename;
    map['image'] = _image;
    map['fcmtoken'] = _fcmtoken;
    if (_society != null) {
      map['society'] = _society?.map((v) => v.toJson()).toList();
    }
    if (_phase != null) {
      map['phase'] = _phase?.map((v) => v.toJson()).toList();
    }
    if (_block != null) {
      map['block'] = _block?.map((v) => v.toJson()).toList();
    }
    if (_street != null) {
      map['street'] = _street?.map((v) => v.toJson()).toList();
    }
    if (_property != null) {
      map['property'] = _property?.map((v) => v.toJson()).toList();
    }
    if (_measurement != null) {
      map['measurement'] = _measurement?.map((v) => v.toJson()).toList();
    }
    if (_owner != null) {
      map['owner'] = _owner?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// residentid : 4
/// ownername : "h"
/// owneraddress : "NA"
/// ownermobileno : "v"
/// created_at : "2023-02-17T12:17:48.000000Z"
/// updated_at : "2023-02-17T12:17:48.000000Z"

class Owner {
  Owner({
      num? id, 
      num? residentid, 
      String? ownername, 
      String? owneraddress, 
      String? ownermobileno, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _residentid = residentid;
    _ownername = ownername;
    _owneraddress = owneraddress;
    _ownermobileno = ownermobileno;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Owner.fromJson(dynamic json) {
    _id = json['id'];
    _residentid = json['residentid'];
    _ownername = json['ownername'];
    _owneraddress = json['owneraddress'];
    _ownermobileno = json['ownermobileno'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _residentid;
  String? _ownername;
  String? _owneraddress;
  String? _ownermobileno;
  String? _createdAt;
  String? _updatedAt;
Owner copyWith({  num? id,
  num? residentid,
  String? ownername,
  String? owneraddress,
  String? ownermobileno,
  String? createdAt,
  String? updatedAt,
}) => Owner(  id: id ?? _id,
  residentid: residentid ?? _residentid,
  ownername: ownername ?? _ownername,
  owneraddress: owneraddress ?? _owneraddress,
  ownermobileno: ownermobileno ?? _ownermobileno,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get residentid => _residentid;
  String? get ownername => _ownername;
  String? get owneraddress => _owneraddress;
  String? get ownermobileno => _ownermobileno;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['residentid'] = _residentid;
    map['ownername'] = _ownername;
    map['owneraddress'] = _owneraddress;
    map['ownermobileno'] = _ownermobileno;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// subadminid : 2
/// type : "house"
/// unit : "marla"
/// charges : 2000
/// area : 2
/// bedrooms : 2
/// status : 0
/// created_at : "2023-02-17T12:07:50.000000Z"
/// updated_at : "2023-02-17T12:07:50.000000Z"

class Measurement {
  Measurement({
      num? id, 
      num? subadminid, 
      String? type, 
      String? unit, 
      num? charges, 
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
    _area = area;
    _bedrooms = bedrooms;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Measurement.fromJson(dynamic json) {
    _id = json['id'];
    _subadminid = json['subadminid'];
    _type = json['type'];
    _unit = json['unit'];
    _charges = json['charges'];
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
  num? _area;
  num? _bedrooms;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Measurement copyWith({  num? id,
  num? subadminid,
  String? type,
  String? unit,
  num? charges,
  num? area,
  num? bedrooms,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Measurement(  id: id ?? _id,
  subadminid: subadminid ?? _subadminid,
  type: type ?? _type,
  unit: unit ?? _unit,
  charges: charges ?? _charges,
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
    map['area'] = _area;
    map['bedrooms'] = _bedrooms;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// sid : 1
/// address : "House no 1"
/// typeid : 0
/// type : "house"
/// created_at : "2023-02-17T12:07:23.000000Z"
/// updated_at : "2023-02-17T12:07:23.000000Z"

class Property {
  Property({
      num? id, 
      num? sid, 
      String? address, 
      num? typeid, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _sid = sid;
    _address = address;
    _typeid = typeid;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Property.fromJson(dynamic json) {
    _id = json['id'];
    _sid = json['sid'];
    _address = json['address'];
    _typeid = json['typeid'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _sid;
  String? _address;
  num? _typeid;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
Property copyWith({  num? id,
  num? sid,
  String? address,
  num? typeid,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => Property(  id: id ?? _id,
  sid: sid ?? _sid,
  address: address ?? _address,
  typeid: typeid ?? _typeid,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get sid => _sid;
  String? get address => _address;
  num? get typeid => _typeid;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sid'] = _sid;
    map['address'] = _address;
    map['typeid'] = _typeid;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// bid : 1
/// name : "Street 1"
/// created_at : "2023-02-17T12:07:15.000000Z"
/// updated_at : "2023-02-17T12:07:15.000000Z"

class Street {
  Street({
      num? id, 
      num? bid, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _bid = bid;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Street.fromJson(dynamic json) {
    _id = json['id'];
    _bid = json['bid'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _bid;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Street copyWith({  num? id,
  num? bid,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Street(  id: id ?? _id,
  bid: bid ?? _bid,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get bid => _bid;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bid'] = _bid;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// pid : 1
/// name : "Block 1"
/// created_at : "2023-02-17T12:07:08.000000Z"
/// updated_at : "2023-02-17T12:07:08.000000Z"

class Block {
  Block({
      num? id, 
      num? pid, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _pid = pid;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Block.fromJson(dynamic json) {
    _id = json['id'];
    _pid = json['pid'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _pid;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Block copyWith({  num? id,
  num? pid,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Block(  id: id ?? _id,
  pid: pid ?? _pid,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get pid => _pid;
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

/// id : 1
/// name : "Phase 1"
/// subadminid : 2
/// societyid : 1
/// created_at : "2023-02-17T12:07:01.000000Z"
/// updated_at : "2023-02-17T12:07:01.000000Z"

class Phase {
  Phase({
      num? id, 
      String? name, 
      num? subadminid, 
      num? societyid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _subadminid = subadminid;
    _societyid = societyid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Phase.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _subadminid = json['subadminid'];
    _societyid = json['societyid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _subadminid;
  num? _societyid;
  String? _createdAt;
  String? _updatedAt;
Phase copyWith({  num? id,
  String? name,
  num? subadminid,
  num? societyid,
  String? createdAt,
  String? updatedAt,
}) => Phase(  id: id ?? _id,
  name: name ?? _name,
  subadminid: subadminid ?? _subadminid,
  societyid: societyid ?? _societyid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get subadminid => _subadminid;
  num? get societyid => _societyid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['subadminid'] = _subadminid;
    map['societyid'] = _societyid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// country : "🇵🇰    Pakistan"
/// state : "Punjab"
/// city : "Rawalpindi"
/// area : "Rawat"
/// type : "society"
/// name : "Rawat Enclave"
/// address : "T Chowk"
/// superadminid : 1
/// created_at : "2023-02-17T11:57:47.000000Z"
/// updated_at : "2023-02-17T11:57:47.000000Z"

class Society {
  Society({
      num? id, 
      String? country, 
      String? state, 
      String? city, 
      String? area, 
      String? type, 
      String? name, 
      String? address, 
      num? superadminid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _country = country;
    _state = state;
    _city = city;
    _area = area;
    _type = type;
    _name = name;
    _address = address;
    _superadminid = superadminid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Society.fromJson(dynamic json) {
    _id = json['id'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _area = json['area'];
    _type = json['type'];
    _name = json['name'];
    _address = json['address'];
    _superadminid = json['superadminid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _country;
  String? _state;
  String? _city;
  String? _area;
  String? _type;
  String? _name;
  String? _address;
  num? _superadminid;
  String? _createdAt;
  String? _updatedAt;
Society copyWith({  num? id,
  String? country,
  String? state,
  String? city,
  String? area,
  String? type,
  String? name,
  String? address,
  num? superadminid,
  String? createdAt,
  String? updatedAt,
}) => Society(  id: id ?? _id,
  country: country ?? _country,
  state: state ?? _state,
  city: city ?? _city,
  area: area ?? _area,
  type: type ?? _type,
  name: name ?? _name,
  address: address ?? _address,
  superadminid: superadminid ?? _superadminid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get area => _area;
  String? get type => _type;
  String? get name => _name;
  String? get address => _address;
  num? get superadminid => _superadminid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['area'] = _area;
    map['type'] = _type;
    map['name'] = _name;
    map['address'] = _address;
    map['superadminid'] = _superadminid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}