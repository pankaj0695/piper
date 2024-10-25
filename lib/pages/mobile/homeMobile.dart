import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';

class HomeMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.darkBlue1,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Welcome to Piper',
                style: TextStyle(
                  color: CustomColor.lightBlue2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              RotationTransition(
                  turns: const AlwaysStoppedAnimation(60 / 360),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/rower-new.png',
                        fit: BoxFit.contain,
                        repeat: ImageRepeat.noRepeat,
                      ),
                    ),
                  )),
              const Text(
                'Piper is an advanced pipe inspection tool designed to navigate through '
                'industrial pipes, detect corrosion, cracks, and sediment buildup. '
                'Our solution ensures the longevity and safety of pipeline infrastructure '
                'by providing real-time data and analysis.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Row(
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
              const SizedBox(height: 25),
            ],
          ),
        ));
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      padding: const EdgeInsets.all(10),
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
