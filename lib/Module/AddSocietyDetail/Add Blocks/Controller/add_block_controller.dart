import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';

class AddBlockController extends GetxController {
  var data = Get.arguments;

  bool isLoading = false;
  late final User user;

  final fromController = TextEditingController();
  final toController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    // pid = data[0];
    // bearerToken = data[1];

    user = data;
  }

  addBlocksApi({
    required String bearerToken,
    required int subadminid,
    required int societyid,
    required int superadminid,
    required int dynamicid,
    required String from,
    required String to,
    required String address,
  }) async {
    print(bearerToken);

    print(from);
    print(to);

    isLoading = true;
    update();
    String? type;
    if (user.structureType == 2) {
      type = 'society';
    } else if (user.structureType == 3) {
      type = 'phase';
    }

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addblocks));
    request.headers.addAll(headers);
    request.fields['from'] = from;

    request.fields['to'] = to;
    request.fields['address'] = address;

    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['superadminid'] = superadminid.toString();
    request.fields['dynamicid'] = dynamicid.toString();
    request.fields['type'] = type!;

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Blocks Add Successfully", "");
      Get.offNamed(blocks, arguments: user);
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
