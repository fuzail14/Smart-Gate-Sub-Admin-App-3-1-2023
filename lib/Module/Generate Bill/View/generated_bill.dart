import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:societyadminapp/Constants/constants.dart';
import 'package:societyadminapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';

class GeneratedBill extends StatelessWidget {
  const GeneratedBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [

    MyTextFormField(hintText: 'Due Date', labelText: 'Due Date', onFocusedBorderColor: primaryColor,
        onEnabledBorderColor: primaryColor,onTap: (){

      },),
    MyTextFormField(hintText: 'App charges', labelText: 'App Charges', onFocusedBorderColor: primaryColor,
        onEnabledBorderColor: primaryColor,onTap: (){

      },),
    MyTextFormField(hintText: 'Tax', labelText: 'Tax', onFocusedBorderColor: primaryColor,
        onEnabledBorderColor: primaryColor,onTap: (){

      },),



    ],),);
  }
}
