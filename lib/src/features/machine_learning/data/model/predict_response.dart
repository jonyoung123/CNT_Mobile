class PredictDataResponse {
  final String? responseCode;
  final PredictResponseData? responseData;
  final String? responseMessage;

  PredictDataResponse({
    this.responseCode,
    this.responseData,
    this.responseMessage,
  });

  PredictDataResponse.fromJson(Map<String, dynamic> json)
      : responseCode = json['responseCode'] as String?,
        responseData =
            (json['responseData'] as Map<String, dynamic>?) != null ? PredictResponseData.fromJson(json['responseData'] as Map<String, dynamic>) : null,
        responseMessage = json['responseMessage'] as String?;

  Map<String, dynamic> toJson() => {'responseCode': responseCode, 'responseData': responseData?.toJson(), 'responseMessage': responseMessage};
}

class PredictResponseData {
  final Data2d? data2d;
  final Data3d? data3d;
  final double? diameter;
  final double? initialDisp;
  final double? length;
  final double? linearFoundation;
  final double? nonLinearFoundation;
  final double? nonLocalParam;
  final double? temperature;
  final String? userId;
  final double? velocity;

  PredictResponseData({
    this.data2d,
    this.data3d,
    this.diameter,
    this.initialDisp,
    this.length,
    this.linearFoundation,
    this.nonLinearFoundation,
    this.nonLocalParam,
    this.temperature,
    this.userId,
    this.velocity,
  });

  PredictResponseData.fromJson(Map<String, dynamic> json)
      : data2d = (json['data_2d'] as Map<String, dynamic>?) != null ? Data2d.fromJson(json['data_2d'] as Map<String, dynamic>) : null,
        data3d = (json['data_3d'] as Map<String, dynamic>?) != null ? Data3d.fromJson(json['data_3d'] as Map<String, dynamic>) : null,
        diameter = json['diameter'] as double?,
        initialDisp = json['initial_disp'] as double?,
        length = json['length'] as double?,
        linearFoundation = json['linear_foundation'] as double?,
        nonLinearFoundation = json['non_linear_foundation'] as double?,
        nonLocalParam = json['non_local_param'] as double?,
        temperature = json['temperature'] as double?,
        userId = json['user_id'] as String?,
        velocity = json['velocity'] as double?;

  Map<String, dynamic> toJson() => {
        'data_2d': data2d?.toJson(),
        'data_3d': data3d?.toJson(),
        'diameter': diameter,
        'initial_disp': initialDisp,
        'length': length,
        'linear_foundation': linearFoundation,
        'non_linear_foundation': nonLinearFoundation,
        'non_local_param': nonLocalParam,
        'temperature': temperature,
        'user_id': userId,
        'velocity': velocity
      };
}

class Data2d {
  final Mode1? mode1;
  final Mode2? mode2;
  final Mode3? mode3;

  Data2d({
    this.mode1,
    this.mode2,
    this.mode3,
  });

  Data2d.fromJson(Map<String, dynamic> json)
      : mode1 = (json['mode 1'] as Map<String, dynamic>?) != null ? Mode1.fromJson(json['mode 1'] as Map<String, dynamic>) : null,
        mode2 = (json['mode 2'] as Map<String, dynamic>?) != null ? Mode2.fromJson(json['mode 2'] as Map<String, dynamic>) : null,
        mode3 = (json['mode 3'] as Map<String, dynamic>?) != null ? Mode3.fromJson(json['mode 3'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'mode 1': mode1?.toJson(), 'mode 2': mode2?.toJson(), 'mode 3': mode3?.toJson()};
}

class Mode1 {
  final List<double>? deflection;
  final String? imageUrl;
  final List<double>? time;

  Mode1({
    this.deflection,
    this.imageUrl,
    this.time,
  });

