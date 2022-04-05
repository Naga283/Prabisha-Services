import 'package:flutter/material.dart';
import 'package:prabishaservices/Screens/aboutus/imagesData.dart';
class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                        child: Image.asset("assests/images/icon 1.png",height: 100,)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ImageDetailsWidget()));
                    },
                    child: AboutUsDetails(img: "assests/images/s2.png", name: "Sneh Rashmi", role: "Managing Director", vis: true,)),
                    AboutUsDetails(img: "assests/images/p3.jpg", name: "Pratyush Kumar", role: "Director, Global Sales & Marketing", vis: true,),
                    
                  AboutUsDetails(img: "assests/images/1.png", role: "MANAGER-CRM MARKETING", name: "Debasree Ghosh", vis: true,),
                                 AboutUsDetails(img: "assests/images/suresh.jpg", role: "GRAPHIC DESIGNER", name: "Suresh Kumar", vis: true,),
                    //              SizedBox(height: 20,),
                    // Text("Our Team",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                    // SizedBox(height: 20,),
                    //   AboutUsDetails(img: "assests/images/2.png", role: "SOCIAL MEDIA MARKETING", name: "Yaswanth", vis: false,),
                  
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUsDetails extends StatelessWidget {
  const AboutUsDetails({
    Key? key, required this.img, required this.name, required this.role, required this.vis,
  }) : super(key: key);
  final String img;
  final String name;
  final String role;
  final bool vis;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(img,height: 80,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Text(role,style: TextStyle(color: Colors.grey),)
                ],
            ),
         Visibility(
           visible: vis,
           child: Icon(Icons.arrow_forward_ios))
          ]
        ),
      ),
    );
  }
}