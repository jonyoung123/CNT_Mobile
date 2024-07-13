import 'package:cnt_mobile/src/features/home/home.dart';
import 'package:cnt_mobile/src/features/machine_learning/view/view.dart';
import 'package:cnt_mobile/src/features/settings/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);
  List<Widget> navigationScreens = [
    const HomePage(),
    const ProjectDataScreen(isNavigation: true),
    const ProjectSettingsScreen(),
  ];

  void selectedIndex(int index) {
    state = index;
  }
}
