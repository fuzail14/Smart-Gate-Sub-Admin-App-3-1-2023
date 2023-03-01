import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../AddSocietyDetail/Phases/Model/Phases.dart';
import '../../Login/Model/SocietyModel.dart';
import '../../Login/Model/User.dart';
import '../../UnVerifiedResidents/Model/Resident Model/Resident.dart';

import '../Model/myapimodel.dart';

class HomeScreenController extends GetxController {
  late final User user;
  var userdata = Get.arguments;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  PhasesList? selectedItem;
  StreamController<int> countStream = StreamController<int>();
  SocietyModel? societyModel;

  //  Phases? selectedItem;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    user = userdata;
    societyModel = await MySharedPreferences.getSocietyData();
    print('structre type ${societyModel!.structuretype}');
  }

  viewUnVerifiedResidentCountApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedresidentcount.toString() +
          '/' +
          subadminid.toString() +
          '/' +
          status.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    print(data['data']);

    if (response.statusCode == 200) {
      return data['data'];
    }

    return data['data'];
  }
}
