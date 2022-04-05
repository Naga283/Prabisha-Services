import 'package:flutter/material.dart';
import 'package:prabishaservices/Authentication/authentication.dart';
import 'package:prabishaservices/EmailAuthenticate/authentication.dart';
class ForgotPass extends StatelessWidget {
  const ForgotPass({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final _formKey = GlobalKey<FormState>();
     String? forgotMail;
    // TextEditingController forgPas  = TextEditingController();
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Image.asset("assests/images/prabisha.png"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: TextFormField(
                 
                   decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email ',
                fillColor: Colors.grey[350],
                filled: true,
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (val) {
                forgotMail = val;
              },
                ),
              ),
            ),
           SizedBox(height: 15),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 54,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Respond to button press

                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    AuthenticationHelper()
                        .resetPass(email: forgotMail)
                        .then((result) {
                      if (result == null) {
                        Navigator.pop(context);
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
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF09009B),
                  
                    shape: RoundedRectangleBorder(
                      
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          ],
        ),
      )
    );
  }
}