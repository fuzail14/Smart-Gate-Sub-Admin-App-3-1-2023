import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:societyadminapp/Module/ChatScreen/View/chat_screen.dart';
import 'package:societyadminapp/Routes/set_routes.dart';

import '../../../Constants/constants.dart';


class UserDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Users Detail Screen'),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  child: Image(
                image: AssetImage('assets/kk.webp',
                
                ),
              ),
              ),
            ),
          
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: primaryColor),

              borderRadius: BorderRadius.circular(20)
              
              ),
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Respective View Users Name',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Respective View Users Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Vehicle No',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Respective View Users Vehicle No',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CNIC',
                      style: TextStyle(
                        fontSize: 18.0,
                        
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                  
                    Text(
                      'Respective View Users CNIC',
                      style: TextStyle(
                        fontSize: 18.0,
                        

                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
     
      floatingActionButton:
          FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {Get.toNamed(chatscreen,arguments: 'View Users Name');}, child: const Icon(Icons.chat)),
    );
  }
}
