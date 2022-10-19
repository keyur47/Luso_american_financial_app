import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:luso_american_financial/helper/shared_preferences.dart';

class LoggerInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode == 400) {
      await showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: const Text('Session Expire'),
          content: SizedBox(
            height: 80,
            child: Column(
              children: const [Text("Your Session has expire please login again!!")],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
              },
            )
          ],
        ),
      );
    } else if (data.statusCode == 500) {
      await showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => AlertDialog(
          title: const Text('Internal Server Error'),
          content: SizedBox(
            height: 65,
            child: Column(
              children: const [Text("please login after some time !!")],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {},
            )
          ],
        ),
      );
    }
    return data;
  }
}
