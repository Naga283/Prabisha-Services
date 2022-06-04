import 'package:flutter/material.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:nice_intro/intro_screens.dart';
import 'package:prabishaservices/Authentication/phoneAuth/startPage.dart';
import 'package:prabishaservices/Screens/homepage.dart';


class OnBoardingScreens extends StatefulWidget {
  @override
  OnBoardingScreensState createState() => OnBoardingScreensState();
}

class OnBoardingScreensState extends State<OnBoardingScreens> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      
      onDone: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InitialiserWidget(),
        ),
      ),
      onSkip: () { print('Skipping the intro slides');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => InitialiserWidget(),
        ),);
      },
      footerBgColor: Colors.blue.shade900.withOpacity(.8),
      activeDotColor: Colors.white,
      footerRadius: 26.0,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
         // textStyle: TextStyle(color: Colors.red,fontSize: Theme.of(context).textTheme.displayMedium!.fontSize),
          title: 'Grow Your\nbussiness with prabisha',
          imageAsset: 'assests/images/onboarding/2.jpeg',
          description: 'You will get more selling order and will be benifited.500 million daily active users',
          headerBgColor: Colors.blue.shade900,
        ),
        // IntroScreen(
        //   title: 'Focused Inbox',
        //   headerBgColor: Colors.white,
        //  // imageAsset: 'assets/img/2.png',
        //   description: "We've put your most important, actionable emails here",
        // ),
        // IntroScreen(
        //   title: 'Social',
        //   headerBgColor: Colors.white,
        //  // imageAsset: 'assets/img/3.png',
        //   description: "Keep talking with your mates",
        // ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
      );
}