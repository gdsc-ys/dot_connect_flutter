import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Test page for tflite"),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () async {
                await runTFlite();
              },
              child: Text(
                "TFlite",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

runTFlite() async {
  try {
    print("1");
    // File modelFile = File("assets/model.tflite");
    print("2");
    // final interpreter = Interpreter.fromFile(modelFile);
    final interpreter = await Interpreter.fromAsset("model.tflite");
    print("3");
    // ignore: deprecated_member_use
    var output = {0: TensorBuffer.createFixedSize(interpreter.getOutputTensor(0).shape, interpreter.getOutputTensor(0).type)};
    print("4");
    String path = "braille_sample.png";
    var imgByteData = await rootBundle.load("assets/$path");
    var imgFile = File('${(await getTemporaryDirectory()).path}/$path');
    var file = await imgFile.writeAsBytes(imgByteData.buffer.asUint8List(imgByteData.offsetInBytes, imgByteData.lengthInBytes));
    print("5");
    var input = TensorImage.fromFile(file);
    print("6");
    interpreter.run(input.buffer.asFloat32List(), output);

    print("tflight result : $output");
  } catch (e) {
    print("error : $e");
  }
    
}

