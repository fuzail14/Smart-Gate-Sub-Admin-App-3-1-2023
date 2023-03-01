import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';

class AddSocietyBuildingApartmentsController extends GetxController {
  var user = Get.arguments;
  int? fid;
  bool isLoading = false;
  String? bearerToken;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    fid = user[0];
    bearerToken = user[1];
  }

  addApartmentsApi({
    required String bearerToken,
    required int fid,
    required String from,
    required String to,
  }) async {

    print(bearerToken);
    print(fid);
    print(from);
    print(to);

    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addsocietybuildingapartments));
    request.headers.addAll(headers);
    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['societybuildingfloorid'] = fid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Apartments Add Successfully", "");
      Get.offAndToNamed(societybuildingapartmentscreen, arguments: user );

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

      Get.snackbar("Failed to Add Apartments", "");
    }
  }
}
