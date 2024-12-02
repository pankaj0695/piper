import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piper/constants/colors.dart';

class ReportDesktopPage extends StatefulWidget {
  @override
  _ReportDesktopPageState createState() => _ReportDesktopPageState();
}

class _ReportDesktopPageState extends State<ReportDesktopPage> {
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
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(28),
              topLeft: Radius.circular(28),
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: CustomColor.lightBlue1, width: 1.5),
                  bottom: BorderSide(color: CustomColor.lightBlue1, width: 1.5),
                  left: BorderSide(color: CustomColor.lightBlue1, width: 1.5),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  topLeft: Radius.circular(28),
                ),
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
                  const TabBar(
                    labelColor: CustomColor.lightBlue1,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: CustomColor.lightBlue1,
                    labelStyle: TextStyle(fontSize: 16),
                    unselectedLabelStyle: TextStyle(fontSize: 16),
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
                              const SizedBox(height: 20),
                              const Text(
                                'Corrosion Analysis',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Center(
                                child: Image.asset(
                                    'assets/images/corrosion-analysis.png',
                                    height: 600),
                              ),
                            ],
                          ),
                          // Content for 3D-Map tab
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                '3D Map Analysis',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 40),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
