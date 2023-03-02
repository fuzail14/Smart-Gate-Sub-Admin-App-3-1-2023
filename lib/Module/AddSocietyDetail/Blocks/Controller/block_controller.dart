import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Model/Blocks.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/User.dart';

class BlocksController extends GetxController {
  var data = Get.arguments;
// int? pid ;
// String? bearerToken;
  late final User user;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    // pid=data[0];
    // bearerToken=data[1];

    user = data;
  }

  Future<Blocks> blocksApi(
      {required int dynamicid, required String bearerToken}) async {
    print("${dynamicid.toString()}");
    print(bearerToken);
    String? type;
    if (user.structureType == 2) {
      type = 'society';
    } else if (user.structureType == 3) {
      type = 'phase';
    }
    final response = await Http.get(
      Uri.parse(
          Api.blocks + "/" + dynamicid.toString() + "/" + type.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print(response.body);
      return Blocks.fromJson(data);
    }

    return Blocks.fromJson(data);
  }
}
