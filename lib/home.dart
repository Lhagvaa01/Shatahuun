// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ['Oil Change', 'Another Task', 'Yet Another Task'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: size.height / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height,
                    width: size.width / 5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Миний машин",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.black,
                          width: size.width / 4,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Test")),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width / 5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Миний машин",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.black,
                          width: size.width / 4,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Test")),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width / 5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: size.width / 4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Миний машин",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          // color: Colors.black,
                          width: size.width / 4,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Test")),
                          ),
                        )
                      ],
                    ),
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
                          Text("LOGO"),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Odometer"),
                        ],
                      ),
                      Text("2500KM"),
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                child: Text("LOGO"),
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
                                          Text(items[index]),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text("35 days"),
                                        ],
                                      ),
                                      Text("35 days"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
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
                                  Text("LOGO"),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text("Odometer"),
                                ],
                              ),
                              Text("2500₮"),
                            ],
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
