import 'package:flutter/material.dart';
import 'package:hello_world/login_page/login_page.dart';
import 'package:hello_world/login_page/sign_up.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../design_system.dart';

class IntroductionPageView extends StatefulWidget {
  const IntroductionPageView({Key key}) : super(key: key);

  @override
  State<IntroductionPageView> createState() => _IntroductionPageViewState();
}

class _IntroductionPageViewState extends State<IntroductionPageView> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    String urlImage,
    String title,
    String subtitle,
  }) =>
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: 450,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Colors.teal.shade700,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(bottom: 230),
        child: PageView(
          controller: controller,
          children: [
            buildPage(
                urlImage: 'assets/images/illustrations1.png',
                title: 'Gain total control of your money',
                subtitle: 'Become your own money manager and make every cent count'
            ),
            buildPage(
                urlImage: 'assets/images/illustrations2.png',
                title: 'Know where your money goes',
                subtitle: 'Track your transaction easily,with categories and financial report'
            ),
            buildPage(
                urlImage: 'assets/images/illustrations3.png',
                title: 'Planning ahead',
                subtitle: 'Setup your budget for each category so you in control'
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ScrollingDotsEffect(
                  activeDotScale: 2,
                  spacing: 20,
                  dotColor: Colors.grey.shade300,
                  activeDotColor: const Color(0xff7f3dff),
                  dotHeight: 8,
                  dotWidth: 8,
                ),

                onDotClicked: (index) =>
                    controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn),
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7f3dff),
                  minimumSize: const Size(370,56),
                  shape: shape,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),)
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff7f3dff),
                  backgroundColor: Colors.grey.shade300,
                  minimumSize: const Size(370,56),
                  shape: shape,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text("Login",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)
            ),
          ],
        ),
      ),
    );
  }
}
