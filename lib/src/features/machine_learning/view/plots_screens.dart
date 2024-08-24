import 'package:cnt_mobile/src/features/machine_learning/data/model/predict_response.dart';
import 'package:cnt_mobile/src/utils/components/widgets/cached_network.dart';
import 'package:cnt_mobile/src/utils/constants/colors.dart';
import 'package:cnt_mobile/src/utils/constants/textstyle.dart';
import 'package:cnt_mobile/src/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class PlotsScreens extends StatelessWidget {
  const PlotsScreens({
    super.key,
    required this.predictResponseData,
  });
  final PredictResponseData predictResponseData;

  @override
  Widget build(BuildContext context) {
    print("url list ==>>> ${predictResponseData.data2d?.mode3?.imageUrl}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plots",
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "2-D Plots of Deflection against Time at midpoint".textStyled(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkWidget(
                      imageUrl: predictResponseData.data2d?.mode1?.imageUrl ?? "",
                    ),
                    const SizedBox(height: 20),
                    CachedNetworkWidget(
                      imageUrl: predictResponseData.data2d?.mode2?.imageUrl ?? "",
                    ),
                    const SizedBox(height: 20),
                    CachedNetworkWidget(
                      imageUrl: predictResponseData.data2d?.mode3?.imageUrl ?? "",
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                "3-D Plots of Deflection against Time and Position".textStyled(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black100,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 240,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode1?.imageUrl?[0] ?? "",
                      ),
                      const SizedBox(width: 20),
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode1?.imageUrl?[1] ?? "",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode2?.imageUrl?[0] ?? "",
                      ),
                      const SizedBox(width: 20),
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode2?.imageUrl?[1] ?? "",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode3?.imageUrl?[0] ?? "",
                      ),
                      const SizedBox(width: 20),
                      CachedNetworkWidget(
                        imageUrl: predictResponseData.data3d?.mode3?.imageUrl?[1] ?? "",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
