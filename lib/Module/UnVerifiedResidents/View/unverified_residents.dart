import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/Controller/unverified_resident_controller.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';



class UnVerifiedResident extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnVerifiedResidentController>(
      init: UnVerifiedResidentController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: HexColor('#F5F5F5'),
          body: Column(
            children: [
              MyBackButton(
                text: 'UnVerified Resident',
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.viewUnVerifiedResidentApi(
                        subadminid: controller.userdata.userid!,
                        token: controller.userdata.bearerToken!,
                        status: 0),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.data != null &&
                            snapshot.data.data!.length != 0) {
                          return SizedBox(
                            height: 630,
                            child: ListView.builder(
                              itemBuilder: (context, index) {

                                print(snapshot.data.data[index].runtimeType);




                                return InkWell(
                                  onTap: () {
                                    Get.offNamed(residentverification,arguments: [controller.userdata,snapshot.data.data[index]]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 16, 24, 0),
                                    child: SizedBox(
                                      width: 200,
                                      height: MediaQuery.of(context).size.height*.14,
                                      child: Card(


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
                                                                  imageBaseUrl +
                                                                      snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .image
                                                                          .toString()),
                                                              fit: BoxFit.cover),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7)),
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
                                                                  .data
                                                                  .data[index]
                                                                  .firstname
                                                                  .toString() +
                                                              ' ' +
                                                              snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .lastname
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontStyle: FontStyle
                                                                  .normal,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 16,
                                                              color: HexColor(
                                                                  '#404345')),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .data[index]
                                                              .mobileno
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontStyle:
                                                                FontStyle.normal,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                            fontSize: 16,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                                child: Align(alignment: Alignment.topRight,
                                                    child: Container(decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4),
                                                        color: primaryColor),

                                                      width: MediaQuery.of(context).size.width*.2,height: MediaQuery.of(context).size.height*0.03,child: Center(child: Text('Unverified',style: GoogleFonts.ubuntu(
                                                          color:Colors.white,
                                                          fontStyle: FontStyle.normal,
                                                          letterSpacing: 0.0015,

                                                          fontWeight: FontWeight.w500),)),)),
                                              )

                                            ]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data.data.length,
                            ),
                          );
                        } else {
                          return Center(
                              child: Text(
                            'No Residents for Verification ',
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
                        return Center(
                            child: CircularProgressIndicator(
                          color: primaryColor,
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
