import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thailand_province_project/views/input_money_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(
        seconds: 5,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputMoneyUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CircularProgressIndicator(
              color: Colors.pink,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'แชร์เงินกันเถอะ',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Color.fromARGB(255, 13, 11, 32),
              ),
            ),
            Text(
              'Copyright  2024 by Amarat DTI-SAU',
              style: GoogleFonts.kanit(
                color: Color.fromARGB(255, 13, 11, 32),
              ),
            ),
            Text(
              'Version 1.0.0',
              style: GoogleFonts.kanit(
                color: Color.fromARGB(255, 13, 11, 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
