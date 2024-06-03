import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String label;
  final String? initialValue;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController? textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color errorColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool enabled;
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
        initialValue: initialValue,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        maxLength: 25,
        keyboardType: this.inputType,
        style: Theme.of(context).textTheme.bodyLarge,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
            labelText: this.label.isNotEmpty ? this.label : null,
            hintText: this.hint,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: hintColor),
            errorText: errorText,
            errorStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: errorColor),
            counterText: '',
            icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
        enabled: this.enabled,
      ),
    );
  }

  const TextFieldWidget({
    Key? key,
    this.enabled = true,
    this.icon,
    this.errorText,
    this.textController,
    this.inputType,
    this.hint,
    this.label = "",
    this.initialValue,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.errorColor = Colors.red,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
    this.validator,
    this.onSaved,
  }) : super(key: key);
}
