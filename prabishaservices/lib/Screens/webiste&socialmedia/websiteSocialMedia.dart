import 'package:flutter/material.dart';
import 'package:prabishaservices/whatsappchat/whatsAppChat.dart';
import 'package:url_launcher/url_launcher.dart';
class WebisteSoci extends StatelessWidget {
  const WebisteSoci({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Colors.lightBlue[100],
                    child: Container(
                      
                      padding: EdgeInsets.all(40),
                      child: Image.asset("assests/images/icon 4.png",height: 100,)),
                  ),
                ),
                 SizedBox(height: 10,),
              Text("Website & SocialMedia Links",style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  launch("https://prabisha.com/");
                },
                child: WebsiteData(imag: "assests/images/icon 4.png", name: 'Prabisha Website',),
              ),
              WhatsAppChat()
          ],
        ),
      ),
    );
  }
}

class WebsiteData extends StatelessWidget {
  const WebsiteData({
    Key? key, required this.name, required this.imag,
  }) : super(key: key);
  final String name;
  final String  imag;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 2,
      child: Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imag,height: 30,),
          Text(name,style: TextStyle(fontSize: 20),),
              Text("")
       
        ],
      ),
    ),);
  }
}