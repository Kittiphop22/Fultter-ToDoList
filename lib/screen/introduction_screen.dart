import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Connect with EnET-C Student',
      body: 'Give me A and i will success in Developer Career',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Click it'),
        ),
      ),
      image: Image.network('https://i.imgur.com/9jD9bSF.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'What is Flutter',
      body: 'is an open source framework developed and supported by Google.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Click it'),
        ),
      ),
      image: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ6khcTWeZoJrDg7-7LMCFJaVaHVG-e1Rzzw&usqp=CAU'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'Flutter OnBoarding Screen',
      body: 'วันนี้คลาสเรียนวิชา Mobile & Cloud Computing สอนเกี่ยวกับการสร้างและออกแบบ Onboarding Screen',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('Click it'),
        ),
      ),
      image: Image.network(
          'https://assets.justinmind.com/wp-content/uploads/2020/09/user-onboarding-examples-babbel.png'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On_boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('skip'),
        showDoneButton: true,
        done: const Text('Done'),
        showNextButton: true,
        next: Icon(
          Icons.arrow_forward,
          size: 25,
        ),
        onDone: () => onDone(context),
        curve: Curves.bounceOut,
        dotsDecorator: DotsDecorator(
          size: Size(15,15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
