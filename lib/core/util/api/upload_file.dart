import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadFile {
  static final ImagePicker _picker = ImagePicker();

  static Future<String> getImage(
      {required BuildContext context,
      required TextEditingController controller}) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return controller.text = image.path;
    }
    return '';
  }

  static Future<String> getFile(
      {required BuildContext context,
      required TextEditingController controller}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      File? file = File(result.files.single.path!);
      return controller.text = file.path;
    }
    return '';
  }

  static void uploadFile(
      {required File file,
      required String storageUrl,
      required String dataType}) async {
    // open a bytestream
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();

    // string to uri
    var uri = Uri.parse(storageUrl);

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile(dataType, stream, length,
        filename: basename(file.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
