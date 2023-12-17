// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shatahuun_zartsuulalt/constant/db.dart';
import 'package:shatahuun_zartsuulalt/constant/localVaribles.dart';

import 'component/constants.dart';
import 'constant/dbR.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void fetchData() async {
    fuelNote = await DashFuelDatabase.getDashFuel();
    // remindNote = await DashRemindDatabase.getRemindFuel();
    // print("fuelNote: " + fuelNote.toString());
    // print("remindNote: " + remindNote.toString());
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  String setTotalPrice() {
    double retVal = 0;
    for (var element in fuelNote) {
      retVal += double.parse(element['dbFuelTotalPrice'].toString());
    }
    return retVal.toString();
  }

  String setTotalL() {
    double retVal = 0;
    for (var element in fuelNote) {
      retVal += double.parse(element['dbFuelL'].toString());
    }
    return retVal.toString();
  }

  String calcTotalLitr(Map<String, String> element) {
    double unit = double.parse(element['dbFuelLitrPrice'].toString());
    double total = double.parse(element['dbFuelTotalPrice'].toString());

    return (total / unit).toStringAsFixed(2);
  }

  String setTotalDays(Map<String, String> element) {
    String startDateString = element['dbRemindStartD']!;
    String endDateString = element['dbRemindEndD']!;

    DateTime startDate = DateTime.parse(startDateString);
    DateTime endDate = DateTime.parse(endDateString);

    int differenceInDays = endDate.difference(startDate).inDays;
    return differenceInDays.toString();
  }

  String setTotalEndDays(Map<String, String> element) {
    DateTime now = DateTime.now();

    String nowDate = DateFormat('yyyy-MM-dd').format(now);

    String endDateString = element['dbRemindEndD']!;

    DateTime startDate = DateTime.parse(nowDate);
    DateTime endDate = DateTime.parse(endDateString);

    int differenceInDays = endDate.difference(startDate).inDays;
    return differenceInDays.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // alignment: Alignment.center,
              height: size.height / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 80,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Container(
                            width: size.width / 4,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                setTotalL() + "L",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width / 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            dbHeaderjson[0]['dbText']!,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 80,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Container(
                            width: size.width / 4,
                            child: Flexible(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  setTotalPrice() + "₮",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width / 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            dbHeaderjson[1]['dbText']!,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 80,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Container(
                            width: size.width / 4,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                dbRemind.length.toString() + "ш",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width / 4,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.center,
                            dbHeaderjson[2]['dbText']!,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                height: size.height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            dbOdo[0]['dbOdoLogo']!,
                            scale: 1.5,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              // dbFuelDatabase.savedbFuel(fuelNote);
                              setState(() {
                                // addFuelEntry(newFuelEntry);
                                fetchData();
                                print(dbFuel);
                              });
                            },
                            child: Text("Odometer"),
                          ),
                        ],
                      ),
                      Text(fuelNote.last['dbFuelOdo']!),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("Сануулга"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dbRemind.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset(
                                    dbRemind[index]['dbRemindLogo']!,
                                    scale: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dbRemind[index]['dbRemindText']!,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "Нийт " +
                                                  setTotalDays(
                                                      dbRemind[index]) +
                                                  " өдөр",
                                            ),
                                          ],
                                        ),
                                        Text(setTotalEndDays(dbRemind[index]) +
                                            " өдөр үлдсэн"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("Худалдан авалт"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fuelNote.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle the onTap event to delete the selected item
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                        color: Colors.red,
                                      ),
                                      child: Image.asset(
                                        fuelNote[index]['dbFuelLogo']!,
                                        scale: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            textAlign: TextAlign.left,
                                            "Огноо: " +
                                                fuelNote[index]['dbFuelDate']!),
                                        Text(
                                            textAlign: TextAlign.left,
                                            "Odo: " +
                                                fuelNote[index]['dbFuelOdo']! +
                                                "km"),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        textAlign: TextAlign.left,
                                        "Нийт литр: " +
                                            calcTotalLitr(fuelNote[index]) +
                                            "л"),
                                    Text(
                                        textAlign: TextAlign.left,
                                        "Нийт үнэ: " +
                                            fuelNote[index]
                                                ['dbFuelTotalPrice']! +
                                            "₮"),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      fuelNote.removeAt(index);
                                      DashFuelDatabase.saveDashFuel(fuelNote);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
