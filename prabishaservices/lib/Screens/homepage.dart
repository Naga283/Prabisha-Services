import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Authentication/authentication.dart';
import 'package:prabishaservices/Screens/aboutus/aboutus.dart';
import 'package:prabishaservices/Screens/corporateMarketing.dart';
import 'package:prabishaservices/Screens/digitalMarketing.dart';
import 'package:prabishaservices/Screens/itSolutions.dart';
import 'package:prabishaservices/Screens/services.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
import 'package:prabishaservices/Screens/webiste&socialmedia/websiteSocialMedia.dart';
import 'package:url_launcher/url_launcher.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var _isChecked;
var firebaseUser = FirebaseAuth.instance.currentUser;
CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _isChecked = List<bool>.filled(ref.doc(firebaseUser?.uid).collection("Favorite").snapshots().toString().length, false);
  }
  @override
  Widget build(BuildContext context) {
    Authentication auth = Authentication();
    return Scaffold(
      body: Column(
        children: [
          TopHeader(tit: 'Our Services Offerings', cartL: [],),
         
   
 Text("Bussiness areas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         Expanded(
           child: GridView.count(crossAxisCount: 2,
           mainAxisSpacing: 10,
           childAspectRatio: (1 / 1.25),
  
           children: [
             GestureDetector(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ITSolutions()));
               },
               child: DataWidget(img: 'assests/images/Untitled design (1).png', name: 'IT Solutions', col: Color(0xFF09009B), )),
               GestureDetector(
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Services()));
                 },
                 child: DataWidget(img: 'assests/images/itServ.png', name: 'IT Services', col: Colors.orange.shade900,)),
                  GestureDetector(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DigitalMarketing()));
                    },
                    child: DataWidget(img: 'assests/images/itSolutions.png', name: 'Digital\nMarketing', col: Colors.orange.shade900,)),
               GestureDetector(
                 onTap: (){
             ref.doc(firebaseUser?.uid).collection("Corporate Branding").doc().set({
                              'favorite':false
                            }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CorporateMarketing())));
                 },
                 child: DataWidget(img: 'assests/images/2(1).png', name: 'Corporate\nBranding', col: Color(0xFF09009B),)),
          //                       GestureDetector(
          //        onTap: (){
          //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUs()));
          //        },
          //        child: DataWidget(img: 'assests/images/icon 1.png', name: 'About Us')),
          //                       GestureDetector(
          //        onTap: (){
          // launch("https://prabisha.com/blog/");
          //        },
          //        child: DataWidget(img: 'assests/images/icon 3.png', name: 'Blogs')),
          //                       GestureDetector(
          //        onTap: (){
          //          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CorporateMarketing()));
          //        },
          //        child: DataWidget(img: 'assests/images/icon 2.png', name: 'FAQs')),
          //                       GestureDetector(
          //        onTap: (){
          //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebisteSoci()));
          //        },
          //        child: DataWidget(img: 'assests/images/icon 4.png', name: 'Website & SocialMediaLinks')),
      
           ],
           ),
         ),
      //     Container(
      //       padding: EdgeInsets.only(top: 10,bottom: 10),
      //      margin: EdgeInsets.symmetric(horizontal: 10),
      //      height: 70,
      //      width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //     color: Color(0xFF09009B),
      //     borderRadius: BorderRadius.circular(25)
      //   ),
      //   child: Row(
      //     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Image.asset("assests/images/fb.png",),

      //       Image.asset("assests/images/insta.png",),
      //       Image.asset("assests/images/UT.png"),
      //       Image.asset("assests/images/twi.png"),
      //       Image.asset("assests/images/LinkedIn.png"),

      //     ],
      //   )
      // ),
      // SizedBox(height: 20,),
      //    GestureDetector(
      //      onTap: (){
      //             launch("https://prabisha.com/");
      //           },
      //      child: Container(
      //        margin: EdgeInsets.symmetric(horizontal: 10),
      //        height: 60,
      //        width: MediaQuery.of(context).size.width,
      //            decoration: BoxDecoration(
      //       color: Colors.orange.shade900,
      //       borderRadius: BorderRadius.circular(20)
      //            ),
      //            child: Center(child: Text("www.prabish.com",style: TextStyle(color: Colors.white,fontSize: 18),)),
      //          ),
      //    ),
      SizedBox(height: 20,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF09009B),
        onPressed: (){
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            height: 300,
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Text("Connect With Us",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                               Container(
            padding: EdgeInsets.only(top: 10,bottom: 10),
           margin: EdgeInsets.symmetric(horizontal: 10),
           height: 70,
           width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF09009B),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                launch("https://www.facebook.com/prabishac");
              },
              child: Image.asset("assests/images/fb.png",)),

            GestureDetector(
              onTap: (){
                launch("https://www.instagram.com/prabishac");
              },
              child: Image.asset("assests/images/insta.png",)),
            GestureDetector(
              onTap: (){
                launch("https://www.youtube.com/channel/UCUdX_mkqI2KSpn6veGLVpIA/");
              },
              child: Image.asset("assests/images/UT.png")),
            GestureDetector(
              onTap: (){
                launch("https://twitter.com/PrabishaC");
              },
              child: Image.asset("assests/images/twi.png")),
            GestureDetector(
              onTap: (){
                launch("https://www.linkedin.com/company/prabisha/");
              },
              child: Image.asset("assests/images/LinkedIn.png")),

          ],
        )
      ),
      SizedBox(height: 20,),
         GestureDetector(
           onTap: (){
                  launch("https://prabisha.com/");
                },
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             height: 60,
             width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
            color: Colors.orange.shade900,
            borderRadius: BorderRadius.circular(20)
                 ),
                 child: Center(child: Text("www.prabish.com",style: TextStyle(color: Colors.white,fontSize: 18),)),
               ),
         ),
                          ],
                        ),
          );
        });
      },
      child: Icon(Icons.web),
      ),
    );
  }
}

class DataWidget extends StatefulWidget {
  const DataWidget({
    Key? key, required this.name, required this.img, required this.col, 
  }) : super(key: key);
  final String name;
  final String img;
final Color col;

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  bool _isChecked = false;
var firebaseUser = FirebaseAuth.instance.currentUser;
CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _isChecked = List<bool>.filled(ref.doc(firebaseUser?.uid).collection("Favorite").snapshots().toString().length, false) as bool;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
         
          color: widget.col,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 18),),
                    // Icon(Icons.favorite_border,color: Colors.grey[350],)
                    FavoriteButton( isFavorite: _isChecked,
                    // iconSize: 20.0,
    valueChanged: (_isChecked) {
      print('Is Favourite $_isChecked)');
       ref.doc(firebaseUser?.uid).collection("homePage").doc().set({
                              'favorite':_isChecked
                            });
                            print(_isChecked);
      },),
                  ],
                ),
                Image.asset(widget.img,height: 130,width: 130,),
                Text("More...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10,)
              ],
            ),
        ),
          ),
        
        ),
       
      ],
    );
  }
}