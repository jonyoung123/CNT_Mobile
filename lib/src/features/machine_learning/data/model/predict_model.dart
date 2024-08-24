class PredictDataModel {
  final String? userId;
  final double? temperatureDifference;
  final double? velocity;
  final double? nonLocalParam;
  final double? length;
  final double? diameter;
  final double? k1;
  final double? k2;
  final double? initialDisplacement;

  PredictDataModel({
    this.userId,
    this.temperatureDifference,
    this.velocity,
    this.nonLocalParam,
    this.length,
    this.diameter,
    this.k1,
    this.k2,
    this.initialDisplacement,
  });

  PredictDataModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'] as String?,
        temperatureDifference = json['temperature_difference'] as double?,
        velocity = json['velocity'] as double?,
        nonLocalParam = json['non_local_param'] as double?,
        length = json['length'] as double?,
        diameter = json['diameter'] as double?,
        k1 = json['k1'] as double?,
        k2 = json['k2'] as double?,
        initialDisplacement = json['initial_displacement'] as double?;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'temperature_difference': temperatureDifference,
        'velocity': velocity,
        'non_local_param': nonLocalParam,
        'length': length,
        'diameter': diameter,
        'k1': k1,
        'k2': k2,
        'initial_displacement': initialDisplacement
      };
}
