import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tqk_lens/core/app_export.dart';
import '../controller/scan_controller.dart';
import 'package:get/get.dart';
import 'image_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          if (controller.isCameraInitialized.value) {
            return Stack(
              children: [
                SizedBox(
                    height: size.height, // Điều chỉnh theo chiều cao mong muốn
                    width: size.width,
                    child: CameraPreview(controller.cameraController)),
                ...controller.displayBoxesAroundRecognizedObjects(size),
                // Back button
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: 30,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => NavigatorService.pushNamed(AppRoutes.homeScreen),
                    iconSize: 45
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: size.width / 2 - 40,
                  child: GestureDetector(
                      onTap: () => takePicture(context, controller),
                      child: buildCameraButton()),
                ),
                Positioned(
                  bottom: 20.h,
                  left: size.width / 2.v + 100.h,
                  child: FloatingActionButton(
                    onPressed: () async {
                      final byteData = await rootBundle
                          .load(ImageConstant.imgConstanttakepic);
                      final buffer = byteData.buffer;
                      Directory tempDir = await getTemporaryDirectory();
                      String tempPath = tempDir.path;
                      File tempFile = File('$tempPath/constantimg.jpg');
                      await tempFile.writeAsBytes(buffer.asUint8List(
                          byteData.offsetInBytes, byteData.lengthInBytes));

                      XFile picture = XFile(tempFile.path);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImagePreview(
                              file: picture, vision: controller.vision),
                        ),
                      );
                      print("Pick image button tapped");
                    },
                    child: Icon(Icons.photo_library),
                    tooltip: 'Pick Image',
                    backgroundColor: Colors.green[600],
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("Loading Preview..."));
          }
        },
      ),
    );
  }

  Widget buildCameraButton() {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 5),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.camera,
          size: 60,
        ),
      ),
    );
  }

  Future<void> takePicture(
      BuildContext context, ScanController controller) async {
    if (!controller.isCameraInitialized() ||
        controller.cameraController.value.isTakingPicture) {
      return;
    }

    try {
      // Check if flash is needed, adjust only if required
      controller.cameraController.setFlashMode(FlashMode.off);
      XFile picture = await controller.cameraController.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ImagePreview(file: picture, vision: controller.vision),
        ),
      );
    } on CameraException catch (e) {
      debugPrint("Error occured while taking picture: $e");
    }
  }
}
