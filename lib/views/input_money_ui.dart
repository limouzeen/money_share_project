import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thailand_province_project/views/show_money_share_ui.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;

  // สร้าง object ที่เป็นตัวแทนควบคุม TextField
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  //สร้าง method แสดง warning msg
  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        title: Container(
          width: MediaQuery.of(context).size.height * 0.2,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              'คำเตือน',
              style: GoogleFonts.kanit(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(
            color: Colors.pink,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    5.0), // Adjust the radius value as needed
              ),
            ),
          ),
        ],
      ),
    );
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
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
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
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        // RegExp(r'^\d*\.?\d{0,2}'),
                        RegExp(r'^[0-9]+.?[0-9]*'),
                        // RegExp(r'^\d*\.?\d{0,2}$'),
                        // replacementString: '',
                        // RegExp(r'^[\d\.]*$'),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill1Wave,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"\d+([\.]\d+)?"),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkStatus,
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              tipCtrl.text = '';
                            }
                          });
                          setState(() {
                            checkStatus = value;
                          });
                        },
                        activeColor: Colors.red,
                        side: BorderSide(
                          color: Colors.red,
                        ),
                        // focusColor: Colors.red,
                        // activeColor: Colors.red,
                        // checkColor: Colors.red,
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.numberWithOptions(),
                    enabled: checkStatus,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}'),
                        // RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนทิป (บาท)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyCheckDollar,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person = 0;

                            //Validate UI
                            if (moneyCtrl.text.length == 0) {
                              warningMessage(context, "ป้อนเงินด้วย");
                              return;
                            } else if (double.parse(moneyCtrl.text) == 0) {
                              //แสดง MSG เงินไม่ควรเป็น 0
                              return;
                              warningMessage(context, "เงินไม่ควรเป็น 0");
                            } else if (personCtrl.text.isEmpty == true) {
                              warningMessage(context, "ป้อนคนด้วย");
                              return;
                            } else if (int.parse(personCtrl.text) == 0) {
                              warningMessage(context, "คนไม่ควรเป็น 0");
                              return;
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.length == 0) {
                                warningMessage(context, "ป้อนทิปด้วย");
                                return;
                              } else if (double.parse(tipCtrl.text) == 0) {
                                //แสดง MSG เงินไม่ควรเป็น 0
                                warningMessage(context, "เงินไม่ควรเป็น 0");
                                return;
                              } else {
                                //พร้อมคำนวณแบบมีทิป

                                money = double.parse(moneyCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                person = int.parse(personCtrl.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              //พร้อมคำนวณแบบไม่มีทิป
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyshare = money / person;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  tip: tip,
                                  moneyshare: moneyshare,
                                  person: person,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size.fromHeight(
                              55.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              moneyCtrl.text = '';
                              personCtrl.text = '';
                              tipCtrl.text = '';
                              checkStatus = false;
                            });
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size.fromHeight(
                                55.0,
                              )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
