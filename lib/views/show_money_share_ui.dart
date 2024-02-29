import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  //สร้างตัวแปรเก็บค่าที่ส่งมา
  double? money, tip, moneyshare;
  int person;

  //เอาตัวแปรที่สร้างไว้มารอรับค่าที่ส่งมา
  ShowMoneyShareUI({
    super.key,
    this.money,
    this.tip,
    this.moneyshare,
    required this.person,
  });

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  String formatNumber(number) {
    NumberFormat format = NumberFormat('#,###.##', 'en_US');
    return format.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.kanit(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.18,
                backgroundColor: Colors.pink,
                child: Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                formatNumber(widget.money!),
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนคนที่จะหาร',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                formatNumber(widget.person),
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'คน',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                formatNumber(widget.tip),
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.height * 0.3,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    widget.moneyshare!.toStringAsFixed(2),
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                  color: Colors.pink,
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
