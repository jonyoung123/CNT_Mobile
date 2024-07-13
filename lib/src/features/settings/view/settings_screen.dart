import 'package:cnt_mobile/src/features/history/view/view.dart';
import 'package:cnt_mobile/src/features/settings/view_model/toggle_notifier.dart';
import 'package:cnt_mobile/src/utils/components/buttons/switch_button.dart';
import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectSettingsScreen extends StatefulWidget {
  const ProjectSettingsScreen({super.key});

  @override
  State<ProjectSettingsScreen> createState() => _ProjectSettingsScreenState();
}

class _ProjectSettingsScreenState extends State<ProjectSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "Settings",
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
      ),
      body: Consumer(builder: (_, ref, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              SettingRowWidget(
                text: "Set SI unit",
                onPressed: () {},
              ),
              const AppDivider(size: 10),
              SettingRowWidget(
                text: "History",
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreen())),
              ),
              const AppDivider(size: 10),
              SettingRowWidget(
                text: "Feedback",
                onPressed: () {},
              ),
              const AppDivider(size: 10),
              SettingRowWidget(
                text: "Branched Nanotube",
                switchWidget: CustomSwitchButton(
                  value: ref.watch(switchProvider),
                  onChanged: ref.read(switchProvider.notifier).toggleSwitch,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
