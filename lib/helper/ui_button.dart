import 'package:flutter/material.dart';

class CustomButton {
  static void Button(String text, Color color) {
    ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(60),
          elevation: 1,
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
            letterSpacing: 2,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
    );
  }
}
