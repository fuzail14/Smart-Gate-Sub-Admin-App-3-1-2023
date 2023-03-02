import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/Controller/street_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import 'package:societyadminapp/Widgets/Empty%20List/empty_list.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../../Widgets/Loader/loader.dart';

class Street extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StreetsController>(
        init: StreetsController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(homescreen, arguments: controller.user);
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  floatingActionButton: IconButton(
                      padding: EdgeInsets.only(top: 85),
                      iconSize: MediaQuery.of(context).size.height * 0.065,
                      icon: SvgPicture.asset('assets/floatingbutton.svg'),
                      onPressed: () {
                        Get.offNamed(addstreets, arguments: controller.user);
                        // Get.offAndToNamed(addblocks,arguments: [controller.pid,controller.bearerToken]);
                      }),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Streets',
                        onTap: () {
                          Get.offNamed(homescreen, arguments: controller.user);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Expanded(
                          child: FutureBuilder(
                              future: (controller.user.structureType == 1)
                                  ? controller.streetsApi(
                                      dynamicid: controller.user.societyid!,
                                      bearerToken: controller.user.bearerToken!)
                                  : controller.streetsApi(
                                      dynamicid: 0,
                                      bearerToken:
                                          controller.user.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data != null &&
                                      snapshot.data.data.length != 0) {
                                    return ListView.builder(
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 80,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.streetid =
                                                  snapshot.data.data[index].id;
                                              print(
                                                  'street id on tap ${controller.streetid}');
                                              Get.offAndToNamed(houses,
                                                  arguments: [
                                                    controller.user,
                                                    snapshot.data.data[index].id
                                                  ]);
                                            },
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 38),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 18,
                                                        width: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: HexColor(
                                                                    '#EFEFEF')),
                                                        child: Center(
                                                          child: Text(
                                                            snapshot.data
                                                                .data[index].id
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 11,
                                                                color: HexColor(
                                                                    '#868686')),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        snapshot
                                                                .data
                                                                .data[index]
                                                                .address
                                                                .toString() +
                                                            " " +
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .iteration
                                                                .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                // color: secondaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 18,
                                                                color: HexColor(
                                                                    '#4D4D4D')),
                                                      ),
                                                      SizedBox(
                                                        width: 158,
                                                      ),
                                                      Container(
                                                        height: 21,
                                                        width: 28,
                                                        color: Color.fromRGBO(
                                                            255, 153, 0, 0.24),
                                                        child: Image(
                                                            image: AssetImage(
                                                                'assets/arrowfrwd.png')),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 18,
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return EmptyList(name: 'No Streets');
                                  }
                                } else if (snapshot.hasError) {
                                  return Icon(Icons.error_outline);
                                } else {
                                  return Loader();
                                }
                              })),
//                 MyButton(
//                     name: 'Next',
//                     onPressed: controller.isLoading
//                         ? null
//                         : () {
//                             if (controller.formkey.currentState!.validate()) {
// print(controller.myApiData);
//                             } else {
//                               return null;
//                             }
//                           })
                    ],
                  )),
            ),
          );
        });
  }
}