  Mode1.fromJson(Map<String, dynamic> json)
      : deflection = (json['deflection'] as List?)?.map((dynamic e) => e as double).toList(),
        imageUrl = json['image_url'] as String?,
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deflection': deflection, 'image_url': imageUrl, 'time': time};
}

class Mode2 {
  final List<double>? deflection;
  final String? imageUrl;
  final List<double>? time;

  Mode2({
    this.deflection,
    this.imageUrl,
    this.time,
  });

  Mode2.fromJson(Map<String, dynamic> json)
      : deflection = (json['deflection'] as List?)?.map((dynamic e) => e as double).toList(),
        imageUrl = json['image_url'] as String?,
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deflection': deflection, 'image_url': imageUrl, 'time': time};
}

class Mode3 {
  final List<double>? deflection;
  final String? imageUrl;
  final List<double>? time;

  Mode3({
    this.deflection,
    this.imageUrl,
    this.time,
  });

  Mode3.fromJson(Map<String, dynamic> json)
      : deflection = (json['deflection'] as List?)?.map((dynamic e) => e as double).toList(),
        imageUrl = json['image_url'] as String?,
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deflection': deflection, 'image_url': imageUrl, 'time': time};
}

class Data3d {
  final Mode31? mode1;
  final Mode32? mode2;
  final Mode33? mode3;

  Data3d({
    this.mode1,
    this.mode2,
    this.mode3,
  });

  Data3d.fromJson(Map<String, dynamic> json)
      : mode1 = (json['mode 1'] as Map<String, dynamic>?) != null ? Mode31.fromJson(json['mode 1'] as Map<String, dynamic>) : null,
        mode2 = (json['mode 2'] as Map<String, dynamic>?) != null ? Mode32.fromJson(json['mode 2'] as Map<String, dynamic>) : null,
        mode3 = (json['mode 3'] as Map<String, dynamic>?) != null ? Mode33.fromJson(json['mode 3'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {'mode 1': mode1?.toJson(), 'mode 2': mode2?.toJson(), 'mode 3': mode3?.toJson()};
}

class Mode31 {
  final List<dynamic>? deformation;
  final List<String>? imageUrl;
  final List<double>? position;
  final List<double>? time;

  Mode31({
    this.deformation,
    this.imageUrl,
    this.position,
    this.time,
  });

  Mode31.fromJson(Map<String, dynamic> json)
      : deformation = json['deformation'] as List?,
        imageUrl = (json['image_url'] as List?)?.map((dynamic e) => e as String).toList(),
        position = (json['position'] as List?)?.map((dynamic e) => e as double).toList(),
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deformation': deformation, 'image_url': imageUrl, 'position': position, 'time': time};
}

class Mode32 {
  final List<dynamic>? deformation;
  final List<String>? imageUrl;
  final List<double>? position;
  final List<double>? time;

  Mode32({
    this.deformation,
    this.imageUrl,
    this.position,
    this.time,
  });

  Mode32.fromJson(Map<String, dynamic> json)
      : deformation = json['deformation'] as List?,
        imageUrl = (json['image_url'] as List?)?.map((dynamic e) => e as String).toList(),
        position = (json['position'] as List?)?.map((dynamic e) => e as double).toList(),
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deformation': deformation, 'image_url': imageUrl, 'position': position, 'time': time};
}

class Mode33 {
  final List<dynamic>? deformation;
  final List<String>? imageUrl;
  final List<double>? position;
  final List<double>? time;

  Mode33({
    this.deformation,
    this.imageUrl,
    this.position,
    this.time,
  });

  Mode33.fromJson(Map<String, dynamic> json)
      : deformation = json['deformation'] as List?,
        imageUrl = (json['image_url'] as List?)?.map((dynamic e) => e as String).toList(),
        position = (json['position'] as List?)?.map((dynamic e) => e as double).toList(),
        time = (json['time'] as List?)?.map((dynamic e) => double.parse(e.toString())).toList();

  Map<String, dynamic> toJson() => {'deformation': deformation, 'image_url': imageUrl, 'position': position, 'time': time};
}
