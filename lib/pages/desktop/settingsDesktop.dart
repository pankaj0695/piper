import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';

class SettingsDesktopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.darkBlue1,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  topLeft: Radius.circular(28)),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                      top:
                          BorderSide(color: CustomColor.lightBlue1, width: 1.5),
                      bottom:
                          BorderSide(color: CustomColor.lightBlue1, width: 1.5),
                      left: BorderSide(
                          color: CustomColor.lightBlue1, width: 1.5)),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      topLeft: Radius.circular(28)),
                ),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        color: CustomColor.lightBlue2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          const ListTile(
                            leading: CircleAvatar(
                              backgroundColor: CustomColor.lightBlue1,
                              child: Icon(Icons.person,
                                  color: CustomColor.darkBlue1),
                            ),
                            title: Text(
                              'User Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            subtitle: Text(
                              'user.email@example.com',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                          ),
                          const Divider(color: Colors.white54),
                          ListTile(
                            leading:
                                const Icon(Icons.lock, color: Colors.white),
                            title: const Text(
                              'Change Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              // Implement Change Password functionality
                            },
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.language, color: Colors.white),
                            title: const Text(
                              'Language',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              // Implement Language change functionality
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.notifications,
                                color: Colors.white),
                            title: const Text(
                              'Notifications',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              // Implement Notifications settings functionality
                            },
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.help, color: Colors.white),
                            title: const Text(
                              'Help & Support',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              // Implement Help & Support functionality
                            },
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.logout, color: Colors.white),
                            title: const Text(
                              'Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              // Implement Logout functionality
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
