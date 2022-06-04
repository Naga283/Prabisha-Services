
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:prabishaservices/Screens/styles/values.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
import 'package:prabishaservices/trailCart/cart.dart';
import 'package:prabishaservices/trailCart/dish.dart';
class DigitalMarketing extends StatefulWidget {
  const DigitalMarketing({ Key? key }) : super(key: key);

  @override
  State<DigitalMarketing> createState() => _DigitalMarketingState();
}

class _DigitalMarketingState extends State<DigitalMarketing> {
  List<Values> _dishes = <Values>[];
  List<Values> _cartList =<Values>[];
  bool val = false;
  var firebaseUser = FirebaseAuth.instance.currentUser;
CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    super.initState();
    _populateDishes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
           TopHeader(tit: 'DigitalMarketing Menu', cartL: _cartList, isvisibel: true,),
           SizedBox(height: 20,),
           Text("Order Your",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               Text("DigitalMarketing",style:TextStyle(color: Colors.orange.shade900,fontWeight: FontWeight.bold,fontSize:20)),
                       Text(" here",style:TextStyle(fontWeight: FontWeight.bold,fontSize:20))
             ],
           ),
           SizedBox(height: 20,),
           Expanded(
             child: StreamBuilder(
               stream:  FirebaseFirestore.instance.collection("Users").doc(firebaseUser?.uid).collection("Cart").snapshots(),
               builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                 return GridView.count(crossAxisCount: 2,
                 childAspectRatio: (1 / 1.25),
                 // ignore: prefer_const_literals_to_create_immutables
                         
                         children: List.generate(
                           
                           _dishes.length, (index) { 
                           
                  var item = _dishes[index];

                  
                 // print("$index value:${snapshot.data!.docs[2][
                 //"Cart Item Name"].contains(item.name)}");
             
                         return Card(
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
                        Text(item.name,style: TextStyle(color: Colors.white,fontSize: 18),),
                        // Icon(Icons.favorite_border,color: Colors.grey[350],)
                          FavoriteButton( isFavorite: false,
                        // iconSize: 20.0,
                 valueChanged: (_isFavourite) {
                   print('Is Favourite $_isFavourite)');
                   },),
                      ],
                    ),
                    Image.asset(item.img,height: 100,width: 130,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("\$ 4.00 ",style: TextStyle(color: Colors.white,fontSize: 18),),
               GestureDetector(
               
                 child: Container(
                   margin: EdgeInsets.only(left: 30,),
                   padding: EdgeInsets.all(14),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: GestureDetector(child: (!_cartList.contains(item))
                        ? Icon(
                            Icons.add,
                            color: Colors.orange,
                          )
                        : Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          
                          onTap: () {
                      setState(() {
                        if (!_cartList.contains(item)){
                         // val = false;
                          print(val);
                          _cartList.add(item);
                          ref.doc(firebaseUser?.uid).collection("Cart").doc((index+12).toString()).set({
                             "Cart Item Name":item.name,
                            "Price":item.price,
                            "Check Value":val,
                            "index":index+12
                            
                          });
                          // ref.doc(firebaseUser?.uid).collection("Cart").doc(index.toString()).update({
                             
                            
                          // });

                        }
                        else{
                          _cartList.remove(item);
                          
                         print(snapshot.data!.docs[index]["Cart Item Name"].contains(item.name).toString()+snapshot.data!.docs[index]["Cart Item Name"]);
                        ref.doc(firebaseUser?.uid).collection("Cart").doc((index+12).toString()).delete().whenComplete(() => print("delted"));
                          
                        }
                          
                      });
                    },
                          ),
                 ),
               )
             ],
                    ),
                
                   
                  ],
                         ),
                     ),
                       ),
                         );}),
                 );
               }
             ),
           )
     
          ]
        ), 
      ),
    );
  }
   void _populateDishes() {
    var list = <Values>[
     Values("SEO\n", "assests/images/DigitalMarImg/1(1).png",Icon( Icons.add), 4.00),
       Values("SMO\n", "assests/images/DigitalMarImg/2(1).png",Icon( Icons.add), 4.00),
          Values("Email Mktg.\n", "assests/images/DigitalMarImg/3(1).png",Icon( Icons.add), 4.00),
             Values("PPC\n", "assests/images/DigitalMarImg/4(1).png",Icon( Icons.add), 4.00),
         Values("Influencer\nMktg", "assests/images/DigitalMarImg/5(1).png",Icon( Icons.add), 4.00),
            Values("Digital PR\n", "assests/images/DigitalMarImg/6(1).png",Icon( Icons.add), 4.00)
    ];

    setState(() {
      _dishes = list;
    });
  }
}

