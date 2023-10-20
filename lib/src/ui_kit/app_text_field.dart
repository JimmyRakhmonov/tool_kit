import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tool_kit/src/extensions/context.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final VoidCallback? onFieldTap;
  final TextEditingController? fieldController;
  final double? height;
  final double? width;
  final EdgeInsets? prefixPadding;
  final Widget? suffix;
  final TextInputType? textInputType;
  final Color? fillColor;
  final bool autoFocus;
  final FocusNode? focusNode;
  final void Function(String)? onChange;
  final List<TextInputFormatter> textInputFormatter;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final bool? alignLabelWithHint;
  final double radius;
  final TextInputAction? inputAction;
  final Widget? prefix;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final String? hint;

  const AppTextField(
      {Key? key,
      this.isRequired = false,
      required this.label,
      this.onFieldTap,
      this.fieldController,
      this.height,
      this.suffix,
      this.prefix,
      this.textInputType = TextInputType.text,
      this.fillColor,
      this.autoFocus = false,
      this.focusNode,
      this.onChange,
      this.prefixPadding,
      this.readOnly = false,
      this.textInputFormatter = const [],
      this.maxLength,
      this.validator,
      this.textCapitalization = TextCapitalization.none,
      this.maxLines = 1,
      this.alignLabelWithHint,
      this.radius = 8,
      this.inputAction,
      this.onFieldSubmitted,
      this.contentPadding,
      this.hintStyle,
      this.hint,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = fillColor != null ? fillColor! : context.background;
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        readOnly: readOnly,
        validator: validator,
        style: context.bodyLarge!.copyWith(fontSize: 16),
        onTap: onFieldTap,
        maxLength: maxLength,
        focusNode: focusNode,
        textInputAction: inputAction,
        controller: fieldController,
        keyboardType: textInputType,
        autofocus: autoFocus,
        inputFormatters: textInputFormatter,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        textCapitalization: textCapitalization,
        cursorColor: Theme.of(context).primaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          counterText: '',
          prefixIcon: prefix != null
              ? Padding(
                  padding: prefixPadding ?? const EdgeInsets.all(16.0),
                  child: prefix,
                )
              : null,
          isDense: true,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          filled: true,
          hintText: hint,
          labelText: '$label ${isRequired ? '*' : ''}',
          hintStyle: hintStyle,
          alignLabelWithHint: alignLabelWithHint,
          fillColor: bgColor,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle:
              context.labelLarge!.copyWith(color: context.primary),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.colorScheme.outline),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
