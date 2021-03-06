// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/EmailAuthenticate/login.dart';
import 'package:prabishaservices/Screens/styles/app_defalut.dart';
import 'package:prabishaservices/Screens/styles/values.dart';
import 'package:prabishaservices/trailCart/cart.dart';

import '../EmailAuthenticate/authentication.dart';




class TopHeader extends StatefulWidget {
   TopHeader({
    Key? key, required this.tit, required this.cartL, required this.isvisibel,
  }) : super(key: key);
  final String tit;
  final List<Values> cartL;
  final bool isvisibel;

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  final globalKey = new GlobalKey<ScaffoldState>();
   final TextEditingController _controller = new TextEditingController();

  late List<dynamic> _list;
    var firebaseUser = FirebaseAuth.instance.currentUser;

  late bool _isSearching;

  String _searchText = "";

  List searchresult = [];

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }
 @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }
   void values() {
    _list = [];
    _list.add("IT Solutions");
    _list.add("IT Services");
    //_list!.add("Australian dollar");
    // _list.add("Euro");
    // _list.add("British pound");
    // _list.add("Yemeni rial");
    // _list.add("Japanese yen");
    // _list.add("Hong Kong dollar");
  }
  @override
  Widget build(BuildContext context) {
    print(_controller.text);
    // List<Values> _cartList= <Values>[];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.21,
      child: Stack(
        children: [
          /// Background and Date
          Container(
            padding: const EdgeInsets.all(AppDefaults.padding * 2),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFF09009B),
             //gradient: AppDefaults.gradient,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(
                  AppDefaults.radius * 1.4,
                ),
                bottomLeft: Radius.circular(AppDefaults.radius *1.4)
              ),
            ),
            alignment: Alignment.centerLeft,
            // This is for centering from the appbar not the whole screen
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white,size: 30,)),
                  Text(
                    widget.tit,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[350]
                    ),
                    // style: Theme.of(context).textTheme.headline4?.copyWith(
                    //     fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  Visibility(
                    visible: widget.isvisibel,
                    child: StreamBuilder(
                      stream:  FirebaseFirestore.instance.collection("Users").doc(firebaseUser?.uid).collection("Cart").snapshots(),
                      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                        return GestureDetector(
                           onTap: () {
                                    if (snapshot.data!.docs.isNotEmpty)
                        // ignore: curly_braces_in_flow_control_structures
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Cart(widget.cartL,snapshot.data!.docs.length),
                          ),
                        );
                                  },
                          child: 
                          
                            
                               Stack(
                                alignment: Alignment.topCenter,
                                children: [Icon(Icons.shopping_cart_outlined,color:Colors.grey[350]),
                                Container(
                                  color: Colors.red,
                                  child: Text("${snapshot.data?.docs.length}"),
                                            
                                )
                                ])
                            
                          
                        );
                      }
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       AuthenticationHelper()
                          .signOut()
                          .then((_) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (contex) => Login()),
                              ));
                    },
                    child: Icon(Icons.logout,color:Colors.grey[350])),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: AppDefaults.padding * 2.2,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.83,
                  child:  TextField(
                    controller: _controller,
                    onChanged: searchOperation,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      
                      hintText: "What are looking for ?",
                      prefixIcon: Icon(Icons.search,color: Colors.orange.shade900,),
                      border: InputBorder.none,
                    ),
                  ),
                ),
               
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
