import 'dart:convert';
import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/Model/Streets.dart';
import 'package:http/http.dart' as Http;
import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';

class StreetsController extends GetxController {
  var data = Get.arguments;
  // int? bid ;
  // int? pid ;
  // String? bearerToken;
  late final User user;
  int? streetid;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    user = data;
    // bid=data[0];
    // pid=data[1];
    // bearerToken=data[2];
  }

  Future<Streets> streetsApi(
      {required int bid, required String bearerToken}) async {
    print("${bid.toString()}");
    print(bearerToken);

    final response = await Http.get(
      Uri.parse(Api.streets + "/" + bid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearerToken"
      },
    );
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print(response.body);
      return Streets.fromJson(data);
    }

    return Streets.fromJson(data);
  }
}
