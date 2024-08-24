import 'dart:convert';
import 'dart:io';
import 'package:cnt_mobile/src/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future getRequest(String url, Map<String, String> header, context, {int time = 60}) async {
    dynamic responseJson;
    try {
      // debugPrint("url ===>>> $url");
      // debugPrint("header ===>> $header");
      http.Response response = await http.get(Uri.parse(url), headers: header).timeout(Duration(seconds: time));
      // debugPrint("$url ===>> ${response.body}");
      // debugPrint(response.statusCode.toString());
      responseJson = getReturnResponse(response, context);
    } on SocketException catch (_) {
      // throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future deleteRequest(String url, Map<String, String> header, context) async {
    dynamic responseJson;
    try {
      // print(url);
      http.Response response = await http.delete(Uri.parse(url), headers: header).timeout(const Duration(seconds: 80));
      // print(response.body);
      // print(response.statusCode);
      responseJson = getReturnResponse(response, context);
    } on SocketException catch (_) {
      // throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future postRequest(String url, Map<String, String> header, Object body, context, {seconds = 60}) async {
    debugPrint("url ====>>>>> $url");
    debugPrint("data ===>>>>> ${jsonEncode(body)}");
    debugPrint("header=====>>> $header");
    dynamic responseJson;
    try {
      http.Response response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body)).timeout(Duration(seconds: seconds));
      debugPrint("$url ===>> ${response.body} ==== ${response.statusCode}");
      // debugPrint(response.statusCode.toString());
      responseJson = returnResponse(response, context);
    } on SocketException catch (_) {
      // throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  Future patchRequest(String url, Map<String, String> header, Object body, context, {seconds = 60}) async {
    // debugPrint("url ====>>>>> $url");
    // debugPrint("data ===>>>>> ${jsonEncode(body)}");
    // debugPrint("header=====>>> $header");
    dynamic responseJson;
    try {
      http.Response response = await http.patch(Uri.parse(url), headers: header, body: body).timeout(Duration(seconds: seconds));
      // debugPrint(response.body);
      // debugPrint(response.statusCode.toString());
      responseJson = returnResponse(response, context);
    } on SocketException catch (_) {
      // throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic getReturnResponse(http.Response response, context) {
    var responseData = jsonDecode(response.body);
    if (responseData['responseCode'] == "E18" || responseData['code'] == "E18") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const CNTNavigation()), (route) => false);
      return;
    }
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = responseData;
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occurred while communicating with server with status code : ${response.statusCode}');
    }
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response, context) {
    var responseData = jsonDecode(response.body);
    // print(responseData);
    if (responseData['responseCode'] == "E18") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const CNTNavigation()), (route) => false);
      return;
    }
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = responseData;
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      // showSnack(context, "08", responseData["responseMessage"]);
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occurred while communicating with server with status code : ${response.statusCode}');
    }
  }
}

final Map<String, String> headers = {
  'Content-Type': "application/json",
  "lang": "en",
  "Accept": "*/*",
};
