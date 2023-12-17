// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shatahuun_zartsuulalt/add.dart';
import 'package:shatahuun_zartsuulalt/home.dart';
import 'package:shatahuun_zartsuulalt/top.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Container(
        color: Color.fromARGB(255, 226, 225, 225),
        child: SingleChildScrollView(
          child: HomePage(),
        ),
      ),
      Container(
        color: Color.fromARGB(255, 226, 225, 225),
        child: SingleChildScrollView(
          child: AddField(),
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: CalcTop(),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Хянах самбар",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Шинэ",
        activeColorSecondary: Colors.white,
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calculate),
        title: "Тооцоолох",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 220, 220),
      appBar: AppBar(
        title: Text("Шатахуун зарцуулалт"),
        centerTitle: true,
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOutQuad,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style18,
        onItemSelected: (int index) {
          setState(() {
            print('Tab $index selected');
          });
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: StartPage()));
}
