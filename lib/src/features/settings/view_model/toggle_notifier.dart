import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchProvider = StateNotifierProvider<BranchSwitchNotifier, bool>((ref) {
  return BranchSwitchNotifier();
});

class BranchSwitchNotifier extends StateNotifier<bool> {
  BranchSwitchNotifier() : super(false);

  void toggleSwitch(val) {
    state = val;
  }
}
