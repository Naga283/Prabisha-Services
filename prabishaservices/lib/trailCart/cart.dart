import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/Screens/styles/values.dart';
import 'package:prabishaservices/trailCart/dish.dart';


class Cart extends StatefulWidget {
  final List<Values> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
var pri;
  List<Values> _cart;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:  FirebaseFirestore.instance.collection("Users").doc(firebaseUser?.uid).collection("Cart").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                return ListView.builder(
                    itemCount: snapshot.hasData?snapshot.data!.docs.length:0,
                    itemBuilder: (_, index) {
                      // var pric = snapshot.data!.docs[index]["Price"];
                      // pri = pric;
                      // var item = _cart[index];
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
                            trailing: GestureDetector(
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                   // _cart.remove(item);
                                  });
                                }),
                          ),
                        ),
                      );
                    });
              }
            ),
          ),
          // Text(pri)
        ],
      ),
    );
  }
}