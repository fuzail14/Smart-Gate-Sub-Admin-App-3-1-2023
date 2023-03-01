import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Model/Resident%20Model/Resident.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20Text/my_text.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/resident_verification_controller.dart';

class ResidentVerification extends GetView {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ResidentVerificationController>(
            init: ResidentVerificationController(),
            builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyBackButton(
                      text: 'Resident Verification',
                      onTap: () {
                        Get.offNamed(unverifiedresident,
                            arguments: controller.userdata);
                      },
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      width: 180,
                                      height: 180,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(imageBaseUrl +
                                                  controller.resident.image
                                                      .toString()))),
                                    ),
                                  ),
                                  MyText(name: 'Name'),
                                  MyText(
                                    name: controller.resident.firstname
                                            .toString() +
                                        "" +
                                        controller.resident.lastname.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'Cnic'),
                                  MyText(
                                    name: controller.resident.cnic.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'Mobile no'),
                                  MyText(
                                    name:
                                        controller.resident.mobileno.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'Country'),
                                  MyText(
                                    name: controller.country.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'State'),
                                  MyText(
                                    name: controller.resident.state.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'City'),
                                  MyText(
                                    name: controller.resident.city.toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'Residental Type'),
                                  MyText(
                                    name: controller.resident.residenttype
                                        .toString(),
                                    color: Colors.grey,
                                  ),
                                  MyText(name: 'Phase'),
                                  DropdownSearch<Phase>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllPhasesApi(
                                          societyid:
                                              controller.userdata.societyid!,
                                          bearerToken:
                                              controller.userdata.bearerToken);
                                    },
                                    onChanged: (Phase? data) {
                                      controller.SelectedPhase(data);
                                    },
                                    selectedItem: controller.phases,
                                    itemAsString: (Phase p) {
                                      return p.name.toString();
                                    },
                                  ),
                                  MyText(name: 'Block'),
                                  DropdownSearch<Block>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllBlocksApi(
                                          phaseid: controller.phases?.id,
                                          bearertoken:
                                              controller.userdata.bearerToken);
                                    },
                                    onChanged: (Block? data) {
                                      controller.SelectedBlock(data);
                                    },
                                    selectedItem: controller.blocks,
                                    itemAsString: (Block p) {
                                      return p.name.toString();
                                    },
                                  ),
                                  MyText(name: 'Street'),
                                  DropdownSearch<Street>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllStreetsApi(
                                          blockid: controller.blocks?.id,
                                          bearerToken:
                                              controller.userdata.bearerToken);
                                    },
                                    onChanged: (Street? data) {
                                      controller.SelectedStreet(data);
                                    },
                                    selectedItem: controller.streets,
                                    itemAsString: (Street p) {
                                      return p.name.toString();
                                    },
                                  ),
                                  MyText(name: 'House'),
                                  DropdownSearch<Property>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller.viewAllHousesApi(
                                          streetid: controller.streets?.id,
                                          bearerToken:
                                              controller.userdata.bearerToken);
                                    },
                                    onChanged: (Property? data) {
                                      controller.SelectedHouse(data);

                                      controller.houseaddressdetailController
                                          .text = data!.address.toString();
                                      // controller.isPropertyHouseApartment();
                                    },
                                    selectedItem: controller.houses,
                                    itemAsString: (Property p) {
                                      return p.address.toString();
                                    },
                                  ),
                                  MyText(name: 'Area'),
                                  DropdownSearch<Measurement>(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    asyncItems: (String filter) async {
                                      print(filter);
                                      return controller
                                          .housesApartmentsModelApi(
                                              subadminid: controller
                                                  .phases!.subadminid!,
                                              token: controller
                                                  .userdata!.bearerToken!,
                                              type: 'house');
                                    },
                                    onChanged: (Measurement? data) {
                                      controller.SelectedMeasurement(data);
                                    },
                                    selectedItem: controller.measurements,
                                    itemAsString: (Measurement p) {
                                      return p.area.toString() +
                                          ' ' +
                                          p.unit.toString();
                                    },
                                  ),
                                  MyText(name: 'Vechile Number'),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextFormField(
                                      controller:
                                          controller.vehiclenoController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white70,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: 'Vehicle Number',
                                          hintStyle: TextStyle(
                                            decorationStyle:
                                                TextDecorationStyle.dashed,
                                          )),
                                    ),
                                  ),
                                  Center(
                                    child: MyButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          controller.verifyResidentApi(
                                              residentid: controller
                                                  .resident.residentid,
                                              status: 1,
                                              token: controller
                                                  .userdata.bearerToken!,
                                              bid: controller.blocks!.id!,
                                              measurementid:
                                                  controller.measurements!.id,
                                              pid: controller.phases!.id!,
                                              propertyid:
                                                  controller.houses!.id!,
                                              sid: controller.streets!.id!,
                                              vechileno: controller
                                                  .vehiclenoController.text);
                                          Get.offNamed(unverifiedresident,
                                              arguments: controller.userdata);
                                        }
                                      },
                                      name: 'Verify',
                                      color: Colors.green,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
