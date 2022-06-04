import 'package:flutter/material.dart';
import 'package:prabishaservices/Payment/Payment.dart';
import 'package:prabishaservices/Screens/homepage.dart';
import 'package:prabishaservices/Screens/services.dart';
import 'package:prabishaservices/whatsappchat/whatsAppChat.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Services(search: '',)
    );
  }
}