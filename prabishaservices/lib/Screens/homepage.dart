import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
bool _isVertical = false;
IconData? _selectedIcon;
var firebaseUser = FirebaseAuth.instance.currentUser;
CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
  
  //search bar options
  void searchbar(String searchText){

  }
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
      appBar: AppBar(elevation: 0,
      backgroundColor: Colors.white24,
      iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
      //  backgroundColor: Colors.red,
      ),
      body: Column( 
        children: [  
         // TopHeader(tit: 'Our Services Offerings', cartL: [], isvisibel: true,),
         SizedBox(height: 10,),
       
       Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("Hi Naga",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         SizedBox(height: 5,),
         Text("Find What You Want",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
       ],
       ),
       SizedBox(height: 20,),
      
         Expanded(
           child: GridView.count(crossAxisCount: 2,
          // mainAxisSpacing: 2,
           //childAspectRatio: (1 / 1.25),
      
           children: [
             GestureDetector(
               onTap: (){
                 
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ITSolutions()));
               },
               child: DataWidget(img: 'assests/images/Untitled design (1).png', name: 'IT Solutions', col: Color(0XFF9710FB), col1:     Color(0XFF9772FB), )),
               GestureDetector(  
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Services(search: '',)));
                 },
                 child: DataWidget(img: 'assests/images/itServ.png', name: 'IT Services', col: Color(0XFFFF5080), col1:     Color(0XFFFF8080),)),
                  GestureDetector(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DigitalMarketing()));
                    },
                    child: DataWidget(img: 'assests/images/itSolutions.png', name: 'Digital\nMarketing', col: Color(0XFF00FFC6), col1:    Color(0XFF88F5C6),)),
               GestureDetector(
                 onTap: (){
             ref.doc(firebaseUser?.uid).collection("Corporate Branding").doc().set({
                              'favorite':false
                            }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CorporateMarketing())));
                 },
                 child: DataWidget(img: 'assests/images/2(1).png', name: 'Corporate\nBranding', col: Color(0xFF5EE0CB), col1:     Color(0XFF1EE5EB),)),
       
      
           ],
           ),
         ),
      
    //  SizedBox(height: 20,),
       Text("Best Services",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey)),
       Container(
        
         margin: EdgeInsets.only(left: 20,right:20,bottom: 30),
         child: Card(
           margin: EdgeInsets.only(top: 20),
           
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
           elevation: 5,
           child: Container(
             padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
             child: Row(
               children:[
                 Image.asset("assests/images/itSoImg/1(1).png",height: 100,width: 100,),
                 Container(
                   margin: EdgeInsets.only(left: 30),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Web Design \n& Development",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo[600]),),
                       Text("Complete website"),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              unratedColor: Colors.amber.withAlpha(50),
                              direction: _isVertical ? Axis.vertical : Axis.horizontal,
                            ),
                            Text("20 Review")
                         ],
                       ),
                       Text("\$ : 4",style: TextStyle(fontSize: 20,color: Colors.indigo),)
                     ],
                   ),
                 )
               ]
             ),
           ),
         ),
       )
      
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Color(0xFF09009B),
      //   onPressed: (){
      //   showModalBottomSheet(context: context, builder: (context){
      //     return Container(
      //       height: 300,
      //                   padding: EdgeInsets.only(top: 40),
      //                   child: Column(
      //                     children: [
      //                       Text("Connect With Us",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 20,),
      //                          Container(
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
      //       GestureDetector(
      //         onTap: (){
      //           launch("https://www.facebook.com/prabishac");
      //         },
      //         child: Image.asset("assests/images/fb.png",)),

      //       GestureDetector(
      //         onTap: (){
      //           launch("https://www.instagram.com/prabishac");
      //         },
      //         child: Image.asset("assests/images/insta.png",)),
      //       GestureDetector(
      //         onTap: (){
      //           launch("https://www.youtube.com/channel/UCUdX_mkqI2KSpn6veGLVpIA/");
      //         },
      //         child: Image.asset("assests/images/UT.png")),
      //       GestureDetector(
      //         onTap: (){
      //           launch("https://twitter.com/PrabishaC");
      //         },
      //         child: Image.asset("assests/images/twi.png")),
      //       GestureDetector(
      //         onTap: (){
      //           launch("https://www.linkedin.com/company/prabisha/");
      //         },
      //         child: Image.asset("assests/images/LinkedIn.png")),

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
      //            child: Center(child: Text("WWW.Prabisha.com",style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 2)),),
      //          ),
      //    ),
      //                     ],
      //                   ),
      //     );
      //   });
      // },
      // child: Icon(Icons.web),
      // ),
    );
  }
}

class DataWidget extends StatefulWidget {
  const DataWidget({
    Key? key, required this.name, required this.img, required this.col, required this.col1, 
  }) : super(key: key);
  final String name;
  final String img;
final Color col;
final Color col1;

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
        Container(
          
          child: Card(
           
           // color: widget.col,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            elevation: 2,
            child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(gradient: LinearGradient(colors:[
        widget.col1,
              widget.col
                  ] ),
                  borderRadius: BorderRadius.circular(30)
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
            
                    Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 18),),
                    // Icon(Icons.favorite_border,color: Colors.grey[350],)
    //                 FavoriteButton( isFavorite: _isChecked,
    //                 // iconSize: 20.0,
    // valueChanged: (_isChecked) {
    //   print('Is Favourite $_isChecked)');
    //   //  ref.doc(firebaseUser?.uid).collection("homePage").doc().set({
    //   //                         'favorite':_isChecked
    //   //                       });
    //                         print(_isChecked);
    //   },),
                  ],
                ),
                Image.asset(widget.img,height: 130,width: 130,),
                // Text("More...",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                // SizedBox(height: 10,)
              ],
            ),
          ),
          
          ),
        ),
       
      ],
    );
  }
}