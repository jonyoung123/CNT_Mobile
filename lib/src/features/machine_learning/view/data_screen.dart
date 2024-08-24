import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_model.dart';
import 'package:cnt_mobile/src/features/machine_learning/view_model/field_controller.dart';
import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:cnt_mobile/src/utils/enum/enum.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

class ProjectDataScreen extends StatefulWidget {
  const ProjectDataScreen({super.key, this.isNavigation = false});
  final bool isNavigation;

  @override
  State<ProjectDataScreen> createState() => _ProjectDataScreenState();
}

class _ProjectDataScreenState extends State<ProjectDataScreen> {
  TextEditingController nonLocalController = TextEditingController(text: "0.55e-09");
  TextEditingController temperatureController = TextEditingController(text: "20");
  TextEditingController velocityController = TextEditingController(text: "1");
  TextEditingController linearFoundationController = TextEditingController();
  TextEditingController nonLinearFoundationController = TextEditingController();
  TextEditingController diameterController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController displacementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Machine Learning",
          style: AppTextStyle.appBarStyle,
        ),
        leading: widget.isNavigation ? null : const LeadingIcon(),
      ),
      body: Consumer(builder: (_, ref, __) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Machine Learning".textStyled(
                  //   fontSize: 24,
                  //   fontWeight: FontWeight.w500,
                  //   color: AppColors.brown100,
                  // ),
                  const SizedBox(height: 10),
                  "Enter Parameters to generate graphs and data using the Machine Learning model".textStyled(
                    fontSize: 15,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    label: "Temperature Change (°K)",
                    readOnly: ref.watch(fieldProvider).readTemperature,
                    controller: temperatureController,
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readTemperature,
                      onTap: ref.read(fieldProvider.notifier).setTemperature,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Velocity of Flow (m/s)",
                    readOnly: ref.watch(fieldProvider).readVelocity,
                    controller: velocityController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readVelocity,
                      onTap: ref.read(fieldProvider.notifier).setVelocity,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Length of CNT (nm)",
                    controller: lengthController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                    hintText: "Enter the length of CNT",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Non-Local Parameter",
                    readOnly: ref.watch(fieldProvider).readNonLocalParam,
                    controller: nonLocalController,
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readNonLocalParam,
                      onTap: ref.read(fieldProvider.notifier).setNonLocalParam,
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Outer Diameter (nm)",
                    controller: diameterController,
                    hintText: "Enter the outer diameter of CNT",
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Linear Elastic Foundation Parameter",
                    controller: linearFoundationController,
                    hintText: "Enter K1",
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Non-Linear Elastic Foundation Parameter",
                    controller: nonLinearFoundationController,
                    hintText: "Enter K1",
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Initial Displacement of CNT (nm)",
                    controller: displacementController,
                    hintText: "Enter the initial displacement of CNT",
                    keyboardType: TextInputType.text,
                    inputFormatters: [ExponentialInputFormatter()],
                  ),
                  const SizedBox(height: 30),
                  BlackButton(
                    label: "Generate",
                    status: ref.watch(fieldProvider).generateStatus == LoadingStatus.loading,
                    onPressed: () async {
                      if (ref.read(fieldProvider).generateStatus == LoadingStatus.loading) {
                        ref.read(fieldProvider).setGenerateStatus();
                        return;
                      }
                      PredictDataModel body = PredictDataModel(
                        temperatureDifference: double.parse(temperatureController.text.trim()),
                        userId: "user003",
                        velocity: double.parse(velocityController.text.trim()),
                        nonLocalParam: double.parse(nonLocalController.text.trim()),
                        length: double.parse(lengthController.text.trim()),
                        diameter: double.parse(diameterController.text.trim()),
                        k1: double.parse(linearFoundationController.text.trim()),
                        k2: double.parse(nonLinearFoundationController.text.trim()),
                        initialDisplacement: double.parse(displacementController.text.trim()),
                      );

                      await ref.read(fieldProvider.notifier).predictData(body: body, context: context);
                    },
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
