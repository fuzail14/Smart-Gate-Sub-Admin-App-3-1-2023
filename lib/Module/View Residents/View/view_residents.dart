import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/api_routes.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../Constants/constants.dart';
import '../Controller/view_residents_controller.dart';

class ViewResidents extends GetView {
  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<ViewResidentController>(
      init: ViewResidentController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          body:    Column(
            children: [
              MyBackButton(text: 'Residents',),
              Expanded(
                child: FutureBuilder(
                    future: controller.viewResidentsApi(
                        controller.userdata.userid!,
                        controller.userdata.bearerToken!),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null && snapshot.data!.length != 0) {
                          return SizedBox(height: 630  ,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            elevation: 0,
                                            child: Container(
                                              width: 630,
                                              height: (snapshot.data![index].residenttype=='Owner')? 450:630,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      40)),
                                              child: Stack(
                                                children: [
                                                  //Name And Number
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            top: 22,
                                                            left: 99),
                                                        child: Text(
                                                          snapshot
                                                              .data![
                                                          index]
                                                              .firstname +
                                                              " " +
                                                              snapshot
                                                                  .data![
                                                              index]
                                                                  .lastname,
                                                          style: GoogleFonts.montserrat(
                                                              color: HexColor(
                                                                  '#262626'),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            top: 12,
                                                            left: 99),
                                                        child: Text(
                                                          snapshot
                                                              .data![index]
                                                              .mobileno,
                                                          style: GoogleFonts.montserrat(
                                                              color: HexColor(
                                                                  '#262626'),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //Address
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                20,
                                                                100,
                                                                0,
                                                                0),
                                                            child:
                                                            SvgPicture
                                                                .asset(
                                                              'assets/ellipse_icon.svg',
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                10,
                                                                100,
                                                                0,
                                                                0),
                                                            child: Text(
                                                              "Address",
                                                              style: GoogleFonts.montserrat(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .fromLTRB(
                                                            50,
                                                            10,
                                                            0,
                                                            0),
                                                        child: Text(
                                                          snapshot
                                                              .data![index]
                                                              .address,
                                                          style: GoogleFonts.montserrat(
                                                              fontSize: 16,
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  //Other Detail
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        20,
                                                                        230,
                                                                        0,
                                                                        0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/ellipse_icon.svg',
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        5,
                                                                        230,
                                                                        0,
                                                                        0),
                                                                    child:
                                                                    Text(
                                                                      "Residental Type",
                                                                      style: GoogleFonts.montserrat(
                                                                          color: HexColor('#4D4D4D'),
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    39,
                                                                    20,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                  index]
                                                                      .residenttype,
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                      16,
                                                                      color: HexColor(
                                                                          '#1A1A1A'),
                                                                      fontWeight:
                                                                      FontWeight.w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        20,
                                                                        230,
                                                                        0,
                                                                        0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/ellipse_icon.svg',
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.fromLTRB(
                                                                        5,
                                                                        230,
                                                                        0,
                                                                        0),
                                                                    child:
                                                                    Text(
                                                                      "Property Type",
                                                                      style: GoogleFonts.montserrat(
                                                                          color: HexColor('#4D4D4D'),
                                                                          fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    39,
                                                                    20,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                  index]
                                                                      .propertytype,
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                      16,
                                                                      color: HexColor(
                                                                          '#1A1A1A'),
                                                                      fontWeight:
                                                                      FontWeight.w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),

                                                      //VEHICLE NO
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    20,
                                                                    10,
                                                                    0,
                                                                    0),
                                                                child: SvgPicture
                                                                    .asset(
                                                                  'assets/ellipse_icon.svg',
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    10,
                                                                    10,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  "Vehicle No",
                                                                  style: GoogleFonts.montserrat(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontWeight:
                                                                      FontWeight.bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                50,
                                                                10,
                                                                0,
                                                                0),
                                                            child: Text(
                                                              snapshot
                                                                  .data![
                                                              index]
                                                                  .vechileno,
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                  16,
                                                                  color: HexColor(
                                                                      '#1A1A1A'),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      //CNIC
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    20,
                                                                    10,
                                                                    0,
                                                                    0),
                                                                child: SvgPicture
                                                                    .asset(
                                                                  'assets/ellipse_icon.svg',
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.fromLTRB(
                                                                    10,
                                                                    10,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  "Cnic",
                                                                  style: GoogleFonts.montserrat(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontWeight:
                                                                      FontWeight.bold),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                50,
                                                                10,
                                                                0,
                                                                0),
                                                            child: Text(
                                                              snapshot
                                                                  .data![
                                                              index]
                                                                  .cnic,
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize:
                                                                  16,
                                                                  color: HexColor(
                                                                      '#1A1A1A'),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  // (snapshot.data![index]
                                                  //     .residenttype ==
                                                  //     'Owner')
                                                  //     ? Container()
                                                  //     : Padding(
                                                  //   padding:
                                                  //   const EdgeInsets
                                                  //       .fromLTRB(
                                                  //       10,
                                                  //       420,
                                                  //       0,
                                                  //       0),
                                                  //   child: Column(
                                                  //     crossAxisAlignment:
                                                  //     CrossAxisAlignment
                                                  //         .start,
                                                  //     children: [
                                                  //       Center(
                                                  //         child: Text(
                                                  //           'Owner Detail',
                                                  //           style: GoogleFonts.montserrat(
                                                  //               color: HexColor(
                                                  //                   '#4D4D4D'),
                                                  //               fontWeight:
                                                  //               FontWeight.bold),
                                                  //         ),
                                                  //       ),
                                                  //       SizedBox(
                                                  //         height:
                                                  //         11.96,
                                                  //       ),
                                                  //       Column(
                                                  //         crossAxisAlignment:
                                                  //         CrossAxisAlignment
                                                  //             .start,
                                                  //         children: [
                                                  //           Row(
                                                  //             children: [
                                                  //               Column(
                                                  //                 crossAxisAlignment:
                                                  //                 CrossAxisAlignment.start,
                                                  //                 children: [
                                                  //                   Row(
                                                  //                     children: [
                                                  //                       Padding(
                                                  //                         padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  //                         child: SvgPicture.asset(
                                                  //                           'assets/ellipse_icon.svg',
                                                  //                         ),
                                                  //                       ),
                                                  //                       Padding(
                                                  //                         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  //                         child: Text(
                                                  //                           "Full Name",
                                                  //                           style: GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.bold),
                                                  //                         ),
                                                  //                       ),
                                                  //                     ],
                                                  //                   ),
                                                  //                   // Padding(
                                                  //                   //   padding: const EdgeInsets.fromLTRB(39, 5, 0, 0),
                                                  //                   //   child: Text(
                                                  //                   //     snapshot.data![index].ownername,
                                                  //                   //     style: GoogleFonts.montserrat(fontSize: 16, color: HexColor('#1A1A1A'), fontWeight: FontWeight.w400),
                                                  //                   //     maxLines: 1,
                                                  //                   //   ),
                                                  //                   // ),
                                                  //                 ],
                                                  //               ),
                                                  //
                                                  //             ],
                                                  //           ),
                                                  //           // Column(
                                                  //           //   crossAxisAlignment:
                                                  //           //   CrossAxisAlignment.start,
                                                  //           //   children: [
                                                  //           //     Row(
                                                  //           //       children: [
                                                  //           //         Padding(
                                                  //           //           padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  //           //           child: SvgPicture.asset(
                                                  //           //             'assets/ellipse_icon.svg',
                                                  //           //           ),
                                                  //           //         ),
                                                  //           //         Padding(
                                                  //           //           padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  //           //           child: Text(
                                                  //           //             "Owner Mobile No",
                                                  //           //             style: GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.bold),
                                                  //           //           ),
                                                  //           //         ),
                                                  //           //       ],
                                                  //           //     ),
                                                  //           //     Padding(
                                                  //           //       padding: const EdgeInsets.fromLTRB(
                                                  //           //           39,
                                                  //           //           5,
                                                  //           //           0,
                                                  //           //           0),
                                                  //           //       child:
                                                  //           //       Text(
                                                  //           //         snapshot.data![index].ownermobileno,
                                                  //           //         style: GoogleFonts.montserrat(fontSize: 16, color: HexColor('#1A1A1A'), fontWeight: FontWeight.w400),
                                                  //           //       ),
                                                  //           //     ),
                                                  //           //   ],
                                                  //           // ),
                                                  //
                                                  //           // Column(
                                                  //           //   crossAxisAlignment:
                                                  //           //   CrossAxisAlignment.start,
                                                  //           //   children: [
                                                  //           //     Row(
                                                  //           //       children: [
                                                  //           //         Padding(
                                                  //           //           padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                  //           //           child: SvgPicture.asset(
                                                  //           //             'assets/ellipse_icon.svg',
                                                  //           //           ),
                                                  //           //         ),
                                                  //           //         Padding(
                                                  //           //           padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  //           //           child: Text(
                                                  //           //             "Owner Address",
                                                  //           //             style: GoogleFonts.montserrat(color: HexColor('#4D4D4D'), fontWeight: FontWeight.bold),
                                                  //           //           ),
                                                  //           //         ),
                                                  //           //       ],
                                                  //           //     ),
                                                  //           //     Padding(
                                                  //           //       padding: const EdgeInsets.fromLTRB(
                                                  //           //           39,
                                                  //           //           5,
                                                  //           //           0,
                                                  //           //           0),
                                                  //           //       child:
                                                  //           //       Text(
                                                  //           //         snapshot.data![index].owneraddress,
                                                  //           //         style: GoogleFonts.montserrat(fontSize: 16, color: HexColor('#1A1A1A'), fontWeight: FontWeight.w400),
                                                  //           //       ),
                                                  //           //     ),
                                                  //           //   ],
                                                  //           // ),
                                                  //
                                                  //         ],
                                                  //       ),
                                                  //     ],
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            ),
                                          );
                                        });

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24,16,24,0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/cardbackground.jpeg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(17),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                189, 224, 224, 223),
                                            spreadRadius: 5,

                                            blurRadius: 9,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: HexColor('#FFFFFF'),
                                      ),
                                      height: 120,
                                      child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 14, left: 8),
                                                  child: Container(
                                                    width: 70.4,
                                                    height: 64,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                imageBaseUrl+    snapshot
                                                                    .data![
                                                                index]
                                                                    .image
                                                                    .toString()),
                                                            fit: BoxFit
                                                                .cover),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            7)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 18),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        snapshot
                                                            .data![
                                                        index]
                                                            .firstname
                                                            .toString() +
                                                            " " +
                                                            snapshot
                                                                .data![
                                                            index]
                                                                .lastname
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontStyle:
                                                            FontStyle
                                                                .normal,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontSize: 16,
                                                            color: HexColor(
                                                                '#404345')),
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data![index]
                                                            .mobileno
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontStyle:
                                                          FontStyle
                                                              .normal,
                                                          fontWeight:
                                                          FontWeight
                                                              .w200,
                                                          fontSize: 16,
                                                        ),
                                                        overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding:
                                            //   EdgeInsets.only(top: 2),
                                            //   child: Row(children: [
                                            //     Padding(
                                            //       padding: EdgeInsets.only(
                                            //           left: 293),
                                            //       child: Container(
                                            //         height: MediaQuery.of(
                                            //             context)
                                            //             .size
                                            //             .height *
                                            //             0.035,
                                            //         width: MediaQuery.of(
                                            //             context)
                                            //             .size
                                            //             .width *
                                            //             0.070,
                                            //         decoration: BoxDecoration(
                                            //             borderRadius:
                                            //             BorderRadius
                                            //                 .circular(
                                            //                 10),
                                            //             color:
                                            //             primaryColor),
                                            //         child: IconButton(
                                            //           icon: SvgPicture
                                            //               .asset(
                                            //
                                            //             'assets/delete_noticboard_icon.svg',color: Colors.white,
                                            //           ),
                                            //           onPressed: () {
                                            //             controller.DeleteResidentsApi(   snapshot.data![index].residentid, controller.userdata.bearerToken!);
                                            //           },
                                            //         ),
                                            //       ),
                                            //     ),
                                            //     SizedBox(
                                            //       width: 6,
                                            //     ),
                                            //     Container(
                                            //       height:
                                            //       MediaQuery.of(context)
                                            //           .size
                                            //           .height *
                                            //           0.035,
                                            //       width:
                                            //       MediaQuery.of(context)
                                            //           .size
                                            //           .width *
                                            //           0.070,
                                            //       decoration: BoxDecoration(
                                            //           borderRadius:
                                            //           BorderRadius
                                            //               .circular(10),
                                            //           color: primaryColor),
                                            //       child: IconButton(
                                            //         icon: SvgPicture
                                            //             .asset(
                                            //
                                            //           'assets/edit_icon.svg',
                                            //         ),
                                            //         onPressed: () {
                                            //           Get.offAndToNamed(
                                            //               updateresidentdetails,
                                            //               arguments: [
                                            //                 snapshot.data![
                                            //                 index],
                                            //                 controller
                                            //                     .userdata
                                            //               ]);
                                            //         },
                                            //       ),
                                            //     ),
                                            //   ]),
                                            // ),
                                          ]),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            ),
                          );
                        } else {
                          return Center(
                              child: Text(
                                'No Residents',
                                style: GoogleFonts.ubuntu(
                                    color: HexColor('#404345'),
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.0015,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ));
                        }
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Center(child: CircularProgressIndicator(color: primaryColor,));
                      }
                    }),
              ),
            ],
          ),
          // floatingActionButton: IconButton(
          //     padding: EdgeInsets.only(top: 85),
          //     iconSize: MediaQuery.of(context).size.height * 0.065,
          //     icon: SvgPicture.asset('assets/floatingbutton.svg'),
          //     onPressed: () {
          //       Get.offAndToNamed(addresident, arguments: controller.user);
          //     }),   // floatingActionButton: IconButton(
          //     padding: EdgeInsets.only(top: 85),
          //     iconSize: MediaQuery.of(context).size.height * 0.065,
          //     icon: SvgPicture.asset('assets/floatingbutton.svg'),
          //     onPressed: () {
          //       Get.offAndToNamed(addresident, arguments: controller.user);
          //     }),
        ),
      ),
    );
  }
}