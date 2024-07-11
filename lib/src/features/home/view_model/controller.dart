import 'package:cnt_mobile/src/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);
  List<Widget> navigationScreens = [
    const HomePage(),
    Container(),
    Container(),
  ];

  void selectedIndex(int index) {
    state = index;
  }
}
