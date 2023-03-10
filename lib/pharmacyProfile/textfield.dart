import 'package:flutter/material.dart';

class CustomPharmacyTextField extends StatefulWidget {
  final String label;
  final Icon? prefixIcon;
  int maxLines;
  bool obsecureText;
  final bool showSuffix;
  int padding;
  TextEditingController? controller;
  final TextInputType textInputType;
  Function(String)? onTextChange;

  CustomPharmacyTextField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.maxLines = 1,
    this.obsecureText = false,
    this.showSuffix = false,
    this.padding = 0,
    this.textInputType = TextInputType.text,
    this.controller,
    this.onTextChange
  });

  @override
  State<CustomPharmacyTextField> createState() =>
      _CustomPharmacyTextFieldState();
}

bool showText = false;

class _CustomPharmacyTextFieldState extends State<CustomPharmacyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: TextFormField(
        autofocus: false,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        onChanged: widget.onTextChange,
        keyboardType: widget.textInputType,
        obscureText: widget.obsecureText
            ? showText
                ? true
                : false
            : false,
        maxLines: widget.maxLines,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          letterSpacing: 0.3,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            // left: 10,
            // right: 10,
            top: widget.maxLines == 1 ? 2 : 25,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          prefixIcon: widget.maxLines == 1
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: widget.prefixIcon,
                )
              : null,
          prefixText: widget.maxLines == 1 ? '      ' : '',
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 20,
          ),
          suffixIcon: widget.showSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showText = !showText;
                    });
                  },
                  icon: Icon(
                    showText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          label: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
