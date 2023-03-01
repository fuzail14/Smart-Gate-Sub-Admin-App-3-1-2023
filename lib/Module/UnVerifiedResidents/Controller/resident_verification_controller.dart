import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/Resident Model/Resident.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as Http;
class ResidentVerificationController extends GetxController {
  var data = Get.arguments;
  late final User userdata;
  late Data resident;
  String country = '';
  String state = '';
  String city = '';

  var isHidden = false;
  var isLoading = false;
  var isProperty = false;
  TextEditingController vehiclenoController = TextEditingController();
  TextEditingController ownernameController = TextEditingController();
  TextEditingController houseaddressdetailController = TextEditingController();
  TextEditingController ownerphonenumController = TextEditingController();
  TextEditingController owneraddressController = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Phase? phases;
  Block? blocks;
  Street? streets;
  Property? houses;
  Measurement? measurements;
  String houseorapartment = 'House';
  String rentalorowner = 'Rental';
  var phaseli = <Phase>[];

  var blockli = <Block>[];
  var streetli = <Street>[];
  var houseli = <Property>[];
  var measurementlist = <Measurement>[];
  var propertytype = 'House';
  var rentalorownerlist = ['Rental', 'Owner'];

  HouseApartment(val) {
    houseorapartment = val;
    update();
  }

  SelectedPhase(val) async {
    print('dropdown val $val');
    blockli.clear();
    blocks = null;
    streetli.clear();
    streets = null;
    houseli.clear();
    houses = null;
    houseaddressdetailController.clear();

    phases = val;

    update();
  }

  initSelectedPhase(val) async {
    print('dropdown val $val');
    blockli.clear();
    blocks = null;
    streetli.clear();
    streets = null;
    houseli.clear();
    houses = null;
    houseaddressdetailController.clear();

    phases = val;

    update();
  }

  SelectedBlock(val) async {
    print('dropdown val $val');
    streetli.clear();
    streets = null;
    houseli.clear();
    houses = null;
    blocks = val;
    measurements = null;
    measurementlist.clear();

    update();
  }

  SelectedStreet(val) async {
    print('dropdown val $val');
    houses = null;
    houseli.clear();

    houseaddressdetailController.clear();
    streets = val;

    update();
  }

  SelectedRentalOrOwner(val) {
    rentalorowner = val;
    update();
  }

  SelectedMeasurement(val) {
    measurements = val;
    update();
  }

  Future<List<Phase>> viewAllPhasesApi(
      {required societyid, required bearerToken}) async {
    var response = await Dio().get(
        Api.view_all_phases + '/' + societyid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    phaseli = (data as List)
        .map((e) => Phase(
              id: e['id'],
              name: e['name'],
              subadminid: e['subadminid'],
              societyid: e['societyid'],
            ))
        .toList();

    return phaseli;
  }

  Future<List<Block>> viewAllBlocksApi(
      {required phaseid, required bearertoken}) async {
    print('Block aya');

    var response = await Dio().get(
        Api.view_all_blocks + '/' + phaseid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearertoken}"
        }));
    var data = response.data['data'];

    blockli = (data as List)
        .map((e) => Block(
              id: e['id'],
              name: e['name'],
              pid: e['pid'],
            ))
        .toList();

    return blockli;
  }

  Future<List<Street>> viewAllStreetsApi(
      {required blockid, required bearerToken}) async {
    print('Street aya');

    print(blockid);
    var response = await Dio().get(
        Api.view_all_streets + '/' + blockid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    streetli = (data as List)
        .map((e) => Street(
              id: e['id'],
              name: e['name'],
              bid: e['bid'],
            ))
        .toList();

    return streetli;
  }

  Future<List<Property>> viewAllHousesApi(
      {required streetid, required bearerToken}) async {
    print('House aya');

    print(streetid);

    var response = await Dio().get(
        Api.view_properties_for_residents + '/' + streetid.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${bearerToken}"
        }));
    var data = response.data['data'];

    houseli = (data as List)
        .map((e) => Property(
            id: e['id'],
            address: e['address'],
            sid: e['sid'],
            type: e['type'],
            typeid: e['typeid']))
        .toList();

    return houseli;
  }

  SelectedHouse(val) {
    houses = val;
    update();
  }

  Future<List<Measurement>> housesApartmentsModelApi(
      {required subadminid,
      required String token,
      required String type}) async {
    print(subadminid);
    print(token);
    print(type);

    var response = await Dio().get(
        Api.housesapartmentmeasurements +
            '/' +
            subadminid.toString() +
            '/' +
            type.toString(),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${token}"
        }));
    var data = response.data['data'];

    measurementlist = (data as List)
        .map((e) => Measurement(
            id: e['id'],
            subadminid: e['subadminid'],
            charges: e['charges'],
            area: e['area'],
            bedrooms: e['bedrooms'],
            status: e['status'],
            type: e['type'],
            unit: e['unit']))
        .toList();

    return measurementlist;
  }

  isPropertyHouseApartment() {
    isProperty = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    SelectedPhase(resident.phase![0]);
    SelectedBlock(resident.block![0]);
    SelectedStreet(resident.street![0]);
    SelectedHouse(resident.property![0]);
    SelectedMeasurement(resident.measurement![0]);
    vehiclenoController.text = resident.vechileno!;



    state = resident.state!;
    city = resident.city!;
    update();
  }

  Future verifyResidentApi({
 residentid,
    required int status,
    pid,
     bid,
 sid,
   propertyid,
     measurementid,
    vechileno,
    required String token,
  }) async {
    final response = await Http.post(Uri.parse(Api.verifyresident),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(<String, dynamic>{
          "residentid": residentid,
          "status": status,
          'pid':pid,
          'bid':bid,
          'sid':sid,
          'propertyid':propertyid,
          'measurementid':measurementid,
          "vechileno":vechileno
        }));


    if (response.statusCode == 200) {
      print(response.body.toString());


      update();
    } else if (response.statusCode == 403) {

      var data = jsonDecode(response.body.toString());
      var errors =data['errors'] as List;

      for(int i=0; i<errors.length;i++)
      {
        Get.snackbar('Error', errors[i].toString());
      }







      ;
    }
  }
}
