import 'package:flutter/material.dart';
class ImageDetailsWidget extends StatelessWidget {
  const ImageDetailsWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset("assests/images/s2.png"))),
                  Text("Sneh Rashmi,",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  Text("Managing Director",style: TextStyle(fontSize: 24),),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Description:",style: TextStyle(fontSize: 18),),
      
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Text("                           20 Years of professional corporate experience in various senior management roles while working in MNCs like Accenture, Global Indian International School, CADD Centre, Future Group, etc.Founded Prabisha Consulting Pvt. Ltd. in 2018, providing IT and Digital Marketing Solutions. Responsible for managing Day to Day Business Operations, HR Management, Admin, Finance, Legal, and Compliance activities. Providing services to 200+ Clients across the globe. Defining Strategic Vision and Mission for Prabisha Consulting Pvt. Ltd.She completed her Masters from the prestigious Jawaharlal Nehru University, New Delhi, India Graduation in Computer Science, Russian and French Studies from JNU, New Delhi, India. MBA (HR & Marketing) from WB University of Technology, Kolkata, India. Associated with the Brahma Kumaris, a prominent spiritual organization empowering woman across the globe.",style: TextStyle(
                        fontSize: 20,color: Colors.grey
                      ),textAlign: TextAlign.justify,),
                    )
                    ],
                  )
            ],
          ),
        ),
      ),
      
    );
  }
}