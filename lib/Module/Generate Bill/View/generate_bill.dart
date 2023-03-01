import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:societyadminapp/Widgets/My%20Back%20Button/my_back_button.dart';

class GenerateBill extends StatelessWidget {
  const GenerateBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      Column(children: [

        MyBackButton(text: 'Generate Bill',),



      ],)


      ,
    );
  }
}

