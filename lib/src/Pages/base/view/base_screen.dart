import 'package:app_orcamento/src/Pages/base/controller/navigation_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

import '../../../config/custom_colors.dart';
import '../../home/view/home_tab.dart';
import '../../list_clients/view/clients_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: const [
          HomeTab(),
          UsersTab(),
          //TicketsTab(),
          //TicketsSincronizeTab(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => SnakeNavigationBar.color(
          onTap: (index) {
            navigationController.navigatePageView(index);
          },
          //type: BottomNavigationBarType.fixed,
          snakeShape: SnakeShape.circle,
          behaviour: SnakeBarBehaviour.floating,
          padding: const EdgeInsets.all(10),
          //padding = EdgeInsets.zero;
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          snakeViewColor: CustomColors.white,
          backgroundColor: CustomColors.backgroundColor2,
          selectedItemColor: CustomColors.black,
          unselectedItemColor: CustomColors.white,
          currentIndex: navigationController.currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.currency_exchange_outlined,
            //     size: 35,
            //   ),
            //   label: 'Orçamento',
            //),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_outlined,
                size: 25,
              ),
              label: 'Clientes',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person,
            //     size: 35,
            //   ),
            //   label: 'Perfil',
            // ),
          ],
        ),
      ),
    );
  }
}
