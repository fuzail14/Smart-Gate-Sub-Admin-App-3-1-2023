import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Module/AddEvent/Controller/add_event_controller.dart';
import 'package:societyadminapp/Widgets/My%20Button/my_button.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';

import '../../../Widgets/My Back Button/my_back_button.dart';

class AddEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
//       appBar:   PreferredSize(
//
//         preferredSize: Size.fromHeight(70.0),
//         child: AppBar(
//           elevation: 0,
//           title: Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),          child: Text(
//             'Add Event Detail',
//             style: GoogleFonts.ubuntu(
//                 fontStyle: FontStyle.normal,
//                 color: HexColor("#4D4D4D"),
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500),
//           ),
//           ),
//           leading:
//
//
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
//             child: Container(
// // width: 40,height: 40,
//               decoration: BoxDecoration(
//                   color: primaryColor, borderRadius: BorderRadius.circular(10)),
//               child: IconButton(
//                 onPressed: () {
//
//                   Get.back();
//                 },
//                 icon: Icon(Icons.arrow_back,),
//               ),
//
//             ),
//           ),
//           backgroundColor: Colors.white,
//           actions: [
//             // Padding(
//             //     padding: EdgeInsets.only(right: 20.0),
//             //     child: GestureDetector(
//             //       onTap: () {
//             //         Get.offAndToNamed(addeventsscreen,
//             //             arguments: _eventsScreenController.user);
//             //       },
//             //       child: Icon(
//             //         color: primaryColor,
//             //         Icons.add,
//             //         size: 26.0,
//             //       ),
//             //     )),
//           ],
//         ),
//       ),
      body: GetBuilder<AddEventScreenController>(
          init: AddEventScreenController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 30),
                child: SingleChildScrollView(
                  child: Column(


                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(text: 'Add Event',),
                      SizedBox(height: 20,),
                      SvgPicture.asset(
                        "assets/event_vector.svg",
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),

                      MyTextFormField(

                          fillColor: Colors.white,
                          controller: controller.eventTitleController,
                          validator: emptyStringValidator,

                          hintText: 'Enter Event Title',
                          labelText: 'Event Title',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(


                          fillColor: Colors.white,
                          controller: controller.eventDescriptionController,
                          validator: emptyStringValidator,

                          hintText: 'Enter Event Description',
                          labelText: 'Event Description',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          onTap: () {
                            controller.StartDate(context);
                          },

                          suffixIcon:SvgPicture.asset(
                              "assets/add_event_icon.svg",
                              fit: BoxFit.scaleDown

                          ),
                          fillColor: Colors.white,
                          controller: controller.eventStartDateController,
                          validator: emptyStringValidator,
                          hintText: 'Enter Event Start Date',
                          labelText: 'Start Date',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          onTap: () {
                            controller.EndDate(context);
                          },
                              suffixIcon: SvgPicture.asset(
                                  "assets/add_event_icon.svg",
                                  fit: BoxFit.scaleDown

                              ),

                          fillColor: Colors.white,
                          controller: controller.eventEndDateController,
                          validator: emptyStringValidator,

                          hintText: 'Enter Event End Date',
                          labelText: 'End Date',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      SizedBox(height:MediaQuery.of(context).size.height*0.05,),

                      MyButton(
                        width: MediaQuery.of(context).size.width*0.4,
                        elevation: 5,

                        onPressed: controller.isLoading
                            ? null
                            : () {
                                if (controller.formKey.currentState!.validate()) {
                                  controller.addEventApi(
                                      userid: controller.userdata.userid!,
                                      token: controller.userdata.bearerToken!,
                                      eventTitle:
                                          controller.eventTitleController.text,
                                      eventDescription: controller
                                          .eventDescriptionController.text,
                                      eventStartDate: controller
                                          .eventStartDateController.text,
                                      eventEndDate:
                                          controller.eventEndDateController.text);
                                } else {
                                  return null;
                                }
                              },
                        textColor: Colors.white,
                        color: primaryColor,
                        name: 'Save Event',
                        maxLines: 1,outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),

                      ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
