import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';
import '../Model/SocietyBuildingFloor.dart';


class SocietyBuildingFloorsController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var user = Get.arguments;
  
  String? noofphases;
  
  int? buildingid;
  int? pid;
  var bearertoken;
  final List<TextEditingController> fromController = [];
  final List<TextEditingController> toController = [];
  List<Map<String, dynamic>> myApiData = [];
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    buildingid = user[0];
    
    pid = user[1];

    bearertoken = user[2];
  }
  

  Future<SocietyBuildingFloor> FloorsApi({required buildingid, required token}) async {
    print("${buildingid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewsocietybuildingfloors + "/" + buildingid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      
      return SocietyBuildingFloor.fromJson(data);
    }

    return SocietyBuildingFloor.fromJson(data);
  }
}
