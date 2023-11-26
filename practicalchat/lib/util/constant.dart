import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get_storage/get_storage.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:dio/dio.dart';
import 'constants/colors.dart';

GetStorage box = GetStorage();

Future<FormData> wrapFromData(Map<String, dynamic> json) async {
  FormData formData = FormData.fromMap(json);
  return formData;
}

Future<FormData> wrapMultiPartImages(
    File image, FormData formData, String key) async {
  final fileName = image.path.split('/').last;

  formData.files.add(
    MapEntry(
      key,
      await MultipartFile.fromFile(image.path, filename: fileName),
    ),
  );
  return formData;
}



// Socket? socket=io(
//   'https://fursa-app.io:8000/',
//   <String, dynamic>{
//     'transports': ['websocket'],
//   },
// );

final customIndicator = Center(
  child: SpinKitCircle(

    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffA0025C),
              Color(0xffA020F0),
            ],
          ),
        ),
      );
    },
  ),
);



final customIndicator20 = Center(
  child: SpinKitCircle(
size: 10,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffA0025C),
              Color(0xffA020F0),
            ],
          ),
        ),
      );
    },
  ),
);

final customVideoIndicator = Center(
  child: SpinKitCircle(
    size:20 ,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffA0025C),
              Color(0xffA020F0),
            ],
          ),
        ),
      );
    },
  ),
);


final customIndicator30 = Center(
  child: SpinKitCircle(
    size: 30,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffA0025C),
              Color(0xffA020F0),
            ],
          ),
        ),
      );
    },
  ),
);

final customIndicatorWhite = Center(
  child: SpinKitCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colors.white,
        ),
      );
    },
  ),
);

