import 'package:flutter/material.dart';
import 'package:piper/constants/colors.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class DashboardDesktopPage extends StatefulWidget {
  @override
  _DashboardDesktopPageState createState() => _DashboardDesktopPageState();
}

class _DashboardDesktopPageState extends State<DashboardDesktopPage> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _startTimer();

    // Initialize the video player controller
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/pipe-video.mp4', // Replace with your video file path
    )
      ..setVolume(0.0)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
        _videoPlayerController.play(); // Play the video automatically
      });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsed = _elapsed + const Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _videoPlayerController.dispose(); // Dispose the video player controller
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

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
                        'Piper Dashboard',
                        style: TextStyle(
                          color: CustomColor.lightBlue2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        color: CustomColor.darkBlue3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Camera Feed',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                                height: 480,
                                                child: Center(
                                                  child: _videoPlayerController
                                                          .value.isInitialized
                                                      ? AspectRatio(
                                                          aspectRatio:
                                                              _videoPlayerController
                                                                  .value
                                                                  .aspectRatio,
                                                          child: VideoPlayer(
                                                              _videoPlayerController),
                                                        )
                                                      : const CircularProgressIndicator(),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Remaining code for the Controller section
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        color: CustomColor.darkBlue3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Controller',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    padding: WidgetStateProperty
                                                        .all<EdgeInsets>(
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 25,
                                                                vertical: 18)),
                                                    backgroundColor:
                                                        WidgetStateProperty.all<
                                                                Color>(
                                                            CustomColor
                                                                .lightBlue1),
                                                  ),
                                                  icon: const Icon(
                                                    Icons.arrow_upward,
                                                    color:
                                                        CustomColor.darkBlue1,
                                                  ),
                                                  label: const Text('Forward',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: CustomColor
                                                              .darkBlue1)),
                                                ),
                                                ElevatedButton.icon(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    padding: WidgetStateProperty
                                                        .all<EdgeInsets>(
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 25,
                                                                vertical: 18)),
                                                    backgroundColor:
                                                        WidgetStateProperty.all<
                                                                Color>(
                                                            CustomColor
                                                                .lightBlue1),
                                                  ),
                                                  icon: const Icon(
                                                    Icons.arrow_downward,
                                                    color:
                                                        CustomColor.darkBlue1,
                                                  ),
                                                  label: const Text('Backward',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: CustomColor
                                                              .darkBlue1)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        color: CustomColor.darkBlue3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Time Elapsed',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              _formatDuration(_elapsed),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Distance',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      '10.2 m',
                                                      style: TextStyle(
                                                        color: CustomColor
                                                            .lightBlue1,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Current Speed',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      '0.02 m/s',
                                                      style: TextStyle(
                                                        color: CustomColor
                                                            .lightBlue1,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(height: 16),
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        color: CustomColor.darkBlue3,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'About Pipe',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '> Material: Ductile iron (a type of cast iron with improved ductility)\n'
                                              '> Diameter: Typically ranges from 2 inches to 60 inches.\n',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}