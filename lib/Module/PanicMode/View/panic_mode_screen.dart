import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:societyadminapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';

class PanicModeScreen extends StatefulWidget {
  @override
  State<PanicModeScreen> createState() => _PanicModeScreenState();
}
class _PanicModeScreenState extends State<PanicModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic Mode'),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 130,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(userdetailscreen);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.warning_amber_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                      ),
                      title: Text(
                        'Fire',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hamza Khan'),
                          Text('A-block 148-A Bahira Town Isb'),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
