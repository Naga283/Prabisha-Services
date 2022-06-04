import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

import 'otpScreen.dart';
class SignUpAnn extends StatefulWidget {
  const SignUpAnn({ Key? key }) : super(key: key);

  @override
  State<SignUpAnn> createState() => _SignUpAnnState();
}

class _SignUpAnnState extends State<SignUpAnn> {
  late EmailAuth emailAuth;
  String? password;
  String? email;
   String? name;
   bool submitValid = false;
  final _formKey = GlobalKey<FormState>();
   @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    //emailAuth.config(remoteServerConfiguration);
  }
   void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email.toString(), otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: 
          [Flexible(
            child: Column(
              children: [
                Text("Welcome"),
                // Image.asset("assests/images/prabisha.png",),
                 Form(
                   key: _formKey,
                   child: Column(
                     children: [
                       TextFormField(
                         decoration: InputDecoration(
                            fillColor: Colors.grey[350],
              filled: true,
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: OutlineInputBorder(
      borderSide: BorderSide.none,
      
      borderRadius: BorderRadius.all(
        const Radius.circular(10.0),
      ),
    )
                         ),
                         onSaved: (val) {
              name = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
                       ),
                        SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                 _formKey.currentState!.save();
                  sendOtp();
                 Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (context) => OTPAuth(email: email.toString(), pass: password.toString(),)));
                  
                  // AuthenticationHelper()
                  //     .signUp(email: email!, password: password!)
                  //     .then((result) {
                        
                  //   if (result == null) {
                      
                  //     Navigator.pushReplacement(context,
                  //         MaterialPageRoute(builder: (context) => FirstScreen()));
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text(
                  //         result,
                  //         style: TextStyle(fontSize: 16),
                  //       ),
                  //     ));
                  //   }
                  // });
                   
                 //  print(email);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF09009B),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              child: Text('Sign Up'),
            ),
          ),
                     ],
                   ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

