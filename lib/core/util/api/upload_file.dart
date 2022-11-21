import 'package:async/async.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadFile {
  static final ImagePicker _picker = ImagePicker();
  static FilePickerResult? result;
  // static List<File>? _files;
  static Future<String> getImage(
      {required BuildContext context,
      required TextEditingController controller}) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      return controller.text = image.path;
    }
    return '';
  }

  static Future<List<File>> getListOfImages({
    required BuildContext context,
  }) async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: [
        'png',
        'jpg',
      ],
    );
    if (result != null) {
      // showDialog(
      //     context: context,
      //     builder: (context) => Styles.alertUploadFile(
      //         context: context,
      //         uploadFile: () async {
      //           Navigator.pop(context);
      Navigator.pop(context);
      EasyLoading.init();
      final _files = result!.paths.map((path) => File(path!)).toList();

      // try {
      for (var file in _files) {
        EasyLoading.show(
          status: '... جاري التحميل',
        );
        // if (extension(file.path) != '.pdf') {
        //   final image = pw.MemoryImage(file.readAsBytesSync());
        //   pdf.addPage(pw.Page(
        //       pageFormat: PdfPageFormat.a4,
        //       build: (pw.Context context) {
        //         return pw.Center(child: pw.Image(image));
        //       }));
        // } else {
        //   uploadFile(file);
        // }
      }
      return _files;

      // final output = await getTemporaryDirectory();
      // final pdfFile = File(
      //     "${output.path}/${UserSharedPreferences.getUserName()}.pdf");

      // await pdfFile.writeAsBytes(await pdf.save());
      // final doc = await PDFDoc.fromFile(pdfFile);
      // if (doc.length > 0) {
      //   uploadFile(pdfFile);
      // }

      // }
    } else {
      // Navigator.pop(context);
      return [];
    }
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
