import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_suitmedia/controllers/home_controller.dart';

class FirstPage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 118,
                  width: 118,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xFF99c5cd)),
                  child: Icon(
                    Icons.person_add_alt_1_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.name.value = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.grey[300]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        controller.sentence.value = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Palindrome',
                          labelStyle: TextStyle(color: Colors.grey[300]),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.sentence.value.trim().isEmpty) {
                        Get.defaultDialog(
                          buttonColor: Color(0xFF2B637B),
                          title: 'Error',
                          middleText: 'Please enter a sentence.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                        );
                      } else {
                        bool isPalindrome =
                            controller.isPalindrome(controller.sentence.value);
                        Get.defaultDialog(
                          title: 'Result',
                          middleText:
                              isPalindrome ? 'Palindrome' : 'Not Palindrome',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B637B),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Sudut melengkung
                      ),
                    ),
                    child: Text(
                      'CHECK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.name.value.trim().isEmpty) {
                        Get.defaultDialog(
                          buttonColor: Color(0xFF2B637B),
                          title: 'Error',
                          middleText: 'Please enter a name.',
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: 'OK',
                        );
                      } else {
                        Get.toNamed('/second');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B637B),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Sudut melengkung
                      ),
                    ),
                    child: Text(
                      'NEXT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
