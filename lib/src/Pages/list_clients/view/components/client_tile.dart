// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_orcamento/src/pages_routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:app_orcamento/src/models/client_model.dart';
import 'package:get/get.dart';

import '../../../../Config/custom_colors.dart';

class ClientTile extends StatefulWidget {
  final ClientModel clientModel;

  const ClientTile({
    Key? key,
    required this.clientModel,
  }) : super(key: key);

  @override
  State<ClientTile> createState() => _ClientTileState();
}

class _ClientTileState extends State<ClientTile> {
  IconData icon = Icons.edit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              PagesRoutes.clientRoute,
              arguments: {'client': widget.clientModel, 'mode': 'view'},
            );
          },
          child: Card(
            color: CustomColors.backgroundColorLight,
            elevation: 5,
            shadowColor: CustomColors.shadowColorGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //nome
                  Text(
                    '${widget.clientModel.firstName!} ${widget.clientModel.lastName!}',
                    style: TextStyle(
                      fontSize: CustomFontSizes.fontSize16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          widget.clientModel.email!,
                          style: TextStyle(
                              color:
                                  CustomColors.shadowColorGrey.withAlpha(255),
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSizes.fontSize12),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          widget.clientModel.phone!,
                          style: TextStyle(
                              color:
                                  CustomColors.shadowColorGrey.withAlpha(255),
                              fontWeight: FontWeight.bold,
                              fontSize: CustomFontSizes.fontSize12),
                        ),
                      )
                    ],
                  )
                  //unidade preço
                ],
              ),
            ),
          ),
        ),
        //Botao add ao carrinho

        Positioned(
          bottom: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  Get.toNamed(
                    PagesRoutes.clientRoute,
                    arguments: {'client': widget.clientModel, 'mode': 'edit'},
                  );
                },
                child: Ink(
                  height: 45,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: CustomColors.backgroundColor2,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
