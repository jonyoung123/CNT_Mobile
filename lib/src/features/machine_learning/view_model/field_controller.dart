// ignore_for_file: use_build_context_synchronously

import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_model.dart';
import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_response.dart';
import 'package:cnt_mobile/src/features/machine_learning/data/repository/predict_service.dart';
import 'package:cnt_mobile/src/features/machine_learning/view/results_screen.dart';
import 'package:cnt_mobile/src/utils/components/snack_bars/response_snack.dart';
import 'package:cnt_mobile/src/utils/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fieldProvider = ChangeNotifierProvider((ref) {
  return TextFieldController();
});

class TextFieldController extends ChangeNotifier {
  bool _readNonLocalParam = true;
  bool get readNonLocalParam => _readNonLocalParam;

  bool _readTemperature = true;
  bool get readTemperature => _readTemperature;

  bool _readVelocity = true;
  bool get readVelocity => _readVelocity;

  LoadingStatus generateStatus = LoadingStatus.init;
  PredictDataResponse? predictedResult;

  void setNonLocalParam() {
    _readNonLocalParam = !_readNonLocalParam;
    notifyListeners();
  }

  void setTemperature() {
    _readTemperature = !_readTemperature;
    notifyListeners();
  }

  void setVelocity() {
    _readVelocity = !_readVelocity;
    notifyListeners();
  }

  void setGenerateStatus({LoadingStatus status = LoadingStatus.init}) {
    generateStatus = status;
    notifyListeners();
  }

  Future predictData({required PredictDataModel body, required BuildContext context}) async {
    try {
      setGenerateStatus(status: LoadingStatus.loading);
      PredictDataResponse? response = await PredictService.predictService(body: body, context: context);
      setGenerateStatus(status: LoadingStatus.completed);
      if (response != null) {
        if (response.responseCode == "00") {
          predictedResult = response;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ResultsScreen(predictResponseData: response.responseData!)),
          );
        } else {
          showSnack(context, response.responseCode ?? "400", response.responseMessage ?? "");
        }
      } else {
        showSnack(context, "404", "An error occurred while predicting data");
      }
      notifyListeners();
    } catch (e) {
      showSnack(context, "404", "An error occurred while predicting data");
      setGenerateStatus(status: LoadingStatus.error);
    }
  }
}
