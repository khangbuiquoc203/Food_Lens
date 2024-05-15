import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tqk_lens/core/app_export.dart';
import 'package:tqk_lens/presentation/camera_screen/views/camera_view.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';


class ImagePreview extends StatefulWidget {
  const ImagePreview({
    Key? key,
    required this.file,
    required this.vision,
  }) : super(key: key);
  final XFile file;
  final FlutterVision vision;
  // final List<Map<String, dynamic>> prediction;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  List<Map<String, dynamic>> yoloResults = [];
  File? imageFile;
  int imageHeight = 1;
  int imageWidth = 1;
  bool isLoaded = true;
  bool isDetecting = false;

  // final FlutterVision vision = FlutterVision();

  @override
  void initState() {
    super.initState();
    imageFile = File(widget.file.path);
    log("On Image vision before load: $widget.vision");

    loadYoloModel().then((value) {
      setState(() {
        yoloResults = [];
        isLoaded = true;
      });
    });

    log("On Image vision after load: $widget.vision");

    yoloOnImage();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  loadYoloModel() async {
    await widget.vision.loadYoloModel(
      // labels: 'assets/yolov5s_float32.txt',
      // modelPath: 'assets/yolov5s_float32.tflite',
      // labels: 'assets/yolov8n_labels.txt',
      // modelPath: 'assets/yolov8n.tflite',
      labels: 'assets/yolov8_final_vegetables_float32.txt',
      modelPath: 'assets/yolov8_final_vegetables_v2_float32.tflite',
      modelVersion: "yolov8",
      quantization: false,
      numThreads: 1,
      useGpu: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (!isLoaded) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text("Model not loaded, waiting for it",
            style: TextStyle(color: Colors.white),)
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          imageFile != null ? Image.file(imageFile!) : const SizedBox(),
          Positioned(
            top: MediaQuery.of(context).padding.top, 
            left: 35, 
            child: SafeArea( 
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowLeftWhite,
                height: 35.v,
                width: 37.h,
                onTap: () {
                  onTapImgArrowleftone(context);
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: pickImage,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Ink(
                        width: 80, // Width of the button
                        height: 80, // Height of the button
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Màu của viền
                            width: 4, // Độ dày của viền
                          ),
                          color: Colors.green[600],
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50, // Size of the icon
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: ElevatedButton(
                    onPressed: () => onTapBtnDetailingredient(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      minimumSize: Size(140, 55),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          " Continue",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ...displayBoxes(size),
        ],
      ),
    );
  }

  yoloOnImage() async {
    yoloResults.clear();
    Uint8List byte = await imageFile!.readAsBytes();
    final image = await decodeImageFromList(byte);
    imageHeight = image.height;
    imageWidth = image.width;
    int count = 0;
    while (true) {
      final result = await widget.vision.yoloOnImage(
        bytesList: byte,
        imageHeight: image.height,
        imageWidth: image.width,
        iouThreshold: 0.5,
        confThreshold: 0.5,
        classThreshold: 0.5,
      );
      log("Flutter Vision: $result");

      log("On Image: $result imageHeight: $imageHeight imageWidth: $imageWidth");
      if (result.isNotEmpty) {
        setState(() {
          yoloResults = result;
        });
        break;
      }

      if (count > 100) {
        log("Cant detect");
        break;
      }
      count += 1;
    }
    if (yoloResults.isNotEmpty) {
      var firstResult = yoloResults[0]; // Lấy phần tử đầu tiên
      var tag = firstResult['tag']; // Truy cập giá trị của key 'tag'
      print("Tag firsr result: $tag");
    } else {
      print("yoloResults is empty");
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
        yoloResults.clear();
      });
      await yoloOnImage();
    }
  }

  List<Widget> displayBoxes(Size screen) {
    if (yoloResults.isEmpty) return [];

    double factorX = screen.width / (imageWidth);
    double imgRatio = imageWidth / imageHeight;
    double newWidth = imageWidth * factorX;
    double newHeight = newWidth / imgRatio;
    double factorY = newHeight / (imageHeight);

    double pady = (screen.height - newHeight) / 2;

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);
    return yoloResults
        .where((result) => (result['box'][4] * 100) >= 20)
        .map((result) {
      return Positioned(
        left: result["box"][0] * factorX,
        top: result["box"][1] * factorY + pady,
        width: (result["box"][2] - result["box"][0]) * factorX,
        height: (result["box"][3] - result["box"][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  void onTapBtnDetailingredient(BuildContext context) {
    if (yoloResults.isNotEmpty) {
      var firstResult = yoloResults[0];
      var tag = firstResult['tag'];

      NavigatorService.pushNamed(
        AppRoutes.detailingredientScreen,
        arguments: {'tag': tag},
      );
    } else {
      // This will show a popup message if there are no results
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Try again with another image"),
            content: Text("Can't detect any ingredient"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  onTapImgArrowleftone(BuildContext context) {
    // NavigatorService.goBack();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CameraView()),
    );
  }
}