import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0);

  void setIndex(int index) {
    state = index;
  }


}

///control the state of NavBarNotifier
final NavBarProvider =
    StateNotifierProvider<NavBarNotifier, int>(//<Class + Type of State>
        (_) => NavBarNotifier());