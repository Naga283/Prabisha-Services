// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
class CorporateMarketing extends StatelessWidget {
  const CorporateMarketing({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
           TopHeader(tit: 'Corporate Branding Menu', cartL: [],),
           SizedBox(height: 20,),
           Text("Order Your",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           Text("Corporate Branding",style:TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold,fontSize:20)),
           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               Text("Solutions",style:TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold,fontSize:20)),
                Text(" here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
                    //   Text(" here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20))
             ],
           ),
          
           SizedBox(height: 20,),
           Expanded(
             child: GridView.count(crossAxisCount: 2,
             childAspectRatio: (1 / 1.25),
             // ignore: prefer_const_literals_to_create_immutables
             children: [
                     ITServicesPrice(name: "Logo\nDesign", img: "assests/images/corporateImg/1(1).png", ),
                    ITServicesPrice(name: "Bussiness\nCard", img: "assests/images/corporateImg/2(1).png", ),
                     ITServicesPrice(name: "Letterhead\n", img: "assests/images/corporateImg/3(1).png", ),
                      ITServicesPrice(name: "Label\nDesign", img: "assests/images/corporateImg/4(1).png", ),
                     ITServicesPrice(name: "Flyer\nDesign", img: "assests/images/corporateImg/5(1).png", ),
                      ITServicesPrice(name: "Brochure\nDesign", img: "assests/images/corporateImg/6(1).png", ),
                           ],
             ),
           )
     
          ]
        ),
      ),
    );
  }
}

class ITServicesPrice extends StatelessWidget {
  const ITServicesPrice({
    Key? key, required this.name, required this.img,  
  }) : super(key: key);
  final String name;
  final String img;


  @override
  Widget build(BuildContext context) {
     bool _isChecked = false;
var firebaseUser = FirebaseAuth.instance.currentUser;
CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
    return Column(
      children: [
        Card(
         
          color: Color(0xFF09009B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
             padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name,style: TextStyle(color: Colors.white,fontSize: 18),),
                    // Icon(Icons.favorite_border,color: Colors.grey[350],)
                     FavoriteButton( isFavorite: _isChecked,
                    // iconSize: 20.0,
    valueChanged: (_isChecked) {
      print('Is Favourite $_isChecked)');
       ref.doc(firebaseUser?.uid).collection("Corporate Branding").doc().update({
                              'favorite':_isChecked
                            });
      },),
                  ],
                ),
                Image.asset(img,height: 100,width: 130,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Text("\$ 4.00 ",style: TextStyle(color: Colors.white,fontSize: 18),),
  Container(
    margin: EdgeInsets.only(left: 30,),
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Icon(Icons.add,color: Colors.orange.shade600,size: 30,),
  )
],
                ),
               // Text("More...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
               
              ],
            ),
        ),
          ),
        
        ),
       
      ],
    );
  }
}