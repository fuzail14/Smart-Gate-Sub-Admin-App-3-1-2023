import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../../Constants/api_routes.dart';
import '../../../Login/Model/User.dart';
import '../Model/Phases.dart';

class PhasesController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var user = Get.arguments;
  late final User userdata;
  Phases? phases;

  List<Map<String, dynamic>> myApiData = [];
  bool isLoading = false;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userdata = this.user;
  }



  Future<Phases> phasesApi({required int userid, required String token}) async {
    print("${userid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.phases + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print(response.body);
      return Phases.fromJson(data);
    }

    return Phases.fromJson(data);
  }

  addPhaseApi({
    required String bearerToken,
    required int subadminid,
    required int societyid,
    required String from,
    required String to,
  }) async {
    isLoading = true;
    update();

    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addphases));
    request.headers.addAll(headers);

    request.fields['from'] = from;
    request.fields['to'] = to;
    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      
      Get.snackbar("Phases Add Successfully", "");


      Get.offAndToNamed(phasess, arguments: userdata);

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

      Get.snackbar("Failed to Add Phases", "");
    }
  }
  
}
