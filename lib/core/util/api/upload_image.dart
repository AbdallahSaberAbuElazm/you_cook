// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';

// import 'package:path/path.dart';

// class UploadFile {
//   static final ImagePicker _picker = ImagePicker();
//   static final Dio _dio = Dio(BaseOptions(
//     baseUrl: '',
//     connectTimeout: 5000,
//     receiveTimeout: 3000,
//   ))
//     ..interceptors.add(Logging());
//   static Future getImage(
//       {required BuildContext context,
//       required TextEditingController controller}) async {
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         controller.text = basename(image.path);
//         _uploadFile(
//             file: File(
//               image.path,
//             ),
//             url: "/",
//             dataType: 'image');

//         try {} catch (e) {
//           return Util.snackBar(context: context, msg: e.toString());
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future getFile(
//       {required BuildContext context,
//       required TextEditingController controller}) async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: false,
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'doc'],
//       );
//       if (result != null) {
//         File? file = File(result.files.single.path!);
//         controller.text = basename(file.path);
//         _uploadFile(
//             file: File(
//               file.path,
//             ),
//             url: "/",
//             dataType: "pdf");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   static void _uploadFile(
//       {required File file,
//       required String url,
//       required String dataType}) async {
//     var formData = FormData.fromMap({
//       dataType: await MultipartFile.fromFile(
//         file.path,
//         filename: basename(file.path),
//       ),
//     });
//     await _dio
//         .post(
//           url,
//           data: formData,
//           onSendProgress: (int sent, int total) {
//             print('$sent $total');
//           },
//         )
//         .then((response) => print(response))
//         .catchError((error) => print(error));
//   }
// }
