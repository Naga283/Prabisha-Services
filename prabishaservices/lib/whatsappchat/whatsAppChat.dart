// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class WhatsAppChat extends StatelessWidget {
  const WhatsAppChat({Key? key}) : super(key: key);
   void launchWhatsAppUrl(number, message) async{
     String url ="https://wa.me/$number/?text=${Uri.parse(message)}";
     await canLaunch(url) ? launch(url):print("Can't Launch WhatsApp");
    }

  @override
  Widget build(BuildContext context) {
   
    return 
     GestureDetector(onTap: (){
        launchWhatsAppUrl("+919599824600", "Hello Sir");
      },child: Card(
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("WhatsAppChat",style: TextStyle(fontSize: 20),),
              Text("")
            ],
          ),
        )),)
    ;
  }
}  