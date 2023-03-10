import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/User.dart';
import '../Model/society_building_model.dart';

class SocietyBuildingController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var data = Get.arguments;

  late final User user;

  SocietyBuilding? societyBuilding;

  bool isLoading = false;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    user = data;

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   super.onInit();

    //   user = await MySharedPreferences.getUserData();

    //   if (user.structureType == 1) {
    //     user = data;

    //   } else {
    //     user = data[0];
    //     blockid = data[1];
    //     print('dataaaaa');
    //     print(blockid);
    //   }

    //   update();
    // });
  }

  Future<SocietyBuilding> SocietyBuildingApi(
      {required int dynamicid, required String token}) async {
    print("${dynamicid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.societybuildings + "/" + dynamicid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body);

      return SocietyBuilding.fromJson(data);
    }

    return SocietyBuilding.fromJson(data);
  }
}
