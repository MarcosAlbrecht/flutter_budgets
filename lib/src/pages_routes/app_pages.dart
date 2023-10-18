import 'package:app_orcamento/src/Pages/base/binding/nagivation_binding.dart';
import 'package:app_orcamento/src/Pages/base/view/base_screen.dart';
import 'package:app_orcamento/src/Pages/home/view/home_tab.dart';
import 'package:get/get.dart';

import '../Pages/list_clients/binding/clients_binding.dart';
import '../Pages/list_clients/view/clients_tab.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
      bindings: [
        NavigationBinding(),
        UsersBinding(),
      ],
    ),
    GetPage(
      name: PagesRoutes.homeTab,
      page: () => const HomeTab(),
    ),
    GetPage(
      name: PagesRoutes.usersRoute,
      page: () => const UsersTab(),
      binding: UsersBinding(),
    )
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String homeTab = '/hometab';
  static const String usersRoute = '/usersroute';
}
