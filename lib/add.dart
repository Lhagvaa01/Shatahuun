// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shatahuun_zartsuulalt/constant/localVaribles.dart';

import 'component/constants.dart';
import 'component/rounded_input_field.dart';
import 'constant/db.dart';
import 'package:intl/intl.dart';

import 'constant/dbR.dart';

class AddField extends StatefulWidget {
  const AddField({super.key});

  @override
  State<AddField> createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  final odoController = TextEditingController();
  final totalPriceController = TextEditingController();
  final unitPriceController = TextEditingController();
  final dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
  }

  void fetchData() async {
    fuelNote = await DashFuelDatabase.getDashFuel();
  }

  void addFuelEntry() {
    Map<String, String> newFuelEntry = {
      'dbFuelLogo': 'assets/gas.png',
      'dbFuelOdo': odoController.text,
      'dbFuelLitrPrice': unitPriceController.text,
      'dbFuelTotalPrice': totalPriceController.text,
      'dbFuelDate': dateController.text,
      'dbFuelL': (double.parse(totalPriceController.text) /
              double.parse(unitPriceController.text))
          .toStringAsFixed(2),
    };

    setState(() {
      fuelNote.add(newFuelEntry);
      // fuelNote.removeLast();
      // remindNote.removeLast();
    });
    fetchData();

    // odoController.clear();
    // totalPriceController.clear();
    // unitPriceController.clear();

    DashFuelDatabase.saveDashFuel(fuelNote);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              height: size.height * 0.09,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 50,
                        color: const Color(0xFF12153D).withOpacity(0.3))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Шатахуун худалдан авалт",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: odoController,
            hintText: "Одоогийн км-ийн заалт",
            onChanged: (String value) {},
            icon: Icons.price_change,
            readOnly: false,
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: unitPriceController,
            hintText: "1л-ийн Үнэ",
            onChanged: (String value) {},
            icon: Icons.price_change,
            readOnly: false,
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            controller: totalPriceController,
            hintText: "Нийт авсан үнэ",
            onChanged: (String value) {},
            icon: Icons.price_change,
            readOnly: false,
          ),
          GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: size.width - 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.black12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                    Text(dateController.text),
                  ],
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    addFuelEntry();
                  });
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: kPrimaryLightColor,
                  primary: Colors.black,
                ),
                child: const Text("Хадгалах"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
