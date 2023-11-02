// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final GlobalKey<FormFieldState>? formFieldKey;
  final int minLines;
  final int maxLines;
  final int? maxLength;

  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.formFieldKey,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        key: widget.formFieldKey,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.textInputType,
        obscureText: isObscure,
        validator: widget.validator,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          labelText: widget.label,
          //isDense: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green, // Cor da linha de baixo quando não em foco
              // Espessura da linha de baixo quando não em foco
            ),
          ),
        ),
      ),
    );
  }
}
