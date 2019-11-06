import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

import 'config.dart';

class DownloadClient {
  DownloadClient(Dio dio) : _dio = dio;

  Dio _dio;

  Future downloadFile(
      String token, String appId, String savedPath, CancelToken cancelToken) {
    File file = File(savedPath);
    return file.exists().then((bo) => bo ? file.length() : 0).then((len) {
      int reserved = len;
      print('file length:$len');
      // if (already >= 13678) {
      //   print('complete');
      //   return;
      // }
      return _dio.post<ResponseBody>('${ApiUrl}appInfo/fileDownload/$appId',
          cancelToken: cancelToken,
          options: Options(
              responseType: ResponseType.stream,
              headers: {'range': 'bytes=$reserved'}),
          queryParameters: {'token': token}).then((res) {
        var stream = res.data.stream;
        IOSink ioSink = file.openWrite(mode: FileMode.append);
        // ioSink.addStream(stream).whenComplete(() {
        //   ioSink.close();
        //   print('close ioSink');
        // });
        stream.listen((data) {
          print('receive data ${data.lengthInBytes}');
          reserved += data.lengthInBytes;
          ioSink.add(data);
          // if (reserved > 6000) {
          //   print('paused');
          //   cancelToken.cancel();
          // }
        }, onDone: () {
          ioSink.close();
          print('done :$reserved');
        }, onError: (err) {
          print(err);
        });
      }).catchError((err) {
        print(err);
      });
    });
  }
}
