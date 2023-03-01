import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/Resident.dart';
import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';

class UnVerifiedResidentController extends GetxController {
  var user = Get.arguments;
  late final User userdata;



  late final Resident resident;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    userdata = this.user;






  }

  Future<Resident> viewUnVerifiedResidentApi(
      {required int subadminid,
      required String token,
      required int status}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.unverifiedresident.toString() +
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

    if (response.statusCode == 200) {
      return Resident.fromJson(data);
    }

    return Resident.fromJson(data);
  }




}
