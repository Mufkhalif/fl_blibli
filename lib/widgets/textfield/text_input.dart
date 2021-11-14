import 'package:fl_blibli/theme/theme.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
    required this.placeholder,
    required this.isPassword,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  final String placeholder;
  final bool isPassword;
  final Function(String) onChanged;
  final String? errorText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  Color _bgColor = inputPlaceholderColor;

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(
              () => _bgColor = hasFocus ? Colors.white : inputPlaceholderColor);
        },
        child: TextFormField(
          onChanged: (value) => widget.onChanged(value),
          obscureText: widget.isPassword && _passwordVisible ? true : false,
          decoration: InputDecoration(
            errorText: widget.errorText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            // filled: true,
            fillColor: _bgColor,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            labelText: widget.placeholder,
            hintStyle: const TextStyle(
              fontFamily: "Effra",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: inputPlaceholderColor,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: primary,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Effra",
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
