import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:image_picker/image_picker.dart';


import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/update_gate_keeper_controller.dart';

class UpdateGateKepeerScreen extends StatefulWidget {
  @override
  State<UpdateGateKepeerScreen> createState() => _UpdateGateKepeerScreenState();
}

class _UpdateGateKepeerScreenState extends State<UpdateGateKepeerScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<UpdateGateKeeperController>(
          init: UpdateGateKeeperController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(text: 'Update Gatekeeper Details',),
                      SizedBox(height: 30,),
                      Stack(
                        children: <Widget>[
                          FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.white,
                              backgroundImage: controller.imageFile == null
                                  ? NetworkImage(imageBaseUrl +
                                  controller.gatekeeper.image.toString())
                              as ImageProvider
                                  : FileImage(
                                File(controller.imageFile!.path),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70,
                            top: 70,
                            child: InkWell(
                              onTap: () {

                                showModalBottomSheet(
                                    context: this.context,
                                    builder: (context) {
                                      return Container(
                                        height: 100.0,
                                        width: MediaQuery.of(this.context)
                                            .size
                                            .width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Choose Profile Photo',
                                              style: TextStyle(fontSize: 20),
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                ElevatedButton.icon(
                                                  style:
                                                  ElevatedButton.styleFrom(
                                                      primary:
                                                      primaryColor),
                                                  icon: Icon(Icons.camera),
                                                  onPressed: () {
                                                    controller.getFromCamera(
                                                        ImageSource.camera);
                                                  },
                                                  label: Text('Camera'),
                                                ),
                                                ElevatedButton.icon(
                                                  style:
                                                  ElevatedButton.styleFrom(
                                                      primary:
                                                      primaryColor),
                                                  icon: Icon(Icons.image),
                                                  onPressed: () {
                                                    controller.getFromGallery(
                                                        ImageSource.gallery);
                                                  },
                                                  label: Text('Gallery'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: primaryColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      MyTextFormField(
                          controller: controller.fnameController,
                          validator: emptyStringValidator,
                          hintText: 'First Name',
                          labelText: 'Enter First Name',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          controller: controller.lnameController,
                          validator: emptyStringValidator,
                          hintText: 'Last Name',
                          labelText: 'Enter Last Name',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          controller: controller.mobilenoController,
                          validator: emptyStringValidator,
                          hintText: 'Mobile NO',
                          labelText: 'Enter Mobile No',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          controller: controller.addressController,
                          validator: emptyStringValidator,
                          hintText: 'Address ',
                          labelText: 'Enter Address',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      MyTextFormField(
                          controller: controller.gatenoController,
                          validator: emptyStringValidator,
                          hintText: 'Gate No ',
                          labelText: 'Enter Gate No',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),


                      MyPasswordTextFormField(
                        controller: controller.passwordController,
                        onFocusedBorderColor: primaryColor,
                        onEnabledBorderColor: primaryColor,
                        obscureText: controller.isHidden,
                        togglePasswordView: controller.togglePasswordView,
                        labelTextColor: primaryColor,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),


                      MyButton(


                        onPressed: controller.isLoading
                            ? null
                            : () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.formKey.currentState!
                                .validate()) {
                              // if (controller.imageFile == null) {
                              //   Get.snackbar(
                              //       'error', 'Please Select An Image');
                              // } else {

                              controller.updateGatekeeperApi(
                                  gatekeeperid:
                                  controller.gatekeeper.id!,
                                  gatekeeperfirstname:
                                  controller.fnameController.text,
                                  gatekeeperlastname:
                                  controller.lnameController.text,
                                  gatekeepergateno: controller
                                      .gatenoController.text,
                                  gatekeepermobileno:
                                  controller.mobilenoController.text,
                                  gatekeeperaddress:
                                  controller.addressController.text,
                                  gatekeeperpassword:
                                  controller.passwordController.text,
                                  image: controller.imageFile,
                                  bearerToken: controller.user.bearerToken!);


                            }
                          }},

                        color: primaryColor,
                        name: 'Save',
                        outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),

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
