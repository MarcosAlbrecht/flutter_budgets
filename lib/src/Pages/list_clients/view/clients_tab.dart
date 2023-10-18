import 'package:app_orcamento/src/Config/custom_colors.dart';
import 'package:app_orcamento/src/Pages/list_clients/view/components/client_tile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/clients_controller.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UsersTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // Altura da AppBar personalizada
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
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors
                .transparent, // Define o fundo da AppBar como transparente
            centerTitle: true, // Centraliza o título
            title: Text(
              "Clientes",
              style: TextStyle(
                color: CustomColors.white,
                fontWeight: FontWeight.bold,
                fontSize: CustomFontSizes.fontSize24,
              ),
            ),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GetBuilder<ClientsController>(
                builder: (controller) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, int index) {
                        return ClientTile(
                          clientModel: controller.allClients[index],
                        );
                      },
                      separatorBuilder: (_, int index) => Container(height: 10),
                      itemCount: controller.allClients.length,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
