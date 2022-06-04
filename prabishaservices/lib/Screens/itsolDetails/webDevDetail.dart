import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
class ItSolMainDetail extends StatefulWidget {
  const ItSolMainDetail({ Key? key }) : super(key: key);

  @override
  State<ItSolMainDetail> createState() => _ItSolMainDetailState();
}

class _ItSolMainDetailState extends State<ItSolMainDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (() => Navigator.of(context).pop()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                       
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.arrow_back_sharp,size: 40,)),
                  ),
                  Text("Details",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
   FavoriteButton( isFavorite: false,
                                                 // iconSize: 20.0,
                                          valueChanged: (_isFavourite) {
                                            print('Is Favourite $_isFavourite)');
                                            },),
                ],
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Image.asset("assests/images/itSoImg/1(1).png",),
                    Text("Web Development",style: TextStyle(fontSize: 26,color: Colors.grey,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text("You have one chance to make a great first impression with your potential customers–and your website is one of the first things they will see. Let our web design company help create the best possible first impression for your business.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 16,),)),
  Row(
    children: [

    ],
  )

            ],
          ),
        ),
      ),
    );
  }
}