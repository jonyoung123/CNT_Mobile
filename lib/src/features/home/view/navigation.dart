import 'package:cnt_mobile/src/features/home/home.dart';
import 'package:cnt_mobile/src/utils/constants/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CNTNavigation extends ConsumerStatefulWidget {
  const CNTNavigation({super.key});

  @override
  ConsumerState<CNTNavigation> createState() => _CNTNavigationState();
}

class _CNTNavigationState extends ConsumerState<CNTNavigation> {
  @override
  Widget build(BuildContext context) {
    int index = ref.watch(navigationProvider);
    return Scaffold(
      body: ref.watch(navigationProvider.notifier).navigationScreens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 20),
            activeIcon: Icon(Icons.home_outlined, size: 20),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined, size: 20),
            activeIcon: Icon(Icons.local_library_outlined, size: 24),
            label: "MLearning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 20),
            activeIcon: Icon(Icons.settings, size: 20),
            label: "Settings",
          ),
        ],
        onTap: ref.read(navigationProvider.notifier).selectedIndex,
        currentIndex: index,
        selectedLabelStyle: AppTextStyle.selectedLabelStyle,
        unselectedLabelStyle: AppTextStyle.unselectedLabelStyle,
        selectedFontSize: 16,
        unselectedFontSize: 15,
      ),
    );
  }
}
