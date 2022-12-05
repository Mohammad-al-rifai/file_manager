// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField({
    super.key,
    required TextEditingController? controller,
    required TextInputType? type,
    required Function? validate,
    required String? label,
    required IconData? prefix,
    IconData? suffix,
    Function? onSubmitted,
    Function? onChanged,
    Function? onTap,
    bool isPassword = false,
    Function? suffixPressed,
  });

  TextEditingController? controller;
  TextInputType? type;
  Function? validate;
  String? label = '';
  IconData? prefix;
  IconData? suffix;
  Function? onSubmitted;
  Function? onChanged;
  Function? onTap;
  bool isPassword = false;
  Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (value) {
        if (validate != null) {
          validate!(value);
        }
        return null;
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value);
        }
      },
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: () {
                  if (suffixPressed != null) {
                    suffixPressed!();
                  }
                },
              )
            : null,
      ),
    );
  }
}
