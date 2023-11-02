import 'package:app_orcamento/src/Pages/client/controller/client_controller.dart';
import 'package:app_orcamento/src/Pages/common_widgets/custom_text_field.dart';
import 'package:app_orcamento/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/custom_colors.dart';
import '../../../utils/utils_services.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final utilServices = UtilServices();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<ClientController>(
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //text first name
                            CustomTextField(
                              readOnly: !controller.isInserting.value &&
                                  !controller.isEditing.value,
                              initialValue: controller.clientModel.firstName,
                              label: "Primeiro nome",
                              icon: Icons.person,
                              validator: fisrtNameValidator,
                              onSaved: (value) {
                                controller.clientModel.firstName =
                                    value.toString();
                              },
                            ),
                            //text last name
                            CustomTextField(
                              readOnly: !controller.isInserting.value &&
                                  !controller.isEditing.value,
                              initialValue: controller.clientModel.lastName,
                              label: "Sobrenome",
                              icon: Icons.person,
                              validator: lastNameValidator,
                              onSaved: (value) {
                                controller.clientModel.lastName =
                                    value.toString();
                              },
                            ),
                            //text email
                            CustomTextField(
                              readOnly: !controller.isInserting.value &&
                                  !controller.isEditing.value,
                              initialValue: controller.clientModel.email,
                              label: "Email",
                              icon: Icons.email,
                              textInputType: TextInputType.emailAddress,
                              validator: emailValidator,
                              onSaved: (value) {
                                controller.clientModel.email = value.toString();
                              },
                            ),
                            //text phone
                            CustomTextField(
                              readOnly: !controller.isInserting.value &&
                                  !controller.isEditing.value,
                              initialValue: controller.clientModel.phone,
                              label: "Telefone",
                              icon: Icons.phone,
                              textInputType: TextInputType.phone,
                              validator: phoneValidator,
                              maxLength: 11,
                              onSaved: (value) {
                                controller.clientModel.phone = value.toString();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: controller.isInserting.value ||
                        controller.isEditing.value,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            backgroundColor: CustomColors.customGreen,
                          ),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await controller.handleSaveClient();
                            } else {
                              utilServices.showToast(
                                message: 'Verifique os campos obrigatórios!',
                              );
                            }
                          },
                          child: controller.isSaving.value
                              ? CircularProgressIndicator(
                                  color: CustomColors.customBlueColor,
                                )
                              : const Text(
                                  'Salvar',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
