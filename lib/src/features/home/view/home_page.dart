import 'package:cnt_mobile/src/features/history/view/test.dart';
import 'package:cnt_mobile/src/features/history/view/test2.dart';
import 'package:cnt_mobile/src/features/history/view/view.dart';
import 'package:cnt_mobile/src/utils/components/components.dart';
import 'package:cnt_mobile/src/utils/constants/constant.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SWCNT",
          style: AppTextStyle.appBarStyle,
        ),
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.swcntImage,
                  ),
                ),
                const SizedBox(height: 20),
                "About SWCNT".textStyled(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black100,
                ),
                const SizedBox(height: 16),
                "Single-Walled Carbon Nanotubes (SWCNTs) are cylindrical nanostructures composed of a single layer of carbon atoms arranged in a hexagonal lattice. \n\nDue to their unique mechanical and electrical properties, SWCNTs have numerous applications in materials science, electronics, and nanotechnology."
                    .interStyled(fontSize: 15),
                const SizedBox(height: 20),
                "PROJECT OVERVIEW".textStyled(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black100,
                ),
                const SizedBox(height: 16),
                "This app is designed to analyze and monitor the non-linear internal flow-induced vibrations of pre-tensioned SWCNTs. By leveraging machine learning, the app predicts vibration behaviors based on user inputs."
                    .interStyled(fontSize: 15),
                const SizedBox(height: 20),
                Image.asset(
                  AppImages.overviewImage,
                ),
                const SizedBox(height: 16),
                "This tool is valuable for researchers and engineers working with nanomaterials, providing insights through real-time data visualization."
                    .interStyled(fontSize: 15),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BlackButton(
                      label: "View History",
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage())),
                    ),
                    const SizedBox(height: 16),
                    WhiteButton(
                      label: "Proceed to ML",
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryScreens())),
                    )
                  ],
                ),
                const SizedBox(height: 24)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
