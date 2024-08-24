import 'package:cnt_mobile/src/data/network/network.dart';
import 'package:cnt_mobile/src/data/network/url.dart';
import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_model.dart';
import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_response.dart';
import 'package:flutter/material.dart';

class PredictService {
  static Future predictService({required PredictDataModel body, required BuildContext context}) async {
    try {
      final json = await BaseService().postRequest(BaseUrl.predictUrl, headers, body.toJson(), context);
      if (json != null) {
        return PredictDataResponse.fromJson(json);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
