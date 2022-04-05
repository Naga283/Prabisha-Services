import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prabishaservices/Authentication/phoneAuth/startPage.dart';
import 'package:prabishaservices/DashBoard.dart';
import 'package:prabishaservices/EmailAuthenticate/login.dart';
import 'package:prabishaservices/Payment/Payment.dart';
import 'package:prabishaservices/Screens/homepage.dart';
import 'package:prabishaservices/Screens/itSolutions.dart';
import 'package:prabishaservices/Screens/topHeader.dart';
import 'package:prabishaservices/select%20Location/select_location.dart';
import 'package:prabishaservices/trailCart/st.dart';
import 'package:prabishaservices/whatsappchat/whatsAppChat.dart';
import 'package:provider/provider.dart';

import 'Authentication/authentication.dart';
import 'Authentication/user.dart';
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return StreamProvider<Useru?>.value(
      value: Authentication().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      //  home:Practice(title: 'Order Place',)
       home: InitialiserWidget(),
      ),
    );
  }
}