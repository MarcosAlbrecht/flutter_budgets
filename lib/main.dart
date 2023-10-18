import 'package:app_orcamento/src/Pages/base/controller/navigation_controller.dart';
import 'package:app_orcamento/src/Pages/base/view/base_screen.dart';
import 'package:app_orcamento/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'src/Config/custom_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Get.put(NavigationController());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Budgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CustomColors.customSwatchLightBlueColor,
        scaffoldBackgroundColor: CustomColors.white,
      ),
      initialRoute: PagesRoutes.baseRoute,
      getPages: AppPages.pages,
    );
  }
}
