import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/constants.dart';

import 'package:societyadminapp/Module/AddSocietyDetail/Phases/Controller/phases_controller.dart';
import 'package:societyadminapp/Services/Shared%20Preferences/MySharedPreferences.dart';
import 'package:societyadminapp/Widgets/Loader/loader.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Routes/set_routes.dart';
import '../../../Login/Model/User.dart';
import '../Controller/society_building_controller.dart';

class SocietyBuildingScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocietyBuildingController>(
        init: SocietyBuildingController(),
        builder: (controller) {
          return Scaffold(
              floatingActionButton: IconButton(
                  padding: EdgeInsets.only(top: 85),
                  iconSize: MediaQuery.of(context).size.height * 0.065,
                  icon: SvgPicture.asset('assets/floatingbutton.svg'),
                  onPressed: () {
                    Get.offAndToNamed(addsocietybuildingscreen,
                        arguments: controller.data);

                  }),
              body: Column(
                children: [
                  MyBackButton(
                    text: 'Buildings',
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: controller.SocietyBuildingApi(
                              pid: controller.pid!,
                              token: controller.bearertoken),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                      padding:
                                          EdgeInsets.only(left: 28, right: 27),
                                      itemCount: snapshot.data.data.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 35,
                                              mainAxisSpacing: 15),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // controller.setNoOfPhases(snapshot.data.noofphases.toString());
                                        // controller.noofphases= snapshot.data.noofphases.toString();
                                        return GestureDetector(
                                          onTap: () async {
                                            User user =
                                                await MySharedPreferences
                                                    .getUserData();
                                                    print('idss');
                                                    print(snapshot.data.data[index].id);
                                                    print(snapshot.data.data[index].pid);
                                                    
                                                    
                                            Get.toNamed(societybuildingfloorsscreen,
                                                arguments: [
                                                  snapshot.data.data[index].id,
                                                  snapshot.data.data[index].pid,
                                                  user.bearerToken
                                                ]);
                                          },
                                          child: Card(
                                            elevation: 1.5,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: [
                                                          HexColor('#FFFFFF'),
                                                          HexColor('#FF9900')
                                                        ]),
                                                  ),
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/phasepic.png')),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  snapshot.data.data[index]
                                                      .societybuildingname,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,

                                                      // color: secondaryColor,

                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color:
                                                          HexColor('#FF9900')),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
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
              ));
        });
  }
}
