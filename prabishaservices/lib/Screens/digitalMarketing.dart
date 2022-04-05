// ignore_for_file: prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
class DigitalMarketing extends StatelessWidget {
  const DigitalMarketing({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
           TopHeader(tit: 'Digital Marketing Menu', cartL: [],),
           SizedBox(height: 20,),
           Text("Order Your",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               Text("Digital Marketing",style:TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold,fontSize:20)),
                    //   Text(" here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20))
             ],
           ),
           Text("Services here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
           SizedBox(height: 20,),
           Expanded(
             child: GridView.count(crossAxisCount: 2,
             childAspectRatio: (1 / 1.25),
             // ignore: prefer_const_literals_to_create_immutables
             children: [
                     ITServicesPrice(name: "SEO\n", img: "assests/images/DigitalMarImg/1(1).png", ),
                    ITServicesPrice(name: "SMO\n", img: "assests/images/DigitalMarImg/2(1).png", ),
                     ITServicesPrice(name: "Email Mktg.\n", img: "assests/images/DigitalMarImg/3(1).png", ),
                      ITServicesPrice(name: "PPC\n", img: "assests/images/DigitalMarImg/4(1).png", ),
                     ITServicesPrice(name: "Influencer\nMktg.", img: "assests/images/DigitalMarImg/5(1).png", ),
                      ITServicesPrice(name: "Digital PR\n", img: "assests/images/DigitalMarImg/6(1).png", ),
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
                     FavoriteButton( isFavorite: false,
                    // iconSize: 20.0,
    valueChanged: (_isFavourite) {
      print('Is Favourite $_isFavourite)');
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