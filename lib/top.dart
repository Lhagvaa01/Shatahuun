// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shatahuun_zartsuulalt/component/constants.dart';
import 'package:shatahuun_zartsuulalt/component/rounded_input_field.dart';

class CalcTop extends StatefulWidget {
  @override
  _CalcTopState createState() => _CalcTopState();
}

class _CalcTopState extends State<CalcTop> {
  final unitPriceController = TextEditingController();
  final totalPriceController = TextEditingController();
  final totalKmController = TextEditingController();

  fuelCalculating() {
    double totalL = (int.parse(totalPriceController.text) /
            int.parse(unitPriceController.text))
        .toDouble();
    fuelController.text =
        ((totalL * 100) / int.parse(totalKmController.text)).toStringAsFixed(1);
    fuel1LController.text =
        (int.parse(totalKmController.text) / totalL).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            height: size.height * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orange, width: 2),
                )),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 5),
                                  blurRadius: 50,
                                  color:
                                      const Color(0xFF12153D).withOpacity(0.3))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: size.height * 0.089,
                              width: size.width * 0.3 - 14,
                              color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: size.height * 0.021,
                                  ),
                                  Text(
                                    '1L',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.029,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              '=',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.029,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.09),
                            Container(
                              height: size.height * 0.089,
                              width: size.width * 0.3 - 14,
                              color: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: size.height * 0.021,
                                  ),
                                  Text(
                                    fuel1LController.text + 'km',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.height * 0.029,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          '100km --> ' + fuelController.text + "l",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.height * 0.053,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: unitPriceController,
            hintText: "1л-ийн Үнэ",
            onChanged: (String value) {},
            icon: Icons.price_change,
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: totalPriceController,
            hintText: "Нийт авсан үнэ",
            onChanged: (String value) {},
            icon: Icons.price_change_outlined,
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: totalKmController,
            hintText: "Нийт явсан КМ",
            onChanged: (String value) {},
            icon: Icons.meeting_room,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                onPressed: () {
                  fuelCalculating();
                  setState(() {});
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: kPrimaryLightColor,
                  primary: Colors.black,
                ),
                child: const Text("Тооцоолох"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
