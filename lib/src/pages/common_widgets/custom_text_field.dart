import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final String label;
  final String? hintText;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.label,
    this.hintText,
    this.isSecret = false,
    this.inputFormatters,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
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
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        obscureText: (isObscure),
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          prefixIcon: (widget.icon != null ? Icon(widget.icon) : null),
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
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          labelText: (widget.label),
          hintText: (widget.hintText),
          labelStyle: const TextStyle(
            color: ColorsUtil.greenMaterialPrimary,
          ),
        ),
      ),
    );
  }
}
