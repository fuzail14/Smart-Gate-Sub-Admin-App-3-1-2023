import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';

class AddSocietyBuildingController extends GetxController {
  var data = Get.arguments;
  int? pid;
  bool isLoading = false;

  String? bearerToken;
  final societyBuildingNameController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    pid = data[0];
    bearerToken = data[1];
  }

  addSocietyBuildingApi({
    required String bearerToken,
    required int pid,
    required String BuildingName,
  }) async {
    print(bearerToken);
    print(pid);
    print(BuildingName);

    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request =
        Http.MultipartRequest('POST', Uri.parse(Api.addsocietybuilding));
    request.headers.addAll(headers);
    request.fields['societybuildingname'] = BuildingName;

    request.fields['pid'] = pid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Building Addedd Successfully", "");
      Get.offAndToNamed(societybuildingscreen, arguments: [pid, bearerToken]);
    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
    } else {
      isLoading = false;
      update();

      Get.snackbar("Failed to Add Blocks", "");
    }
  }
}
