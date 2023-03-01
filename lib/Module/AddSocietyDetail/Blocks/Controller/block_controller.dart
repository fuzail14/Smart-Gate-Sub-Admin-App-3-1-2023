import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/Model/Blocks.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Login/Model/User.dart';
class BlocksController extends  GetxController
{
  var data = Get.arguments;
int? pid ;
String? bearerToken;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    pid=data[0];
    bearerToken=data[1];

  }






  Future<Blocks> blocksApi({required int pid, required String bearerToken}) async {
    print("${pid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.blocks + "/" + pid.toString()),
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