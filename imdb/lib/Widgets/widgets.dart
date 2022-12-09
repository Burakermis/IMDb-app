import 'package:flutter/material.dart';

textFormField({
  required controller,
  required labletext,
  keyboardType,
  textInputAction,
  obscureText,
}) {
  return Material(
    elevation: 2,
    shadowColor: Colors.black,
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
    child: TextFormField(
      controller: controller,
      autofocus: false,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labletext,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        contentPadding: const EdgeInsets.all(8),
        border: InputBorder.none,
      ),
    ),
  );
}

materialButton({
  required onPressed,
  required text,
}) {
  return Material(
    elevation: 2,
    shadowColor: Colors.black,
    color: Colors.black,
    borderRadius: BorderRadius.circular(5.0),
    child: MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text(
          text,
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}