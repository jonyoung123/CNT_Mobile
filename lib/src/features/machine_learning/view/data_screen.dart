import 'package:cnt_mobile/src/features/machine_learning/view_model/field_controller.dart';
import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDataScreen extends StatefulWidget {
  const ProjectDataScreen({super.key, this.isNavigation = false});
  final bool isNavigation;

  @override
  State<ProjectDataScreen> createState() => _ProjectDataScreenState();
}

class _ProjectDataScreenState extends State<ProjectDataScreen> {
  TextEditingController modulusController = TextEditingController(text: "1200000000000");
  TextEditingController temperatureController = TextEditingController(text: "20");
  TextEditingController velocityController = TextEditingController(text: "1");
  TextEditingController modesController = TextEditingController(text: "3");
  TextEditingController thicknessController = TextEditingController();
  TextEditingController diameterController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController cntMassController = TextEditingController();
  TextEditingController fluidMassController = TextEditingController();
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
                    label: "Young's Modulus",
                    readOnly: ref.watch(fieldProvider).readModulus,
                    controller: modulusController,
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readModulus,
                      onTap: ref.read(fieldProvider.notifier).setModulus,
                    ),
                  ),
                  const SizedBox(height: 12),
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
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readVelocity,
                      onTap: ref.read(fieldProvider.notifier).setVelocity,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Number of Modes",
                    readOnly: ref.watch(fieldProvider).readModes,
                    controller: modesController,
                    suffixIcon: FieldEditWidget(
                      edit: !ref.watch(fieldProvider).readModes,
                      onTap: ref.read(fieldProvider.notifier).setModes,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Mass of CNT (kg)",
                    controller: cntMassController,
                    hintText: "Enter the mass of CNT",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Mass of Fluid (kg)",
                    controller: fluidMassController,
                    hintText: "Enter the mass of fluid",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Thickness of CNT (nm)",
                    controller: cntMassController,
                    hintText: "Enter the mass of CNT",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Outer Diameter (nm)",
                    controller: diameterController,
                    hintText: "Enter the outer diameter of CNT",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Length of CNT (nm)",
                    controller: lengthController,
                    hintText: "Enter the length of CNT",
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    label: "Initial Displacement of CNT (nm)",
                    controller: displacementController,
                    hintText: "Enter the initial displacement of CNT",
                  ),
                  const SizedBox(height: 30),
                  BlackButton(
                    label: "Generate",
                    onPressed: () {},
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
