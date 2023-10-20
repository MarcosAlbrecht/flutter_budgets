import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Altura da AppBar personalizada
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CustomColors.backgroundColor2,
                CustomColors.backgroundColor2.withAlpha(195),
                CustomColors.backgroundColor2.withAlpha(180),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors
                .transparent, // Define o fundo da AppBar como transparente
            centerTitle: false, // Centraliza o título

            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
            toolbarHeight: 70,
            elevation: 0, // Remove a sombra da AppBar
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá,',
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: CustomFontSizes.fontSize22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Marcos',
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: CustomFontSizes.fontSize24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 50.0),
                  child: Center(
                    child: Text("Texto"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: const Center(
            child: Text("Tela Inicial"),
          ),
        ),
      ),
    );
  }
}
