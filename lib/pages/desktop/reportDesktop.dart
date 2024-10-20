import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';

class ReportDesktopPage extends StatelessWidget {
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
                          top: BorderSide(
                              color: CustomColor.lightBlue1, width: 1.5),
                          bottom: BorderSide(
                              color: CustomColor.lightBlue1, width: 1.5),
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
                            'Report',
                            style: TextStyle(
                              color: CustomColor.lightBlue2,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: CustomColor.darkBlue3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pipe Analysis',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Image.asset(
                                      'assets/images/corrosion-analysis.png',
                                      width: 520,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ])))));
  }
}
