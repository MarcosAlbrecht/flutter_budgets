import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class NavigationTabs {
  static const int home = 0;
  static const int tickets = 1;
}

class NavigationController extends GetxController {
  late PageController _pageController;
  late RxInt _currentIndex;

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex.value;

  @override
  void onInit() {
    super.onInit();
    _initNavigation(
      pageController: PageController(initialPage: NavigationTabs.home),
      currentIndex: NavigationTabs.home,
    );
  }

  void _initNavigation(
      {required PageController pageController, required int currentIndex}) {
    _pageController = pageController;
    _currentIndex = currentIndex.obs;
  }

  void navigatePageView(int page) {
    if (_currentIndex.value == page) {
      return;
    }

    _pageController.jumpToPage(page);
    _currentIndex.value = page;
    // if (page == 2) {
    //   sincronizarController.loadDados();
    // }
    // if (page == 1) {
    //   ticketsController.loadDados();
    // }
  }
}
