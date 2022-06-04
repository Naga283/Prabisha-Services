import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:fluttertoast/fluttertoast.dart';



class Payment extends StatefulWidget {
  final double pay;
  
  Payment(this.pay);
  @override
  _PaymentState createState() => _PaymentState();
  
}

class _PaymentState extends State<Payment> {
  //static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  String? em = FirebaseAuth.instance.currentUser!.email;
  String? phn = FirebaseAuth.instance.currentUser!.phoneNumber;

  @override
  Widget build(BuildContext context) {
    double tot =4.0;
    return 
       Scaffold(
       
        body: SafeArea(
          child: Column(
            children: [
                  Image.asset("assests/images/prabisha.png",),
                  Divider(),
                  SizedBox(height: 20,),
                 // Text(widget.pay.toString()),
              Text("Conform Your Payment",style: TextStyle(fontSize:26,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Pay Rupees",style: TextStyle(fontSize: 20),),
              Text(((widget.pay*4)*75.95).toInt().toString(),style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: openCheckout, child: const Text('Payment')),
            ],
          ),
        ),
    
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

   openCheckout() async {
    var options = {
      'key': 'rzp_live_ZoVOmZmp4nsh96',
      'amount': num.parse((widget.pay*4*76).toString())*100,
      'name': 'Prabisha Consulting',
      'description': '',
      'retry': {'enabled': true, 'max_count': 3},
      'send_sms_hash': true,
      'prefill': {'contact': phn, 'email': em},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}