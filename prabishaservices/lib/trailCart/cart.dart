import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Payment/Payment.dart';
import 'package:prabishaservices/Screens/styles/values.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
import 'package:prabishaservices/trailCart/dish.dart';


class Cart extends StatefulWidget {
  final List<Values> _cart;
  final int len;

  Cart(this._cart, this.len);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
double pri =0.0;
  List<Values> _cart;
  CollectionReference ref =
      FirebaseFirestore.instance.collection("Users");
  var firebaseUser = FirebaseAuth.instance.currentUser;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Cart'),
      // ),
      body: Column(
        children: [
          TopHeader(tit: "Cart", cartL: [], isvisibel: false,),
          Expanded(
            child: StreamBuilder(
              stream:  FirebaseFirestore.instance.collection("Users").doc(firebaseUser?.uid).collection("Cart").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                return ListView.builder(
                    itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
                    itemBuilder: (_, index) {
                     
                 //  index = snapshot.data!.docs[index]["index"];
                       //var item = _cart[index];
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          elevation: 4.0,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                            // leading: Icon(
                            //    item.,
                            //   color: item.color,
                            // ),
                          title: Text(snapshot.data!.docs[index]["Cart Item Name"]),
                         //title:                ref.doc(firebaseUser?.uid).collection("Cart").doc(index.toString()).get().then((value) =>Text("data index${value.data()!["index"]}") );,
                            trailing: GestureDetector(
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                  //  _cart.remove(item);
                                        ref.doc(firebaseUser?.uid).collection("Cart").doc((snapshot.data!.docs[index]
                                        ["index"]).toString()).delete().whenComplete(() => print("delted"));
                                  });
                                }),
                          ),
                        ),
                      );
                      
                    });
                    
              }
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text("Price:",style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                Text("\$ "+((widget.len)*4).toString(),style:TextStyle(fontSize: 20)),
               // Payment()
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment(widget.len.toDouble())));
                }, child: Text("PAY"),
              // style: ElevatedButton.styleFrom(
              //   minimumSize: Size(150, 50)
              // ),
                ),
                
              ],
            ),
          )
          // Text(pri)
        ],
      ),
    );
   
  }
}