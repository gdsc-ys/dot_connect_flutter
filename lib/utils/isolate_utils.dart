import 'dart:io';
import 'dart:isolate';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as imageLib;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../core/tflite/classifier.dart';
import 'image_utils.dart';


/// Manages separate Isolate instance for inference
class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  Isolate? _isolate;
  ReceivePort _receivePort = ReceivePort();
  SendPort? _sendPort;

  SendPort? get sendPort => _sendPort;

  Future<void> start() async {
    _isolate = await Isolate.spawn<SendPort>(
      entryPoint,
      _receivePort.sendPort,
      debugName: DEBUG_NAME,
    );

    _sendPort = await _receivePort.first;
  }

  static void entryPoint(SendPort sendPort) async {
    try {
      final port = ReceivePort();
      sendPort.send(port.sendPort);

      await for (final IsolateData isolateData in port) {
        if (isolateData != null) {
          Classifier classifier = Classifier(
              interpreter: Interpreter.fromAddress(isolateData.interpreterAddress),
              );
          imageLib.Image image =
              ImageUtils.convertCameraImage(isolateData.cameraImage);
          if (Platform.isAndroid) {
            image = imageLib.copyRotate(image, 90);
          }
          Map<String, dynamic> results = classifier.predict(image);
          isolateData.responsePort!.send(results);
        }
      }
    } catch (e) {
      print(e);
    }
    
  }
}

/// Bundles data to pass between Isolate
class IsolateData {
  CameraImage cameraImage;
  int interpreterAddress;
  List<String> labels;
  SendPort? responsePort;

  IsolateData(
    this.cameraImage,
    this.interpreterAddress,
    this.labels,
  );
}
