import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piper/constants/colors.dart';

class ReportMobilePage extends StatefulWidget {
  @override
  _ReportMobilePageState createState() => _ReportMobilePageState();
}

class _ReportMobilePageState extends State<ReportMobilePage> {
  IOWebSocketChannel? channel;
  String? objFilePath;
  String? mtlFilePath;

  @override
  void initState() {
    super.initState();
    connectWebSocket();
  }

  void connectWebSocket() {
    channel = IOWebSocketChannel.connect(Uri.parse('ws://192.168.1.142:8766'));
    channel!.stream.listen((data) async {
      try {
        final payload = data.toString();
        final objStart = payload.indexOf("OBJ_START") + 9;
        final objEnd = payload.indexOf("OBJ_END");
        final mtlStart = payload.indexOf("MTL_START") + 9;
        final mtlEnd = payload.indexOf("MTL_END");

        final objContent = payload.substring(objStart, objEnd).trim();
        final mtlContent = payload.substring(mtlStart, mtlEnd).trim();

        final directory = await getTemporaryDirectory();
        final objFile = io.File('${directory.path}/pipe.obj');
        final mtlFile = io.File('${directory.path}/pipe.mtl');

        await objFile.writeAsString(objContent);
        await mtlFile.writeAsString(mtlContent);
        print('File saved to: ${objFile.path}');

        setState(() {
          objFilePath = objFile.path; // Update the file path for loading
          mtlFilePath = mtlFile.path;
        });
      } catch (e) {
        print('Error saving file: $e'); // Print any errors that occur
      }
    });
  }

  @override
  void dispose() {
    channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: CustomColor.darkBlue1,
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Report',
                        style: TextStyle(
                          color: CustomColor.lightBlue2,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TabBar(
                        labelColor: CustomColor.lightBlue1,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: CustomColor.lightBlue1,
                        labelStyle: TextStyle(fontSize: 14),
                        unselectedLabelStyle: TextStyle(fontSize: 14),
                        tabs: [
                          Tab(text: 'Corrosion'),
                          Tab(text: '3D-Map'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: CustomColor.darkBlue3,
                          child: TabBarView(
                            children: [
                              // Content for Corrosion tab
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Corrosion Analysis',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: Image.asset(
                                        'assets/images/corrosion-analysis.png',
                                        height: 300),
                                  ),
                                ],
                              ),
                              // Content for 3D-Map tab
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    '3D Map Analysis',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: objFilePath != null
                                        ? Cube(
                                            onSceneCreated: (Scene scene) {
                                              scene.world.add(
                                                Object(
                                                  fileName: objFilePath!,
                                                  isAsset: false,
                                                ), // Load the .obj file
                                              );
                                              scene.camera.position
                                                  .setFrom(Vector3(0, 10, 50));
                                              scene.camera.zoom = 50;
                                            },
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
