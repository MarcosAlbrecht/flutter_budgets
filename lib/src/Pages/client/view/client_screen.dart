import 'package:app_orcamento/src/Pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Altura da AppBar personalizada
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
            iconTheme: IconThemeData(
              color: CustomColors.white,
            ),
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
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: const Column(
            children: [
              CustomTextField(
                label: "Primeiro nome",
                icon: Icons.people_alt,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
