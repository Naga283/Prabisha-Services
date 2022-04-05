import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:prabishaservices/EmailAuthenticate/authentication.dart';


import '../dashboard.dart';
class OTPAuth extends StatefulWidget {
  const OTPAuth({ Key? key, required this.email, required this.pass }) : super(key: key);
final String email;
final String pass;
  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  late EmailAuth emailAuth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }
   verify() {
    print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text));
  }
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: Column(
        
        children: [
          Image.asset("assests/images/prabisha.png"),
          SizedBox(height: 30,),
          TextField(
controller: _otpcontroller,
          ),
          OutlineButton(onPressed: (){
            verify();
            print("Verifff");
            print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text));
            print("ended");
            if(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text)== true){
AuthenticationHelper()
                      .signUp(email: widget.email, password: widget.pass)
                      .then((result) {
                        
                    if (result == null) {
                      
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
            }
            else{
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please enter correct OTP",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
              print("INvalid ");
            }
             
            print("Verifying Here");
            print(_otpcontroller.text);
          },child: Text("Verify"),)
        ],
      ),
    );
  }
}