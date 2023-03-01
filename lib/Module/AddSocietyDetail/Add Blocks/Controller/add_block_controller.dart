import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';

class AddBlockController extends GetxController {
  var data = Get.arguments;
  int? pid;
  bool isLoading = false;
  
  String? bearerToken;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    pid = data[0];
    bearerToken = data[1];
  }

  addBlocksApi({
    required String bearerToken,
    required int pid,
    required String from,
    required String to,
  }) async {

    print(bearerToken);
    print(pid);
    print(from);
    print(to);

    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addblocks));
    request.headers.addAll(headers);
    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['pid'] = pid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Blocks Add Successfully", "");
      Get.offNamed(blocks, arguments: [pid, bearerToken]);

    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => Get.snackbar(
        "Error",
        e.toString(),
      ))
          .toList();

    } else {
      isLoading = false;
      update();

      Get.snackbar("Failed to Add Blocks", "");
    }
  }
}
