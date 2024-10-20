import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';
import 'package:piper/pages/desktop/dashboardDesktop.dart';
import 'package:piper/pages/desktop/homeDesktop.dart';
import 'package:piper/pages/desktop/reportDesktop.dart';
import 'package:piper/pages/desktop/settingsDesktop.dart';
import 'package:piper/pages/mobile/dashboardMobile.dart';
import 'package:piper/pages/mobile/homeMobile.dart';
import 'package:piper/pages/mobile/reportMobile.dart';
import 'package:piper/pages/mobile/settingsMobile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piper',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: CustomColor.darkBlue2,
      ),
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return MobileLayout();
        } else {
          return DesktopLayout();
        }
      },
    );
  }
}

class MobileLayout extends StatefulWidget {
  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomeMobilePage(),
    DashboardMobilePage(),
    ReportMobilePage(),
    SettingsMobilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.darkBlue1,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 18),
              child: Image.asset(
                'assets/images/piper-logo.png', // Path to your logo image
                height: 45, // Adjust the height as needed
              ),
            ),
            const SizedBox(width: 10), // Spacing between the logo and title
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 18),
              child: Text(
                'Piper',
                style: TextStyle(
                    color: CustomColor.lightBlue1,
                    fontFamily: 'Poppins',
                    fontSize: 28),
              ),
            ), // The title of your app
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0
                      ? CustomColor.lightBlue1
                      : CustomColor.lightgrey,
                  size: 25,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: _selectedIndex == 1
                    ? CustomColor.lightBlue1
                    : CustomColor.lightgrey,
                size: 25,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.find_in_page,
                color: _selectedIndex == 2
                    ? CustomColor.lightBlue1
                    : CustomColor.lightgrey,
                size: 25,
              ),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _selectedIndex == 3
                    ? CustomColor.lightBlue1
                    : CustomColor.lightgrey,
                size: 25,
              ),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: CustomColor.lightBlue1,
          unselectedItemColor: CustomColor.lightgrey,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          backgroundColor: CustomColor.darkBlue1,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed),
    );
  }
}

class DesktopLayout extends StatefulWidget {
  @override
  _DesktopLayoutState createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    HomeDesktopPage(),
    DashboardDesktopPage(),
    ReportDesktopPage(),
    SettingsDesktopPage(),
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
