import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Houses/Model/Houses.dart';

import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/SocietyModel.dart';
import '../../../Login/Model/User.dart';
import '../../Streets/Controller/street_controller.dart';

class HouseController extends GetxController {
  var data = Get.arguments;
  // int? sid ;
  // int? bid ;
  // int? pid ;
  // String? bearerToken;

  User user = User(
      structureType: 0,
      userid: 0,
      image: '',
      societyid: 0,
      subadminid: 0,
      firstName: '',
      lastName: '',
      cnic: '',
      roleId: 0,
      roleName: '',
      bearerToken: '',
      address: '',
      mobileno: '',
      fcmtoken: '',
      superadminid: 0,
      created_at: '',
      updated_at: '');

  int? structuretype;
  int streetid = 0;

  @override
  void onInit() async {
    // TODO: implement onInit

    // sid=data[0];
    // bid=data[1];
    // pid=data[2];
    // bearerToken=data[3];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      super.onInit();

      user = await MySharedPreferences.getUserData();
      structuretype = user.structureType;

      if (structuretype == 1) {
        user = data;

        print(user);
        print(data);
      } else {
        user = data[0];
        streetid = data[1];
      }
      update();
    });
  }

  Future<Houses> housesApi(
      {required int dynamicid, required String bearerToken}) async {
    String? type;
    if (user.structureType == 1) {
      type = 'house';
    } else if (user.structureType == 2) {
      type = 'street';
    }

    final response = await Http.get(
      Uri.parse(
          Api.properties + "/" + dynamicid.toString() + "/" + type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    var data = jsonDecode(response.body.toString());

    

    if (response.statusCode == 200) {
      print(response.body);
      return Houses.fromJson(data);
    }

    return Houses.fromJson(data);
  }
}
