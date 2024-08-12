import 'package:flutter/material.dart';
import 'package:boilerplate/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData prefixIcon;
  final IconButton? suffixIcon;
  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isPrefixIcon;
  final bool? isSuffixIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: isObscure,
        maxLength: 25,
        keyboardType: inputType,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.eggShell,
            hintText: hint,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal
              ),
            errorStyle: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontFamily: 'Poppins'),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            errorText: errorText,
            counterText: '',
            prefixIcon: isPrefixIcon ? Icon(prefixIcon, color: iconColor) : null,
            suffixIcon: isSuffixIcon != null ? suffixIcon : null
            ),
      ),
    );
  }

  const TextFieldWidget({
    super.key,
    required this.prefixIcon,
    required this.errorText,
    required this.textController,
    this.suffixIcon,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isPrefixIcon = true,
    this.isSuffixIcon,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.black,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  });
}