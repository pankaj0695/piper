import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';

class HomePage extends StatelessWidget {
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Piper',
                      style: TextStyle(
                        color: CustomColor.lightBlue2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Piper is an advanced pipe inspection tool designed to navigate through '
                                  'industrial pipes, detect corrosion, cracks, and sediment buildup. '
                                  'Our solution ensures the longevity and safety of pipeline infrastructure '
                                  'by providing real-time data and analysis.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: _buildFeatureCard(
                                          context,
                                          icon: Icons.videocam,
                                          title: 'Live Camera Feed',
                                          description:
                                              'View real-time footage from the rower\'s camera as it navigates through pipes.',
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: _buildFeatureCard(
                                          context,
                                          icon: Icons.control_camera,
                                          title: 'Rower Control',
                                          description:
                                              'Remotely control the rower\'s movements within the pipes using an intuitive interface.',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: _buildFeatureCard(
                                    context,
                                    icon: Icons.bar_chart,
                                    title: 'Pipe Analysis',
                                    description:
                                        'Analyze detailed reports showing the corrosion level, temperature, and gas levels.',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 600, // Ensure a specific height is given
                              child: Image.asset(
                                'assets/images/rower-image.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      constraints: const BoxConstraints(minHeight: 150), // Added constraints
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CustomColor.darkBlue3,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: CustomColor.lightBlue1, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: CustomColor.lightBlue1),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
