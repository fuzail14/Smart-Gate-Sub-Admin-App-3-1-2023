import 'dart:convert';

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
  late final User user;

  StreetsController? streetsController;
  SocietyModel? societyModel;
  int? structuretype;
  int? streetid;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();

    // sid=data[0];
    // bid=data[1];
    // pid=data[2];
    // bearerToken=data[3];

    user = data[0];
    streetid = data[1];
    societyModel = await MySharedPreferences.getSocietyData();
    structuretype = societyModel!.structuretype;

    print('structure type ${societyModel!.structuretype}');
  }

  Future<Houses> housesApi(
      {required int dynamicid, required String bearerToken}) async {
    print("${dynamicid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.properties + "/" + dynamicid.toString() + "/" + 'street'.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print(response.body);
      return Houses.fromJson(data);
    }

    return Houses.fromJson(data);
  }
}
