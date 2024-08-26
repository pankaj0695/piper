import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';
import 'package:piper/pages/dashboard.dart';
import 'package:piper/pages/home.dart';
import 'package:piper/pages/report.dart';
import 'package:piper/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomePage(),
    DashboardPage(),
    ReportPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piper',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: CustomColor.darkBlue2,
      ),
      home: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              useIndicator: false,
              backgroundColor: CustomColor.darkBlue1,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  'assets/images/piper-logo.png', // Replace with your actual logo path
                  width: 70,
                ),
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 0
                        ? CustomColor.lightBlue1
                        : CustomColor.lightgrey,
                    size: 35,
                  ),
                  label: Text(
                    'Home',
                    style: TextStyle(
                        color: _selectedIndex == 0
                            ? CustomColor.lightBlue1
                            : CustomColor.lightgrey),
                  ),
                ),
                NavigationRailDestination(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    icon: Icon(
                      Icons.dashboard,
                      color: _selectedIndex == 1
                          ? CustomColor.lightBlue1
                          : CustomColor.lightgrey,
                      size: 35,
                    ),
                    label: Text(
                      'Dashboard',
                      style: TextStyle(
                          color: _selectedIndex == 1
                              ? CustomColor.lightBlue1
                              : CustomColor.lightgrey),
                    )),
                NavigationRailDestination(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  icon: Icon(
                    Icons.find_in_page,
                    color: _selectedIndex == 2
                        ? CustomColor.lightBlue1
                        : CustomColor.lightgrey,
                    size: 35,
                  ),
                  label: Text('Report',
                      style: TextStyle(
                          color: _selectedIndex == 2
                              ? CustomColor.lightBlue1
                              : CustomColor.lightgrey)),
                ),
                NavigationRailDestination(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    icon: Icon(
                      Icons.settings,
                      color: _selectedIndex == 3
                          ? CustomColor.lightBlue1
                          : CustomColor.lightgrey,
                      size: 35,
                    ),
                    label: Text(
                      'Settings',
                      style: TextStyle(
                          color: _selectedIndex == 3
                              ? CustomColor.lightBlue1
                              : CustomColor.lightgrey),
                    )),
              ],
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
